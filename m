Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E727759DABF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 12:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391890.629910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRSq-0003yf-O1; Tue, 23 Aug 2022 10:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391890.629910; Tue, 23 Aug 2022 10:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRSq-0003wT-LA; Tue, 23 Aug 2022 10:48:56 +0000
Received: by outflank-mailman (input) for mailman id 391890;
 Tue, 23 Aug 2022 10:48:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuKU=Y3=citrix.com=prvs=227d21510=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQRSo-0003wN-EA
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 10:48:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c582a86-22d1-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 12:48:52 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2022 06:48:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5878.namprd03.prod.outlook.com (2603:10b6:510:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 10:48:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 10:48:43 +0000
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
X-Inumbo-ID: 2c582a86-22d1-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661251732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zSfumwv/IKvHoPMZnfYJUIerLEilmwpX7wYrFNOzSxo=;
  b=JRNSWhxqjvVEV2yFWoGWOWXIUJNT0cJIsl8dy0zDw1gcPcpcTEqROmjP
   5Gk7JPMMnfTWtxP2wliHXQQcYjGdkYC3rKj1/me9wbO92UKqDJ9KvPruJ
   TYevMa2czm8NgDBHrafYL5xVPHJ9UOclPDb9dDqkz9hFVQ4zzTKrf8AwK
   s=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 77918765
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M187ta/2K+5b7C/y0CMkDrUDVH+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mMdWj/SMqqNNmXzLt4ga9/j9EMB6MXSn4JhTgE5/iE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM156yo0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGF0AvZNFH1dtNRmRN8
 8cmazcgNDqivrfjqF67YrEEasULCuDOZdlallQ+iDbTALAhXIzJRLjM6ZlAxjAsi8tSHPHYI
 c0EdT5oaxeGaBpKUrsVIMtmwKH02T+iInsB9wv9SakfugA/yCRY1rT3PcWTUduNXchPxW6Tp
 37c/nS/CRYfXDCa4WXaoyv82bGS9c/9cI4cKr+RpvFyvB7J5E8jGhkwT2Sgq/bs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8VUO/037keK0KW8ywOQHG0NVDNCQN0gqs4tRDYu2
 0OJntXmHjhmuvueTnf13qubqSOaPSkTMHMYYikFXU0J7rHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv5hX5njCijOo45TMEAg841yNWnr/t1wgIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF7n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:s/PIUKmKkSiN6J10rW914EMq+jDpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.93,257,1654574400"; 
   d="scan'208";a="77918765"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6el0hIu5eHPny8bJvQ650YXws4ONTlgASPnstSD95X9IPF5L+X0YNwkJGMpeWtJBqjJfEeMe76oapuxcO8XThGyZuKVwGd1qCaE8xC1olHnlNTn9ELfB4MUzuEw4wQLzy7S7lvuy7DPTw9t4oqG6+w9dCch5upiCos37twt6ex7ZgA+7st94ijnBHU4mkoVUGPFQXLd1zHwrMGYtstz7d6FF9z9Thpn1jYOsHsPfCe3gQTErBiTk4G5wlCiEx7ZJw5FrEwynu9yrLFB67obDFFpd2IPqgBMM1TJI2Uj6Xt7LbDurd3lr8591ZlWIdYdwZyFRvSNZbChvT2LA6dwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSfumwv/IKvHoPMZnfYJUIerLEilmwpX7wYrFNOzSxo=;
 b=V8X/0o5Fmj5r9Cf/6UhGBpuTts61q6fVSvZ26Rgmi2yEW75PYvF1p3wUsSfYwdLWyZCUWNN/reYkV6JwDDxxiacuEnpOtj4n2y4OphLweShBK+hPpkmx1C1fAyHMz7jgtbUka/7Q26FvoxWw3WbhlUgebnLx8cC6kmAOxXuwMc/oW1HsesPbk8/UEhEfSsqXBK/y0y3MXOFQhg+Zcv35HiJ96xEo7Pp90gOs2m1y4AKVtsmtp5X+64PVDUmyPr5YdRbGFci0gLLmWjbsfUjQuEJs2JzovZrflbaPpj5YzAv8SCrpsH037U+71OJMRsuwRBMHSMmP94fPk1LiQrQrHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSfumwv/IKvHoPMZnfYJUIerLEilmwpX7wYrFNOzSxo=;
 b=ZFn+o5l8wiMeOutONu1xS7hbI6unoPzbMEsx7ae1acvPvHsiQ1X8cifjGXVoUS5gPaU8oNnl3tTYjPnNquk4xZZP2xzSy20j2DxZzYd4Kn31dhR8CUNaFe+q9foVw3TYQBtQWRPAddwyy2f6qH0v29TNyTK60hLLrxmNZPflZaM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Topic: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Index: AQHYtrt8/1v0WOY/4kiCtfQ8qrAcS628L8cAgAAH3wCAABa0AA==
Date: Tue, 23 Aug 2022 10:48:43 +0000
Message-ID: <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
 <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
In-Reply-To: <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba6d8cee-25b9-4658-d42f-08da84f50c1b
x-ms-traffictypediagnostic: PH0PR03MB5878:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 faH33zyrwXkV8JTy83JmtxFyAm3xmq6UMr0r5fVcCUEGF8SsF0K99dlmkcEjPJkEt4aqQ8+5icWck3Tau5au91qHIn1GM1v/FBmIOkqDhFgi0M5te5f34T09MlBWa3ZMHHfEilnmxbbOA4WXRIGwp9F/ePSH16c6CKEwwI4FPTFzgpQ5ai5TgllQRz38LiHBlHatAEJoUuXjW8iN9lUibsxuh+cbeDY+VpfJB6Q0GU1EebBekTXrrzyBze2V2an47QjZxa7lvhkaklUOjfr/p9ma6jzRsF1LD7pK8t45qXdx5tzwH5gd3xx/ikVfUE0v63r4ucsqC+j6mh80Fsw7ebmRYdh/czelXFPVZpMyyuYL9aWTGib7/ODUj1isDYxfa78W0P/W6BuXZX3kXjqjsACh8dqtqwP99KhNIVxJw1NO0KAF4fIrDdVuvPTOrijD6HrsI6zMRRbss8DSGstZ+raaxR09/ExcxVsaB71upoa996MZX61gBhVJbUvFQ8mBF8bUF3u99dS3cHFdFHM66cbGKtFyRl3x2/R39gZAyPxgLZXpi2LqF+XwOVWjo7QK24hhES3edy5vddhmkdJHuynfZxJx6eMLpbDhnHyvSc/o8E/zr/7cpn6ZC10QeRNAorb5upUwyApPf7gi5pVdCYi4U8vonpFHD8wljlSpZkyAsJI7uHfrfpcsHQa87wPnBBFas6Aczyd9y52M7d5HqZpThJknqawhhobH8t1Hxn5KqIMIQ0ZffeHInymRATrVR9ykHjEVyvs9w6jAIEtWE3vA/SnIKef/e1B0cJ2N177UZLzti/6A5k4JpRHObMXreoxU3CW7Ief5ROajXGjRgqfrB7xqnfghljdHUm3Rbro=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(38100700002)(2616005)(83380400001)(38070700005)(36756003)(64756008)(91956017)(76116006)(66446008)(54906003)(71200400001)(31686004)(316002)(6916009)(66946007)(4326008)(8676002)(66476007)(66556008)(26005)(6512007)(6486002)(86362001)(966005)(6506007)(2906002)(31696002)(53546011)(5660300002)(186003)(82960400001)(41300700001)(122000001)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blE0amdBc25MZFlRQ0tUWWdPWE83ZFAwVlpOWkVEUWtPOVJpWlU5YWFBTXlT?=
 =?utf-8?B?eUpGWVMxUzBhU2lUcWQvTHd2QWtYbjZkUUtsanI0Vm5JRjlnVkNWUWRxay9L?=
 =?utf-8?B?cEZSSGlnY09vdHB1VkZJTnhSYnp0c3NvTGdxT0JsNzI4N21DV3ZJOGt4Y01y?=
 =?utf-8?B?N3dLZmFJRFNkOUd6MXRKdk15bzQxN0o1Q2k4WVpBZEZKdTdZV0VMZkYwV3g4?=
 =?utf-8?B?TWthcjBzWFFWMi8wTExpOElPR2RQNDl1dDVwRmJaS1VEdDdGSks0Ym50Tlp4?=
 =?utf-8?B?VXc5cVYrY21GMFVrQitUaUZ5OVZpYlJQNU9hNWEwaGl1aE4rS2h4MERxLzRs?=
 =?utf-8?B?OUZGcUQ0cnZkMElLRVRBZm90NEdPc0VIbVYxVFk0VkFycDJZK2VRNlIrKzRp?=
 =?utf-8?B?WXJ3WU1Palp2N3owNjVlZUtuNkpQMk5ZUGRHVlNpeHlkakJiaHkzYzVZQUNH?=
 =?utf-8?B?SkVqaVhQdnJnQnlNTEdoUXNCUkluU1FlZm5iVklGK3dyOHBxTUxUUDZ4Q0M0?=
 =?utf-8?B?a1RTTmJQYWQ4bTRxRzJtVFlwbFFmcXJJenh0SkxyZnNpb2J5ZzBqbExaZEdy?=
 =?utf-8?B?cDdlL0d2RXd6SzFBd29nYXFEU0FGRCtuMHFsdGxBMEhOZ3RNT0cxdkRzL3ZU?=
 =?utf-8?B?bXlDbkROTExyOVhpK3EvZis1VWZZclZzbnlxOFdrWkU0bXIvbVZaQmI5MmV5?=
 =?utf-8?B?V2ZZVUJ2aDhTYU9aQ09ZRENESHl2ajNMTU9tMmdieHFxZUZYNkcrbTcxZlVm?=
 =?utf-8?B?SEpESFQ1VHZ1RHlSSm81aTljd1ltQzdGS0RkWjV1NXJqRDlkRVg2R2VLMzdn?=
 =?utf-8?B?dUwwWU1WVmVsemhobGFHaS9nS0ZwOWNNdGNaQ3pueHlENkk3S3VtVXBXSzdl?=
 =?utf-8?B?TUZoRDk2aEJ4UTBoVG40dERySEhUUHZaVHpPNHJaZ2ZEbk9VRzFUd0RIWUFP?=
 =?utf-8?B?ZUFvcHdCdDlLa2ZlQ2pZbHV2amxsemxIZTZ6V1BVQmdKMSs0TjlTdk5Bb2RV?=
 =?utf-8?B?U2xTYzdpMlROME5IZkVZSis1NGE0aHpnemNFM3luR3ZINGdzSk1XQ2NoaWlC?=
 =?utf-8?B?dUwzdnp5Y0EvVFZDUi9POWczV01yTGVvdy9LZ1hzZGNiU09ueHJHd1JGV0tK?=
 =?utf-8?B?cU5ITC9iTjNtVy96K25DOHBtUzd6NDdnTWlVT0YxcmJXcFFHRTZycUt2cXFj?=
 =?utf-8?B?MlRHcE5ZaG15S0xOYUF6bzRTb3pRSGE4M3FHazBvNTEyVlFtbkM5U2FFSk04?=
 =?utf-8?B?dFJycjh6UVJXZGFUSVhhQk1VbTdNaTJMZXdkZjRiTnFYbzBMS1dXd0gwUkx2?=
 =?utf-8?B?YlBQUnhhZkEzcFlucHErbVBZVXhiY1VwVFBuYUtGSWQvK01obDFoWVU4cVRp?=
 =?utf-8?B?Wmd2TnF5TXZSUThRcHcvc3ZUMHRHNjVQb1M1ODV4ZzhxdWdYMFdKRjBvbW9H?=
 =?utf-8?B?S2p4c2xnQUZ0VnZGR0NsWnViNEtub1RtKzR4cWw3NU8ySDJPM0pUbWMxTS85?=
 =?utf-8?B?b2dTQi9BTTAwNFF1c0xFWXp4NmFFbFQ2eU9ZbUJzMTF4azRUMTFDTVpzVWVj?=
 =?utf-8?B?bEU4eC9XdTFVemtuOFdhbHppR1dIeDBzU2tWcmdvQW5hT0E5aytYV2t5d29z?=
 =?utf-8?B?OGpqNTFkak9lNnhLTEQyTi9sL0Y1dDJaOFpXRzAvNU5RT1JjOE9vZEhUTGxa?=
 =?utf-8?B?QlljWlJPM09HRjc2NW9VWWI1ekkwQ3ZyQ0lqQlluUjljMjBBL3htNzdtbjY2?=
 =?utf-8?B?NVQrU3B1RUtveGRLTndFS2pSMFpIV29ybzJxY2Y5RXZIMVF1RmtzamxzVVpn?=
 =?utf-8?B?d1pxS2VaeS9IWnd6Q1JqdzFRR2NydUxCcEl0YmZZNU5vVDVRQ2VhdHZZTmoz?=
 =?utf-8?B?RW5zTkRKc3hQQjNEMWpQdEFQZ25YMk0wNmc2OUdmSmxoblcwL3lzc3JJRm5k?=
 =?utf-8?B?VTVsRmNZREJGemFGamU1SU9pZTNwL1JyYnBteUx2L0YyTnh2YUtFeTVnaXQr?=
 =?utf-8?B?dUpyb3l5QWFiMDZ2b1IzTE1VRmhzV2wwSDFzdFZnMWhMczRwMjY0ZjNzenBr?=
 =?utf-8?B?RUlsZFU4V3NBY3pkNmJsY3ZBc21DMmZyYUIralE0bFNCN25VRzd1YnZtMzFZ?=
 =?utf-8?Q?/8wwkZAPBzFPHNdfM2o2DD3RQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE8BBA40CA60CB4494D666291A033372@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6d8cee-25b9-4658-d42f-08da84f50c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 10:48:43.0725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gq2OjgPVnzri1eZqh/QpYxOwuzSsM1ZgdN7vPsSGqnQW1lbBN5bBIgTCxpEK4xup55MlcJYEedHUczeOCebtpEwwMNc4IeohxrmoeH8fv0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878

T24gMjMvMDgvMjAyMiAxMDoyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA4LjIwMjIg
MTA6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8wOC8yMDIyIDA3OjQyLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBleHBvc2VkIHRvIFBWIGRvbWFpbnMuDQo+Pj4NCj4+PiBDb25z
aWRlcmluZyB0aGF0IHRoZSBzaXplIHJlcG9ydGVkIGlzIHRoYXQgb2YgdGhlIGNvbXBhY3RlZCBz
YXZlIGFyZWEsDQo+Pj4gSSB2aWV3IExpbnV4J2VzIGFzc3VtcHRpb24gYXMgYXBwcm9wcmlhdGUg
KHNob3J0IG9mIHRoZSBTRE0gcHJvcGVybHkNCj4+PiBjb25zaWRlcmluZyB0aGUgY2FzZSkuIFRo
ZXJlZm9yZSB3ZSBuZWVkIHRvIHBvcHVsYXRlIHRoZSBmaWVsZCBhbHNvIHdoZW4NCj4+PiBvbmx5
IFhTQVZFQyBpcyBzdXBwb3J0ZWQgZm9yIGEgZ3Vlc3QuDQo+PiBUaGlzIGlzIGEgbWVzcy7CoCBU
aGUgU0RNIGlzIGZhaXJseSBjbGVhciAoYnV0IG9ubHkgaW4gVm9sMSkgdGhhdCB0aGlzDQo+PiBs
ZWFmIGlzIHNwZWNpZmljIHRvIFhTQVZFUy4NCj4gVGhlIHdheSBpdCdzIHdyaXR0ZW4gbXkgYXNz
dW1wdGlvbiBpcyB0aGF0IHRoZXkgc2ltcGx5IGRpZG4ndCBjYXJlIGFib3V0DQo+IFhTQVZFQyB3
aGVuIHdyaXRpbmcgdGhpcywgb3IgdGhleSB3ZXJlIGFzc3VtaW5nIHRoYXQgYm90aCBmZWF0dXJl
cyB3b3VsZA0KPiBhbHdheXMgYmUgc3VwcG9ydGVkIHRvZ2V0aGVyICh5ZXQgZXZlbiBpZiB0aGV5
IGFyZSBpbiBJbnRlbCdzIGhhcmR3YXJlLA0KPiB0aGUgYXJjaGl0ZWN0dXJlIHNob3VsZCBzcGVs
bCBvdXQgdGhpbmdzIGFzIGlmIGJvdGggd2VyZSBlbnRpcmVseQ0KPiBpbmRlcGVuZGVudCwgb3Ig
aXQgc2hvdWxkIHNwZWNpZnkgdGhhdCBvbmUgdGFrZXMgdGhlIG90aGVyIGFzIGEgcHJlcmVxKS4N
Cg0KUmVhbCBoYXJkd2FyZSBoYXMgWFNBVkVDID09IFhTQVZFUyBvbiBJbnRlbCAoU2t5bGFrZSkg
YW5kIEFNRCAoWmVuMSkuwqANCkRlc3BpdGUgYW4gYXR0ZW1wdCB0byBzZXBhcmF0ZSB0aGUgcGFy
dHMgb2YgdGhlIElTQSwgdGhleSBhcmUNCmluZXh0cmljYWJseSBsaW5rZWQuDQoNCkl0IGlzIG9u
bHkgdW5kZXIgdmlydCB0aGF0IHdlIGdldCBYU0FWRUMgd2l0aG91dCBYU0FWRVMuDQoNCj4+PiBG
aXhlczogNDYwYjlhNGIzNjMwICgieDg2L3hzYXZlczogZW5hYmxlIHhzYXZlcy94cnN0b3JzIGZv
ciBodm0gZ3Vlc3QiKQ0KPj4+IEZpeGVzOiA4ZDA1MGVkMTA5N2MgKCJ4ODY6IGRvbid0IGV4cG9z
ZSBYU0FWRVMgY2FwYWJpbGl0eSB0byBQViBndWVzdHMiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IENDIE1hcmVrLsKgIExvb2tzIGxpa2Ug
SmFuIGhhcyBmb3VuZCB0aGUgaXNzdWUgeW91IHJlcG9ydGVkIG9uIElSQy4NCj4+DQo+PiBKYW46
IEJlIGF3YXJlIHRoYXQgSSBzdWJtaXR0ZWQNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvMjAyMjA4MTAyMjE5MDkuMTI3NjgtMS1hbmRyZXcuY29vcGVyM0BjaXRyaXguY29tLw0KPj4g
dG8gTGludXggdG8gY29ycmVjdCBzb21lIG9mIHRoZSBkaWFnbm9zdGljcy4NCj4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvY3B1aWQuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jDQo+Pj4g
QEAgLTExNDIsNyArMTE0Miw3IEBAIHZvaWQgZ3Vlc3RfY3B1aWQoY29uc3Qgc3RydWN0IHZjcHUg
KnYsIHUNCj4+PiAgICAgICAgICBzd2l0Y2ggKCBzdWJsZWFmICkNCj4+PiAgICAgICAgICB7DQo+
Pj4gICAgICAgICAgY2FzZSAxOg0KPj4+IC0gICAgICAgICAgICBpZiAoIHAtPnhzdGF0ZS54c2F2
ZXMgKQ0KPj4+ICsgICAgICAgICAgICBpZiAoIHAtPnhzdGF0ZS54c2F2ZWMgfHwgcC0+eHN0YXRl
LnhzYXZlcyApDQo+PiBJZiB3ZSdyZSBkb2luZyB0aGlzLCB0aGVuIGl0IHdhbnRzIHRvIGJlIHhz
YXZlYyBvbmx5LCB3aXRoIHRoZSBjb21tZW50DQo+PiBiZWluZyBleHRlbmRlZCB0byBleHBsYWlu
IHdoeS4NCj4gV2h5IHdvdWxkIHRoYXQgYmU/IEJvdGggaW5zbnMgdXNlIGNvbXBhY3RlZCBmb3Jt
YXQsIGFuZCBuZWl0aGVyIGlzDQo+IGRlcGVuZGVudCB1cG9uIHRoZSBvdGhlciBpbiB0ZXJtcyBv
ZiBiZWluZyBzdXBwb3J0ZWQuIElPVyBYU0FWRVMgYWxvbmUNCj4gYW5kIFhTQVZFQyBhbG9uZSBl
bmFibGVkIGZvciBhIGRvbWFpbiBzaG91bGQgc3RpbGwgbGVhZCB0aHJvdWdoIHRoaXMNCj4gcGF0
aC4NCg0KSG1tLsKgIEJlY2F1c2UgbXkgZml4ZXMgdG8gY29tcGFjdGlvbiBoYW5kbGluZyBoYXZl
bid0IGJlZW4gY29tbWl0dGVkDQp5ZXQsIGFuZCBpbiBwYXJ0aWN1bGFyIG9uZSB0aGUgb25lIHdo
aWNoIG1ha2VzIFhTQVZFUyBzdHJpY3RseSBkZXBlbmQgb24NClhTQVZFQy4NCg0KSW4gd2hpY2gg
Y2FzZSB0aGlzIGh1bmsgaXMgY29ycmVjdCBmb3IgWGVuIGFzIGl0IGN1cnJlbnRseSBpcywgYW5k
IHdpbGwNCmJlIG5lZWQgdG8gYmUgYWRqdXN0ZWQgd2hlbiBJIHJlYmFzZSB0aGUgY29tcGFjdGlv
biBzZXJpZXMuDQoNCj4+IEJ1dCB0aGlzIGlzIGdvaW5nIHRvIGZ1cnRoZXIgY29tcGxpY2F0ZSBt
eSBzZXZlcmFsLXllYXItb2xkIHNlcmllcw0KPj4gdHJ5aW5nIHRvIGdldCBYZW4ncyBYU1RBVEUg
aGFuZGxpbmcgaW50byBhIHBvc2l0aW9uIHdoZXJlIHdlIGNhbiBzdGFydA0KPj4gdG8gb2ZmZXIg
c3VwZXJ2aXNvciBzdGF0ZXMuDQo+IFdoZXJlIGRvIHlvdSBzZWUgZnVydGhlciBjb21wbGljYXRp
b24/IFRoZSBuZWNlc3NhcnkgZmlkZGxpbmcgd2l0aCBYU1MNCj4gaGVyZSB3b3VsZCBvZiBjb3Vy
c2UgYmUgZGVwZW5kZW50IHVwb24gcC0+eHN0YXRlLnhzYXZlcyBhbG9uZSAob3IsDQo+IG1heWJl
IGJldHRlciwgb24gdGhlIHNldCBvZiBlbmFibGVkIGZlYXR1cmVzIGluIFhTUyBiZWluZyBub24t
ZW1wdHkpLA0KPiBidXQgdGhhdCdzIHNpbXBseSBhbm90aGVyIChpbm5lcikgaWYoKS4NCj4NCj4g
QXMgYW4gYXNpZGUsIEkgYWN0dWFsbHkgd29uZGVyIHdoYXQgdXNlIHRoZSBzdXBwbGllZCBzaXpl
IGlzIHRvIHVzZXINCj4gbW9kZSBjb2RlIHdoZW4gYW55IFhTUy1jb250cm9sbGVkIGZlYXR1cmUg
aXMgZW5hYmxlZDogVGhleSdkIGFsbG9jYXRlDQo+IGEgbmVlZGxlc3NseSBsYXJnZSBibG9jayBv
ZiBtZW1vcnksIGFzIHRoZXkgd291bGQgb25seSBiZSBhYmxlIHRvIHVzZQ0KPiBYU0FWRUMuDQoN
ClRoaXMgZmllbGQgaXMgYW4gYWxyZWFkeSBrbm93biBrZXJuZWw9PnVzZXIgaW5mb2xlYWsuwqAg
VGhlcmUgYXJlIHRocmVhZHMNCmFib3V0IGl0IG9uIExLTUwuDQoNCkJ1dCBpdCBkb2VzIGhpZ2hs
aWdodCBhbm90aGVyIHByb2JsZW0uwqAgVGhpcyBjaGFuZ2UgZG9lcyBub3QgZml4IExpbnV4DQpv
biBBTUQgWmVuMyBoYXJkd2FyZSwgd2hlcmUgdGhlIGtlcm5lbCB3aWxsIGZpbmQgdGhlIENQVUlE
IHZhbHVlIGxhcmdlcg0KdGhhbiBpdCBjYW4gY2FsY3VsYXRlIHRoZSBzaXplIHRvIGJlLCBiZWNh
dXNlIFhlbidzIHVzZSBvZiBDRVQtU1Mgd2lsbA0Kc2hvdyB1cCBpbiB0aGUgQ1BVSUQgdmFsdWUu
DQoNCkxpbnV4IG5lZWRzIGFuIGFkanVzdG1lbnQgZnJvbSAhPSB0byA8PSBmb3IgdGhpcyBjaGVj
ay4NCg0KfkFuZHJldw0K

