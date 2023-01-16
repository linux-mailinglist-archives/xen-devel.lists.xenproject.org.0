Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7066D114
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 22:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479003.742569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHXKc-0008Tr-GH; Mon, 16 Jan 2023 21:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479003.742569; Mon, 16 Jan 2023 21:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHXKc-0008R0-Cr; Mon, 16 Jan 2023 21:47:54 +0000
Received: by outflank-mailman (input) for mailman id 479003;
 Mon, 16 Jan 2023 21:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHXKa-0008Qu-Ko
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 21:47:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aead30e-95e7-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 22:47:50 +0100 (CET)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 16:47:46 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4995.namprd03.prod.outlook.com (2603:10b6:408:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 21:47:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 21:47:44 +0000
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
X-Inumbo-ID: 6aead30e-95e7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673905670;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=d1bDsOmjl8xN+I4QgWWPB1S7LLb3MDkQBMx+iuLiCV0=;
  b=X7qMt7LmlfZ9ZbL+gyzDUcyPnWpaU0lAeEeHqSjrSerhkEXIFEPYdXmt
   q/zWjR8RQq81eNHE4G7t/wsc+JBjhV1rVZJzUlL4NKXDPcyLJKnJPGNoh
   D4x1UR1ufMmZqKkpxNNQ+iqPccTJKjPZEW0CnQ4lWvmMklg/UC9wWCVFv
   E=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 92925505
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6gfwta3ALkKcrozBD/bD5U5wkn2cJEfYwER7XKvMYLTBsI5bpzNTy
 WcdUT/TOveIY2ahc4t/aoXl8B8AsMXTnYNhGwRkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVnO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfO1hir
 swxDx43UUqvofzr/5CDFexqmZF2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1AZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKhCdhPSeXlnhJsqHKymkFCARoRbmnhvuSirXaffd5NA
 nVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8ztLSxitvuSU3313rWJqTK/PwAFIGlEYjULJSMJ7NXur5s6pg7eRdZkVqiuh5v6Hi+Y6
 zySty0/m7U7hNYGzbmm5kvAhy+wp5/PVUg+4QC/dmCs6A9jdZOmT4Ot4Fnfq/1HKe6xXlSH+
 XQJhcWaxOQPFo2W0jyARv0XG7Ok7OrDNyfT6WODBLEk/jWpvnKmI4ZZ5WgnIF8za5lYPzj0f
 EXUpAVdoodJO2enZrN2ZIT3DNk2ya/nFpLuUfW8gsdyX6WdvTSvpElGDXN8FUi3+KTwucnT4
 aumTPs=
IronPort-HdrOrdr: A9a23:z5rIOKDI75avPkPlHejpsceALOsnbusQ8zAXPiFKOGlom6mj/K
 6TdZsgtSMc9wxhJE3I9ergBEDiewKuyXcK2/hyAV7KZmCP0ldAR7sSjrcKrQeQfhEX/YZmpN
 hdm8AVMrHN5TMRt6nHCMbTKbsd6ejCyYTtodr3i05qSwQCUdAT0++6YDzrbHGfgGN9dOoE/F
 /33Ls3m9PaQwVyUu2LQkMdWvTFpZnijYuOW29+OzcXrDOWiC+u6vrQDxic034lIk5y6IZny3
 HBjwv6ooKqt/3T8G6660bjq65OncfnyJ9kGsuBkaEuW1PRozftXp1lR7qB+AoUjYiUmS4Xue
 iJmQ4kI8Nwr0ncZX64ujzk3wWI6kdU11bSjWWAhGflo4jHSCkhC8xH7LgpCCfk1w==
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="92925505"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY70pNa8g0kEy5qVRqSsS+n7OXaPnj6yBQNfUZ9XiES6ph7m+nYOqV3PiL6Hd6+7rOKrgwg/6Zir3B/EZj4U79UxCsQN+gMGYdqEDD8ekxyORElOZ97sINsGrBBAlqELFlBWmgyERyZbtceypi+evLzFJstFP2r5ifLe+y1DN1kiOCLQxldm5Pi31A5+jH+tRojfdN8Q7Vs8vbMHi2piskPOkECSbe7CaCmh/ARbG/f3NhtGCWVuOGiVgJ9xFxRQJRxkkSe4HYOIWVwKxbHGmzNp6xd9d3TQWO2ewJZolbXk8RT9c2omzz9FB3NoOlDU1rBswU0swdhqTBoWyvMiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1bDsOmjl8xN+I4QgWWPB1S7LLb3MDkQBMx+iuLiCV0=;
 b=biiUXJShUpFBoJWfoBhZxMdrCNvwrUd0QVdVhPqxXqESEFilvKXdP1RQVR/3O7en04TFYLmlU8VJztNMaQhZW3tl7+EfLluN+EvWSrcE0/z2guWbuGxmx44vKqUS0elggZDV/mzqudDyKi2ad9TDNGsJotB4QledIjitSIhlEPOXFtW4eTBuvkNUfqW74tshX/aKn9fWdYsfYjwCRkM9gi4TonSgqm55pk/pi2OoaEmyw1+lL2tPUGSYiS1NlYXvHWtBT3Kqj9Mk2e9bRCTB/rnKRdflYOd/hgfU7Eu8vhheDUU+Lyhw9f5hkr856NSpukUQLRUhHqyu7JP9cfbX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1bDsOmjl8xN+I4QgWWPB1S7LLb3MDkQBMx+iuLiCV0=;
 b=U9/EAQ2vG3cEDUv9e6pNTa+pKAYLdlZK7jmxoBv5tB9EtEHOEXyKlFpimYKpi8Rsrt9lxYAeQ++5DCGy40dCNe/c+bpeSjRy1Mt5fk83jPghY8i6ZBtxWacULGZPV+3j4cp8dyVThh+wyPuBikENYaonbm+XT9j7cASEJWn0Vi0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_*
 subops
Thread-Topic: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_*
 subops
Thread-Index: AQHZJ6P9s5HCoeqlF020fKh7orvbwa6hOboAgABfUgA=
Date: Mon, 16 Jan 2023 21:47:44 +0000
Message-ID: <2d3dc0ef-4920-2bc8-6ffd-6b954fc8c68a@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-4-andrew.cooper3@citrix.com>
 <5ebe5337-f84e-12a1-e8a0-92832100946d@suse.com>
In-Reply-To: <5ebe5337-f84e-12a1-e8a0-92832100946d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB4995:EE_
x-ms-office365-filtering-correlation-id: 081a235e-0111-4ae1-615d-08daf80b4cd8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yLtXGFtYQbDycF9o6INNxfVIF5Sw8wR5zIY28nGbemoCgzR6wDs2dTghTwgvSE1P0WeVxiwTzyWO3ywg8diyetSqFFhw03hMZMaSUIjBIU7XEWdITKUmCJAmSRbeoTV2eSozdZEW8EgLhbMovv8ct9C+Gf6hC0eTbW8ga7SXeXA2RYwn4iK5zA1qt39NH2wfwRsFqo4pnrOWkBm05w2Y278fQfuBn1GrrfAS+vxURcaFOqPkGJpdmZ0yPnD8Iwvg1gIl6rwunMsGLiw0PsHpOqt/CXLkqB5gUiK6SSdLU0lkiWf7FF4tUXTQX6oSVq4Jgk9P0IMCP0i2u2HGZ3WFErpZWypNvl/KPaKtCkbDUAqH0smFmad2ACdoGFtM+ynYe3nRBskf0PrsvT1JEsMVIl3ygGnADkoGpxms5x7xoNKMOVTULc98ggONCAUmp95C/RSspBf9RasWnR+PvDzvDMWa9uXiaUsHREL5LHy0d9yadlauGGI7aztiMUFmPKvOPRAbPC+/wGvAa1F7ufrkS4lk0nC38a8SwEZGzUchymeX4HrYiiJZyN+y1mfrCBxxDOI4jQoZyFmVMLuSDQrMANpR0Pb+pOSCEz4JXOjwpuw2bqC5Sg+aOQZsd3+Bg97bdo8uXiwtQsD/mSE537FStgHiOqeDXbegqYxpo6/6OBR7/uH2Cg2qed1LouylZiwbwwHnEyGi8s4l6XBYKepO6c4Vza9NR6gHZ6wxrnK1Te2T7Vvs16DFT5YidUOzWJiGQ6RJDu9pkxvGa82gzsEcBA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199015)(82960400001)(83380400001)(38100700002)(122000001)(38070700005)(64756008)(8676002)(31696002)(5660300002)(2906002)(66446008)(6916009)(4326008)(66556008)(66946007)(8936002)(66476007)(76116006)(41300700001)(86362001)(91956017)(6512007)(6506007)(186003)(26005)(53546011)(2616005)(316002)(478600001)(6486002)(54906003)(71200400001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1hxMEI0T1dBRlJwdXhKUUxKaW0rN2xCcFZjM3JQQzlqcHdTdk9tYmlkdSsz?=
 =?utf-8?B?M2x4R3lKV09yck5IMTkweEZ0d2Zqa3VuUkhVSkpIaUNTRElMZ0t3N3VTUnpO?=
 =?utf-8?B?WUpJSVFDN0gzSklKTTY3eE0wT0hCREJHd2lqYzltd1FDNEQxcXFTWTArdEtu?=
 =?utf-8?B?N2F3VE1FcE15NHdiVmpyZGdmTTFhelM3blFkT2ZsSkhza1NFSHlId2Qzeisy?=
 =?utf-8?B?Q2VhSFV3TWRqT29hOXVDeEx3UWN2Q0F0L0N5VUc3Q2tUWWhwMi9LcFdsMCty?=
 =?utf-8?B?Nzg5ZkluaDZ3d3RValFIRVlqVGVNOXlxalhlWEFyTksrb2xyRjFwdzgxb1NZ?=
 =?utf-8?B?YkF5ZnpQVmx1UTlRdks1U0puZ2Q0aTkzN1drOXFGQyttbEcxaUtzcUVJZXg2?=
 =?utf-8?B?UGgzelQxY2NTZGpTMys5NFhBT3FUWTd5czhmS0tQNk8yRmxtNFVOZklhUFdu?=
 =?utf-8?B?Z3dFZlhTUmxsTXpNcTlIT1cwQkRoeE5GT3UrV2wyQTMwZ3hmZjd3ei91a0s1?=
 =?utf-8?B?SjFqb1g2WXZ2QnBjRG1iQWEyWFBVcGNvODNqS3pXcHIyUTg2bFdDTmRiMGQ3?=
 =?utf-8?B?VkR4K1JBQ2g1cS8xbG9GS3RGY0hPdnVLMTBKSUhJK0x1ZklOQmI0alBuVm5H?=
 =?utf-8?B?c1BjUGVzZ0xlS1AzUEVkNGZSTDNnMjdYaFZsanY1NnNFQ09taVBtaHBkcFRu?=
 =?utf-8?B?OEZmOTVZMG9NWUJKY2dsdDZGKzIwcERWb0xSTjlYY3JZVGhMSCtlVXBXWkgz?=
 =?utf-8?B?djhWeW9nMUlnODZTaHRZbWpzQjJxeVZaZHdXOC90ZVlORTF5U1YzNEZ2Ui96?=
 =?utf-8?B?SmM1eUVhR2VFOVBrUHYrL3V4Qk1DSGZBd3BERkRpL2xoYStaeVcwYmpaTjZx?=
 =?utf-8?B?RnZheSttM2d6RDBtb2JqUGZOdUl3MkRkeDBpb240OTlmemh6QlVudUV6RVlT?=
 =?utf-8?B?ZGsrRVo2NlFYT1ZCRVBkL3RNdDdlMVJZOEQ2b2ZQWW1ldFpzaW5VbzkraHpV?=
 =?utf-8?B?OThVblJ4dEorN0Z3RXNHUHdGbVg1MEhKT1NlR1V0WkZmNHMzQzVZWXBrRW9N?=
 =?utf-8?B?M2Y5WUdpK1M1Si9ZUDAxZSthRlJMKzYxS3h2dlFzMjFLR1VVMWJETkFTcDhQ?=
 =?utf-8?B?VkxQM3JvcjROd1ZVQjMrZ1NRQzhvRUp4bXZxVGFxWDI1SGxCZmtaemVRM0RE?=
 =?utf-8?B?eWFvOFo2QkRnVkJqNWZyWUxLL1ljelA0UXVEYUxVbElYTDhQTmNGRHB1bVZl?=
 =?utf-8?B?L1FpT0ozOUdidnlMWjl1SFhHMEo4blhCb3Exby82MkM0c2JsVHJzM3d3WFZa?=
 =?utf-8?B?dFQyNUhJSXpOdlhGNC9mWmxoVGpCQkd1ZTRQdk13bUxMUFUzUUFyZEVSSnhh?=
 =?utf-8?B?dS9pSkY2djZGalhBTkVFSW9ZaFZpLzdKQzVsUVdRMnFGaGtFZHkxbjVULy9a?=
 =?utf-8?B?Q3dBNzN3QWoxbG1GZGZ2emNsT201dk82aThBVzJSMXhXbTRRT0RIT0ZiQkU0?=
 =?utf-8?B?djcwdzFiU29DSHZHcVFRNWc0VyttamVJb09DNXREa0pKb1NEUEFyOU9pelhP?=
 =?utf-8?B?Z0txL1VTRmZ3SFdFQzMzdndOWE5zNTREWTc2cTE1N2Y3Z200QktzWnA1dGgz?=
 =?utf-8?B?UlB4LzZGVmpGTC9HcDZibVlCZjRYeThIRlNjSnE0RnlqMDMxMUtOQkF4S0Ri?=
 =?utf-8?B?dmdQdFhHWmxHWmptc0xwbVNaR2s1SWVOelVGUG4vY0FGM1gzc2FQR3VYTDVF?=
 =?utf-8?B?UUh2ZS80Y0JXeG5RRVdVL3Q1S0lWNkFCamNJakdWU2lPbVVmS1QxSFhtZ1BH?=
 =?utf-8?B?aUNsM2lsKzgvVkh3bzEyYU5JNVpVSVkwanZpdWZCeTBzVDJYZ0Q2UktJZ3d2?=
 =?utf-8?B?QzN4OFpXdHJtVnRLOUlhNmZUcDBtVi80bmZRaWVuWTlSak9ZVUdxTzJJR3U2?=
 =?utf-8?B?VlF1ajFkdGl3U2QxU0ZtTU9SN0JDK3dnam40RFdldTZTL0JlTjl5SGdTdkFX?=
 =?utf-8?B?eXJKVUlqeHhxbHFmczh2Qy9Ia2NDUzlqeTBIZ1lVMFpmWldHVU9JVGd5aWMz?=
 =?utf-8?B?RTJQeTA1SStMOUl3VEp5THpPZGxSRzdaeHFDc2NMb2V3eGc1UXAyN2tFejRX?=
 =?utf-8?Q?rz3nFYoC65WMCJLFTmk4cX6Rq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51CDAE48E337E747AC585B5C3596845D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?cGI5dVVUQWJNYmVPRmdldzcrbG1qcXRiRUJnc3lGelhpQXV5Ris1SUNqVDRh?=
 =?utf-8?B?SXlUbTJmL2JwTmNlNlBmV0dzVzVnMTgzdWxqRzNQUnZHTUVtKzRoUkdIRWdZ?=
 =?utf-8?B?QVB1aUxydCswcDFUZmFSUmlGQThMVDdVdTlvTE1jTnpEMFc4SUJqSDI4bE9X?=
 =?utf-8?B?SmM2ZjkzbFBpS083TXQzRlMyNm9BZkYzeDRXYW9xMGgrMkRRUFE1SHpZTGY3?=
 =?utf-8?B?OVg0aFE4dTM0SjcvVW1PcUZqSDlWaEVtQ0VUd3dmMzRxeVRpbXFzbVpKalJX?=
 =?utf-8?B?cEhEUVdKMU5vTTFwT2tlZmNEcTUxSGNyaHpOWHlReXlGeExwMnJQdVBHSjZp?=
 =?utf-8?B?Y2FUVjlIOFRqaG8rRzZkc1lDMEcrbGFLZFA1V2lEK0NiUnB4cnhPb09hbWd0?=
 =?utf-8?B?NUpmOTBROXZDVCtrejdLcjJXbDVtbzhMUFhkR2RiR0ZYb2FNTzc5N2ptT2VV?=
 =?utf-8?B?UTFmcVVzVVhjZ2pCNlJpRXRQWHFma3VRU1lWQm15aTFjanZtM3QvaU9DcklZ?=
 =?utf-8?B?eUFwVmI0dXNQdkZwMHF1UU9JZ2pUOFFPdzVTN1ZlUy9TMExOZmNjZGJ4MHd3?=
 =?utf-8?B?dHlNYVVvbGpLL0x6NzJGd3A3eGhWM2NZdDUzcmNJdHRZcHVJYWRwV2hIcllq?=
 =?utf-8?B?bE5YKytJbXhaaW9MM2hxZE0xSENVZGRNOGZBM3VxSHZJZUJQTG5FeElXdW5T?=
 =?utf-8?B?ZG5oWXdBeDRxK2drY1FFWitWbEIyeUJQcnlQeHJmdWNoMEVKYjJleUZsNFlK?=
 =?utf-8?B?QnlVZm5UaGU4VmNwb0FlU1hjVHFXTERmTktzYnQ1dm0vbW1EQ3Zjb2sxTzU5?=
 =?utf-8?B?NVR3Z3UyVFE3R3FwVFdCZEx0S1JsUUYyU2FwK1QxeEh6NVdFZUZlZVYrLzZk?=
 =?utf-8?B?Vm9YZWRGaXBOdENjelNua0ViNDJEMEVXWVNQQWZCOW4zK0wwV1E2b24wbUxE?=
 =?utf-8?B?YnVUaWNGMVMySkpjRWlqcjRpejdjTU9XS1FVRE5aTzBLbU9DbjRqSGIxUXpX?=
 =?utf-8?B?ckJldGhjTXJ0REdXWFN0RWk1eVhZRG54d1FtbmtFMDZndS83WGF4Q3dIenAv?=
 =?utf-8?B?UHVuMWNEV3FCKzByK1AyaUI1VWpxZFZRaTliN0lhdFEybUhxWW1yR2RJcU9j?=
 =?utf-8?B?Q0pVWXhqa1JzMnprNEduOUpkVzZabE5tS0x1VEZwcGdDT0tWOWVuVnlTRW8v?=
 =?utf-8?B?YzVWWnRmaEdrdFNrSlU4Z0cwTzczM0lyU3hHTXI2WTFhRzBqNzc0cjduZjNB?=
 =?utf-8?B?WTR3NmFmWmpyWGFObDVac3pjVmg4dUt0RjZEWFRQRi9lYzRjdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081a235e-0111-4ae1-615d-08daf80b4cd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 21:47:44.3611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3olt3H39/jp+BMxJq8Az0UnwZy1tw2yJvQGEAm/Njs3b4Rj7IAJCUQO7BEwyBfSaeAOPVYTks67tANyJtVqrTZipyFf6j6BFoIi3EjMSVJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4995

T24gMTYvMDEvMjAyMyA0OjA2IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDEuMjAy
MyAwMDowOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IEBAIC00NzAsNiArNDcxLDU5IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrIHBhcmFtX2luaXQodm9pZCkNCj4+ICBfX2luaXRjYWxs
KHBhcmFtX2luaXQpOw0KPj4gICNlbmRpZg0KPj4gIA0KPj4gK3N0YXRpYyBsb25nIHhlbnZlcl92
YXJidWZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAr
ew0KPj4gKyAgICBzdHJ1Y3QgeGVuX3ZhcmJ1ZiB1c2VyX3N0cjsNCj4+ICsgICAgY29uc3QgY2hh
ciAqc3RyID0gTlVMTDsNCj4gVGhpcyB0YWtlcyBhd2F5IGZyb20gdGhlIGNvbXBpbGVyIGFueSBj
aGFuY2Ugb2YgcmVwb3J0aW5nICJzdHIiIGFzDQo+IHVuaW5pdGlhbGl6ZWQNCg0KWWVzLi4uDQoN
Ckl0IGlzIGFsc28gdGhlIGNsYXNzaWMgZmFsc2UgcG9zaXRpdmUgcGF0dGVybiBpbiBHQ0MgNC54
IHdoaWNoIGlzIHN0aWxsDQpzdXBwb3J0ZWQgZGVzcGl0ZSBhdHRlbXB0cyB0byByZXRpcmUgaXQu
DQoNCj4+ICsgICAgaWYgKCBzeiA+IEtCKDY0KSApIC8qIEFyYml0cmFyeSBsaW1pdC4gIEF2b2lk
IGxvbmctcnVubmluZyBvcGVyYXRpb25zLiAqLw0KPj4gKyAgICAgICAgcmV0dXJuIC1FMkJJRzsN
Cj4+ICsNCj4+ICsgICAgaWYgKCBndWVzdF9oYW5kbGVfaXNfbnVsbChhcmcpICkgLyogTGVuZ3Ro
IHJlcXVlc3QgKi8NCj4+ICsgICAgICAgIHJldHVybiBzejsNCj4+ICsNCj4+ICsgICAgaWYgKCBj
b3B5X2Zyb21fZ3Vlc3QoJnVzZXJfc3RyLCBhcmcsIDEpICkNCj4+ICsgICAgICAgIHJldHVybiAt
RUZBVUxUOw0KPj4gKw0KPj4gKyAgICBpZiAoIHVzZXJfc3RyLmxlbiA9PSAwICkNCj4+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKyAgICBpZiAoIHN6ID4gdXNlcl9zdHIubGVu
ICkNCj4+ICsgICAgICAgIHJldHVybiAtRU5PQlVGUzsNCj4gVGhlIGVhcmxpZXIgb2YgdGhlc2Ug
bGFzdCB0d28gY2hlY2tzIG1ha2VzIGl0IHRoYXQgb25lIGNhbid0IHN1Y2Nlc3NmdWxseQ0KPiBj
YWxsIHRoaXMgZnVuY3Rpb24gd2hlbiB0aGUgc2l6ZSBxdWVyeSBoYXMgcmV0dXJuZWQgMC4NCg0K
VGhpcyBpcyBhY3R1YWxseSBhIGNoZWNrIHRoYXQgdGhlIGJ1aWxkX2lkIHBhdGggYWxyZWFkeSBo
YXMuwqAgSSBkaWQNCmNvbnNpZGVyIGl0IHNvbWV3aGF0IGR1YmlvdXMgdG8gc3BlY2lhbCBjYXNl
IDAgaGVyZSwgYnV0IGl0IG5lZWRzIHRvDQpzdGF5IGZvciB0aGUgZm9sbG93aW5nIHBhdGNoIHRv
IGhhdmUgbm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQoNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy92ZXJzaW9uLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92ZXJzaW9uLmgNCj4+IEBA
IC0xOSwxMiArMTksMjAgQEANCj4+ICAvKiBhcmcgPT0gTlVMTDsgcmV0dXJucyBtYWpvcjptaW5v
ciAoMTY6MTYpLiAqLw0KPj4gICNkZWZpbmUgWEVOVkVSX3ZlcnNpb24gICAgICAwDQo+PiAgDQo+
PiAtLyogYXJnID09IHhlbl9leHRyYXZlcnNpb25fdC4gKi8NCj4+ICsvKg0KPj4gKyAqIGFyZyA9
PSB4ZW5fZXh0cmF2ZXJzaW9uX3QuDQo+PiArICoNCj4+ICsgKiBUaGlzIEFQSS9BQkkgaXMgYnJv
a2VuLiAgVXNlIFhFTlZFUl9leHRyYXZlcnNpb24yIGluc3RlYWQuDQo+IFBlcnNvbmFsbHkgSSBk
b24ndCBsaWtlIHRoZXNlICJicm9rZW4iIHRoYXQgeW91J3JlIGFkZGluZy4gVGhlc2UgaW50ZXJm
YWNlcw0KPiBzaW1wbHkgYXJlIHRoZSB3YXkgdGhleSBhcmUsIHdpdGggY2VydGFpbiBsaW1pdGF0
aW9ucy4gV2UgYWxzbyB3b24ndCBiZQ0KPiBhYmxlIHRvIHJlbW92ZSB0aGUgb2xkIHZhcmlhbnRz
IChleGNlcHQgaW4gdGhlIG5ldyBBQkkpLCBzbyB0ZWxsaW5nIHBlb3BsZQ0KPiB0byBhdm9pZCB0
aGVtIHByb3ZpZGVzIHVzIGFib3V0IG5vdGhpbmcuDQoNCkluY29ycmVjdC4NCg0KRmlyc3QsIHRo
ZSBicmVha2FnZSBoZXJlIGlzbid0IG9ubHkgdHJ1bmNhdGlvbjsgaXQncyBjaGFyLXNpZ25lZG5l
c3MNCndpdGggZGF0YSB0aGF0J3Mgbm90IGd1YXJhbnRlZWQgdG8gYmUgQVNDSUkgdGV4dC7CoCBZ
ZXQgYW5vdGhlcg0KZGVtb25zdHJhdGlvbiBvZiB3aHkgQyBpcyBhbiBpbmFwcHJvcHJpYXRlIHdh
eSBvZiBkZWZpbmluZyBhbiBBQkkuDQoNClNlY29uZGx5LCBpdCBpcyB1bnJlYXNvbmFibGUgZm9y
IEFCSSBlcnJvcnMgYW5kIGNvcnJlY3Rpb24gaW5mb3JtYXRpb24NCnN1Y2ggYXMgdGhpcyBub3Qg
dG8gYmUgZG9jdW1lbnRlZCAqc29tZXdoZXJlKi7CoCBJdCBzaG91bGQgbGl2ZSB3aXRoIHRoZQ0K
QVBJIHRlY2huaWNhbCByZWZlcmVuY2UsIHdoaWNoIGhhcHBlbnMgdG8gYmUgZXhhY3RseSAoYW5k
IG9ubHkpIGhlcmUuDQoNClRoZXNlIGNvbW1lbnRzIHdvbid0IGZpeCBleGlzdGluZyBpbXBsZW1l
bnRhdGlvbnMuwqAgV2hhdCB0aGV5IHdpbGwgZG8gaXMNCmNhdXNlIGFueW9uZSBuZXcgaW1wbGVt
ZW50aW5nIGd1ZXN0cywgb3IgYW55b25lIHdobyByZS1zeW5jcyB0aGUNCmhlYWRlcnMsIHRvIG5v
dGljZSBhbmQgaG9wZWZ1bGx5IHRha2UgbWl0aWdhdGluZyBhY3Rpb24uDQoNCn5BbmRyZXcNCg==

