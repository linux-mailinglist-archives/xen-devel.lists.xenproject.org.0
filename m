Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (unknown [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E2A533C93
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 14:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337218.561752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntq6O-00037y-P8; Wed, 25 May 2022 12:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337218.561752; Wed, 25 May 2022 12:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntq6O-00036C-MC; Wed, 25 May 2022 12:27:00 +0000
Received: by outflank-mailman (input) for mailman id 337218;
 Wed, 25 May 2022 12:26:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIRJ=WB=citrix.com=prvs=137d214fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ntq6N-000366-Jl
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 12:26:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f109ce91-dc25-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 14:26:47 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 08:26:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN6PR03MB3486.namprd03.prod.outlook.com (2603:10b6:805:44::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 12:26:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 12:26:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f109ce91-dc25-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653481617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=g+ltSAf0hNsTH42IPXobA/Xf5mHRQIriahmyN3iiPhk=;
  b=XSHL03MONo4TChZe7TCK0T4UmDmV6jLnUn1Fl1LQppZ3r7ciwlihT6dY
   ezNhxCKvU8LnsKZpHPThjVShWFQbHO3FzYHJYjVYDNmViiEaQ8dwxDCis
   RwhJ2WvZh/kvp+olvy5RKtfGO5MeRBoiGAGDKmFeCiPm7lu7CtZ5iwN5F
   Q=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 72138993
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NDWApawNakRQJ80cnFd6t+f4xyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 TceD2qGbquMZTbxc9siaoyypxsEu5/Wy9IwTgporSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY124XhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplkZWqRhoKBP31iuE+dRt+Lh4iHIhs5+qSSZS/mZT7I0zuVVLJmq8rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtadHeOWure03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9wjM/vpmsjO7IApZgYD3Ntb8XNa2X59Ohledv
 T3/9E/fDURPXDCY4X/fmp62vcfNgCf6VYQ6BLC+sPlwjzW73XcPARcbUV+6p/iRiUOkXd9bb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehtd7zGSZmtrHTbHuH76qVthu7Iy1TJmgHDQcfUQYL6t/k5povhxjCStJiFq+dntzxGDfgh
 TuNqUADa647iMcK0+C+4grBijf1/JzRFFZpuUPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytalUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:VmSI7qnKhx+AyMHNACXCdl1Q1C7pDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1GnnKp
 gdMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72138993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5k9i+/o7tH8ImyXFmOb1ZgsFqQGFymI04YHU3LL+m4q71l3P82TMoh3BMbf5EN+scSoXmbspMYy9oD1aCjFoyce799VlWq0aP7MayQW998ZRatvY3wIgrplG4owMehQ6QkU6QKWHmNVFTgWNZO3moE5WE2xlFM9nlZgG+JPrBxH3lfGg80uBfVPiFTRNegf8r2oursaGuNHximk5yOCa7+Sr0Z64umAZ8eiPoLR3UNaejgIa4SeetoS7x9bQl0Dhz+Tcrkdlp43vp3AsvZZHaFzWPQJbCaXOnHyI9cJ2Ekwaa/c5f1xlwKB+Wyyl0zYnuiOOMj0NtVwMmOMJltiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+ltSAf0hNsTH42IPXobA/Xf5mHRQIriahmyN3iiPhk=;
 b=cola90yrugN5ZiImIVAGNy8c2l8et5MgDFiKC4pBhe/+yFN7AoA+CpvgGqG9WH3iHupRoNl04B5MVYgpag3NunkwB8oKjz5mkCEWOS9x9MMjH6+hulUf/wbso071IWtElsca0hz77gRK6nyllDFSuKKfSqsSyUQ9vonmBqmN2qGdvK2R4TmJehFJuRC5vco8k3Hxyc/+E/RbdGqiUDljagMsiI7pDHEOvKUIitdtTeVyyYkCvP4fMr9sybrnGm6LalFDWQXshRl8Ay+y0yy2CfgtNWVyOV495xWaK/5G43Nd82rnEz/1TpQYQrmT14ZIEjBuFluT+pseOFSkxfHjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+ltSAf0hNsTH42IPXobA/Xf5mHRQIriahmyN3iiPhk=;
 b=v8zdGRCw+PWn6MsJxp6IBw/dF0FAwrcPD1FAVzZKVoq4ZKdP1t/rSfuyAS48/Oa0+KM4iLJRSgC/dhBMDdki11CgY0SZDQyh+A8zI8LfexJmV220S8HfcszDPQVgbOIwYflxKfYu/fp4iq8lPwpvfUeJDC3iT9LKs/7nk+TWoHs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 2/2] docs/misra: add Rule 5.1
Thread-Topic: [PATCH 2/2] docs/misra: add Rule 5.1
Thread-Index: AQHYb89TxrziQNGv2kS6zZB5pXc3gq0vNeEAgABP7QA=
Date: Wed, 25 May 2022 12:26:53 +0000
Message-ID: <875b1cc9-acd1-1790-c2b4-065421e1ed78@citrix.com>
References:
 <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-2-sstabellini@kernel.org>
 <a938b2e2-63cd-9659-2204-f622d7df2b98@xen.org>
In-Reply-To: <a938b2e2-63cd-9659-2204-f622d7df2b98@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18ad12bf-82d1-4af9-e85a-08da3e49d9ab
x-ms-traffictypediagnostic: SN6PR03MB3486:EE_
x-microsoft-antispam-prvs:
 <SN6PR03MB3486A85E7903693AC0A19BC4BAD69@SN6PR03MB3486.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 srQkCaJKrmhgCNxp8hIx13jY3jslA2+uPxxkOduuore+lqTE56JBuSWyDb0quC/2NkzygJuLFd1TCdevrUZdimpM9HKbH9UpdeYgLxscHVfX64WvACy3LDroeDg34Y17w3pcUuNucQ3p9TW13kseReU54ot1zIHZV2mEGVwC9HhKI3G/XN4pBEDrBwrBl+izImBk2JioZiUThI3Ca+iStBPrKhnLlt9otqbkUpPsgScgF8KiisH7XDaiVcbA3Fdg9i9kncxuYF6SVWj3SxUOT0IxX2IGjt6mA/SKC+a6IPawW9wyU86dEA2HsMdr0Dcy48NJpOUCzzd0fHLZn5pWP+lmJBYF2bVL0n9SofsBOAQCJGvTG9dCHT56M6s2Cp9alXJkIY6TNaqw5Mhrnlo9qXRDhV8N0pz/EphRbTG0fZBwTNA4RJu6BC9o7gu3nNYSzzRZTr0kDy4D74M8191OdoFEuL68sFxa5IsyDcBlGMouphqMst/U/RswHdKIhY1llo8h1zpz6cKTyoYPLP4QIccFRYyopwd2AESVJ02UyiqOdpSMEZfFXPdOSEx/SZx7Y/6oO28O1rgExlAwp/mmrg5bRNLtpy1c4kcYgDdn2zgAi4iZEzpncxLYl0rda8nfg4z7I+EimkKIPw0x7HJZ2VIeTV+3ZsNN9RxdHZzI84BhrCWOEN2IhVS/zRHlqSJdwMxc+vpmOvwyFX1mohCReAPWhqsZ4HCNN70aUcVC6Cg2VFoPeEP3GO5Eebc02PeSkonT5ZqDxO/4i0me8yJp5Uhz6cqv8mnQzNibRnif8p22e09hrdizS2nvbHnEhFSw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(53546011)(83380400001)(186003)(26005)(2616005)(4326008)(6506007)(4744005)(5660300002)(508600001)(8936002)(6486002)(38070700005)(86362001)(31686004)(36756003)(6512007)(66946007)(66476007)(64756008)(66446008)(76116006)(91956017)(8676002)(71200400001)(122000001)(2906002)(38100700002)(31696002)(316002)(82960400001)(110136005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFNUbDByZ1g0bjk5aUtFTXRFNTlaamxmYVczWlFWcU5JQzBMbElyQ3VrVko4?=
 =?utf-8?B?SzRzbWw4QUlFQk0rTjJIK2dHenB5dlVtUmRxakcwbGI2d1RUZk5rRnhGd0xQ?=
 =?utf-8?B?NU45V3YvSkY5ZXdVQzJ6TEFNL1JMRlVzdXdrclcreUdoZkp2eDg2cThvMmlo?=
 =?utf-8?B?b2xVRktlc0RoOStVMXhUNkowcUR4VFJPNjlvb25zVUoyV2krQXNMa0JyeFd6?=
 =?utf-8?B?WEE0MW9leEhVQUI3S3habTBEd3NNUWZWWWxaYVd1bC9lM2E1MnducExmbFFC?=
 =?utf-8?B?OFV2N3NKQ0poMGJZRzRJZjF3N0hMQno1bGh5eUZCMTFVNnZ4SVpMeVd5UkVs?=
 =?utf-8?B?c2tTdWVCRkE1Q3ljaXNacDlwaG1Jd1MzS3B2UFZnZGZEdU5OWmI2V2svOHFS?=
 =?utf-8?B?cFNnSk1iL1pidmJCZjFpU1duZUxJVGJVdWJXVFVlQlQyMlovWTBjbGpZMDl2?=
 =?utf-8?B?emFvb255LzA1K0NvK1NUblRLMjFsMDMveWJkY1pUOFJpcVN1eXd2U2xGRU9w?=
 =?utf-8?B?eDBYOVQ3d2ZPeXV2YnBFYVhDa3FKRWQxYkl0aXp6NXMvb0gvOTdVdW1zRXB2?=
 =?utf-8?B?OWlPQVRYL3BFNEtXblFSRmE1Unl6c3VtcGpKcThUbzNLUXBuaGJlckJOYmN2?=
 =?utf-8?B?SUs0S2tLMENScXZSamUvNVR0RlFoSDZRVlNlblhJSXg2ZEwrd0w2TGhVYzhQ?=
 =?utf-8?B?OXFzUTJWcHVSQWhPbElCbkN2WmpCc3NjNkxjREF4ZWgvYWJhdEtyVDByaWYv?=
 =?utf-8?B?c0NyUVlvY1pRaGRGQ01mSTdxSk1MZ0lDVkNjQlVOT1ZyK3NDN2kwVVN3UEFG?=
 =?utf-8?B?QnRVTjMzejMzdFNqQWF6WWlpWS9QSkFOQ1orbTVmdXVLV1N5Und0WTR2dFJv?=
 =?utf-8?B?NHE2L1laOVpVYlpJT28rMXNiNWwrOHkxTnZ2VUtIZHJRSisranZWUnA1b0wr?=
 =?utf-8?B?WUNoQktkL0lVRUpvanV4TlVhbUNWQjNmWHd2Z1dQcUtlRDl5cHNHem9NNTZn?=
 =?utf-8?B?OVJHWjEwa1g0VDljR3ByL2JYOVphK2VMM2pBOFlCUTZNREhvdnJsZ2V3eTZB?=
 =?utf-8?B?Q0wxZDdWL295R2JUM0RsSk9tR29zUklqcHBqR1UvREVmclViU2FxeTVZZjll?=
 =?utf-8?B?eDFldWZ2RURMYzExVHJaZTVZZjdXQ0ZnaS83YzRmZ3FuSWtCZVhwaXJub0ph?=
 =?utf-8?B?L0VDL2RRK1JyS2oyMHBQNHpnaGRCL1dwWDZ5ZGI1c3YxWm9yK0JUZW1OZXpk?=
 =?utf-8?B?Yy8yUTVkYnptTklwZDJXd1NNcnZzNzk3MThEZHh4TDJNQVYvZ0djeEFuY3Uz?=
 =?utf-8?B?WndPd3NrWHlpSkYzOUJWSFpXZjFaVHp1ZVFLLzFsY0R6a1Nqd1hUM2hKNzkv?=
 =?utf-8?B?RnB0c0FQQnVjcSsxL3ppU0lIWVdQeDBIeDFLdlIxK0p6NnRwQTRnaVFVQXhh?=
 =?utf-8?B?Mm9nZ1J2T0doUVIvU2RGQmluOHFTS0JWMjBSVmFSZi96alEwVHhFRE9jMzZz?=
 =?utf-8?B?Rk4wU1NEYTFtNXZFbjJSQmhmako2S3JnYkhLZHNRbFd1UXFsRk42U1pQVXc5?=
 =?utf-8?B?Z0ROUUc3VVpya2JQUFNHcEpLNlgyNFJsZThqdThIWG9WY0xiQTBKWGUzak50?=
 =?utf-8?B?Rm9DQjJmVndxSFovMnFxQ01Na0l1L3Y0d2ZqR2dDdWYwVnlwV2JWS3pEMGhu?=
 =?utf-8?B?K1U4OXN5RHNXVEZ6YW9JY0hOT2o5d0ZtVm16dUJXYTZWUnp0dVdacFVrditO?=
 =?utf-8?B?dkJBdTdoWnQrbVlWVmlJSmRsanNOUW9jSXFnYVpSY0c3Si83SzBOM2M1cG13?=
 =?utf-8?B?Tjh5cXd3NUl4UEsvZ0tKTzlMbGFiODZqQ3dYYVhOeVBUZkdzeEFEL2hFR0JB?=
 =?utf-8?B?Ykk5RmlNSjdxeW11ZjAvY29Pb3NaL3Jibm0vSjd6Mms1QU9XemU5Ri9sNTlm?=
 =?utf-8?B?T0VqejJNU2p2VkpqclJ5bk1TNUF4cE5DNEorWmt0WmV4L0w0L2t5TEJSdm56?=
 =?utf-8?B?UEo0V3RFd201RjNsYUxER1piYzhkWWd5Vld3ODJHVEd5eG5LamdvUkszOW9a?=
 =?utf-8?B?V3ZFcVByUmNkSk96TEJ6ZWJkV2Q5dUxDTnB6eHR2K1VvU21LcDQrNEx2Sk1k?=
 =?utf-8?B?My91LzJyMnA5azM1VWVsV0xxeHRGWWhjSFgxZHIzc202STl0RG5OQkt2UE1T?=
 =?utf-8?B?bzVERzZjenlDa1RtZ1BoT1JqK0FycWJTbkM4VnpYOUlFZnV1aVlobEpIQThR?=
 =?utf-8?B?WWV5Q3Q2UjF1Qm90RXFJSHFGbHFWdlg0WXg0OTZXNjNZNll2U3dySERYWGhN?=
 =?utf-8?B?eXQ1T25Hd0U5YVFrWktyTXpXemI2ZG5KbFQ1YysrcEorUXQrcmJIcUlZMmNx?=
 =?utf-8?Q?1qxQVVV0t+KIKKn0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC11BFFD7B24C14582CF466FB60B04E2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ad12bf-82d1-4af9-e85a-08da3e49d9ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 12:26:53.1334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdxDsXgTvpaJhFrbEQEQv3T3zx19ekkw0H8T45UVA39mTfAp8coeMtNn66rCEtAYMfuJnJFB8ca6Fvk50bS/XLUsyyGqdEq+D1OuO5JW7/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3486

T24gMjUvMDUvMjAyMiAwODo0MCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MjUvMDUvMjAyMiAwMTozNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gRnJvbTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4+DQo+PiBB
ZGQgUnVsZSA1LjEsIHdpdGggdGhlIGFkZGl0aW9uYWwgbm90ZSB0aGF0IHRoZSBjaGFyYWN0ZXIg
bGltaXQgZm9yIFhlbg0KPj4gaXMgNjMgY2hhcmFjdGVycy4NCj4NCj4gNjMgaXMgYSBiaXQgYW4g
b2RkIG51bWJlcnMuIFdoeSBub3QgNjQ/DQoNCkJlY2F1c2Ugb2YgdGhlIE5VTCB0ZXJtaW5hdG9y
IGluIGEgcG93ZXItb2YtMiBidWZmZXIgaW4gdGhlIGNvbXBpbGVyLsKgDQpUaGF0J3Mgd2h5IGFs
bCBvZiB0aGVzZSBzcGVjIGxpbWl0cyBleGlzdCBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNCn5BbmRy
ZXcNCg==

