Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E663BB55F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 05:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149762.277007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0F6Y-0000bU-2p; Mon, 05 Jul 2021 03:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149762.277007; Mon, 05 Jul 2021 03:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0F6X-0000Yu-Vp; Mon, 05 Jul 2021 03:17:05 +0000
Received: by outflank-mailman (input) for mailman id 149762;
 Mon, 05 Jul 2021 03:17:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kFf=L5=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1m0F6X-0000Yo-0w
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 03:17:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32530c8a-8f39-421c-8548-e82f639e6859;
 Mon, 05 Jul 2021 03:17:02 +0000 (UTC)
Received: from AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25)
 by DBBPR08MB4316.eurprd08.prod.outlook.com (2603:10a6:10:c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 03:16:59 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::f8) by AM5PR0701CA0063.outlook.office365.com
 (2603:10a6:203:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Mon, 5 Jul 2021 03:16:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 03:16:59 +0000
Received: ("Tessian outbound 80741586f868:v97");
 Mon, 05 Jul 2021 03:16:59 +0000
Received: from 1337886d1385.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF0E60CF-C531-4486-B880-0FA62D4363E7.1; 
 Mon, 05 Jul 2021 03:16:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1337886d1385.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 03:16:49 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB5392.eurprd08.prod.outlook.com (2603:10a6:803:131::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 03:16:47 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 03:16:47 +0000
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
X-Inumbo-ID: 32530c8a-8f39-421c-8548-e82f639e6859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnVNcCm/QzGCSGwzbXT6ZdtSblAWVZ7Mm2ZbLdBHPQA=;
 b=08BybUnxuXT78ffxsnn17m4+lTNHNxdnrf+O2qtGVEVkI1vd2IDK49M0LbEjRErj5YXZSlc4JpGA9sK5nj2uYT4nrx10h70HcS92ihLcsgk+a38iWpnJ3Y3PKQwu6sR2qhZ8zQDWcUHJftU58KMFKKIcQBLu9oDAMaS2eU7eO7Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqoC8OqlGTDVXRCFytDoLvJ1iyUZzOy683TXJIEHSJkuoLnagbyz43uXIEQFhz1Nocq9xhN5LqNtVMpHssQjKT3toct8yXH/Jh2xuvJ1vtCLpVCNT5r6ASybE9epwBgY1XVG9udn2OG92e69QVTfXiHsej3YWMLSRArrwP+wvv4XdLG66F3Esi9X/07bGhsuZEJH1Z+KzPhtpDO5tJH3G71/lnfBstTikxNDFfus5hOneq9+6wl7vbUCOpaMjtqxCs5DN4vKLu/tXFcDV5jtvqIVkjbbB08kNRagw235vgMc+Q5FJvoy0NG8Mn4aBYiF63TzRj9ghlCeToLGFtcs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnVNcCm/QzGCSGwzbXT6ZdtSblAWVZ7Mm2ZbLdBHPQA=;
 b=ZayfpNC8QPWg/VyMRdsxPVLrefIt/bzWMjyAF8VHycyAR26OFsAQCO68cJwtOrsstRFpoUB/yEIhRfgUUzs2z9OnhM8FBB15OJXJ+Nl2V2hQuXMX24iq3KheEeOhYJpZaDlWGT/Se+DPH6vHRGWB/ByrLSqGoYmClnsnWG2jOL60jhK8y9AtK87YE3j0NwFK7vAmAhj+gXZ0X82mgJ4S4VPKK4rrR70tzUjXfgGpumm65MeCiY18Rpi1cAHysW1zS5wJKQ3hMkoI2NyHisWOHYbRWSdKzGsgzy+G1TLT1P93kD++Jgtxy/QpVaQCcJsZz9ikLUtpkfKp80+J32uUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnVNcCm/QzGCSGwzbXT6ZdtSblAWVZ7Mm2ZbLdBHPQA=;
 b=08BybUnxuXT78ffxsnn17m4+lTNHNxdnrf+O2qtGVEVkI1vd2IDK49M0LbEjRErj5YXZSlc4JpGA9sK5nj2uYT4nrx10h70HcS92ihLcsgk+a38iWpnJ3Y3PKQwu6sR2qhZ8zQDWcUHJftU58KMFKKIcQBLu9oDAMaS2eU7eO7Y=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 3/9] xen/arm: introduce CONFIG_STATIC_ALLOCATION
Thread-Topic: [PATCH 3/9] xen/arm: introduce CONFIG_STATIC_ALLOCATION
Thread-Index: AQHXW0b0CeS4ToPVJE2MjFHfl516uass+MuAgAbnTUA=
Date: Mon, 5 Jul 2021 03:16:46 +0000
Message-ID:
 <VE1PR08MB521501B025580BE50594A440F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-4-penny.zheng@arm.com>
 <2b604aba-1d12-7957-ad9b-114f6ad1f857@xen.org>
In-Reply-To: <2b604aba-1d12-7957-ad9b-114f6ad1f857@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 485948836F92834993335243B6FEA32D.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f6b452ad-3003-43e5-8096-08d93f635a30
x-ms-traffictypediagnostic: VI1PR08MB5392:|DBBPR08MB4316:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4316BD2BEE9BA339A193FB67F71C9@DBBPR08MB4316.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4QP0DlyVVWOzZTecZYA5Rbph7fC5qXWk9Mbj9snnY8NpBXdWWBFNvmTOTnWVxt3oueKIgeDd7nlGoX4YVVmgMaV2JYbtWYozbq9BVrFp1WQDMy2T0emIywmkmwsOhDRWSzwTdM0qU7aHg6vkw4MyBlgXE763zsmPKMLfYsLOuMHQwsk2YBlqTIVz5zmgv28rsylBPfH4TObEuZshHzSiUdE1+ijV+BisFIqMTyhXhG8n8uVum3mcxQFNJVtGCVYDUOk0AvWLncs4Cgjk9FtRZEeW6ZC1HS0FLU9Q2W9HerumVYCB1Ejx0U/1iViHpgP5EJTvgXKYvxc6jXfeVIrVxuSbkwD2slZXgdISurKYaSztkzRj8XuBYr13RIdYLBP9yV3nrfZnxbkC0HRgT2nr/KVfBzUJPRA1Nf/uHV+t06zwfrQU/rRxSsyhhcpC1i6ztKCKw5ozv34wug4dj35ar3YJMBUvXfXA4XL6127ZPEQEdmfVu4gYFWXnk79jBnJL1RqtJaiA1nBBg453AuV7U3EffCiO7tuG+Ag44QKvFs9yBYUOgnyDqC+pNu2WChnif4qpthWqBNs6y/NVtV4BdGIeRJVR1CvcuxDNIePcrhVTxndPbKKGqf/6tvk18SbWWlTUzW+i6oP5ok7WQhG01Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39850400004)(71200400001)(54906003)(110136005)(316002)(4326008)(478600001)(2906002)(33656002)(8936002)(6506007)(53546011)(5660300002)(7696005)(186003)(76116006)(66946007)(66476007)(66556008)(66446008)(26005)(55016002)(38100700002)(86362001)(122000001)(64756008)(83380400001)(9686003)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDUzOTFvY3ZmRTZZUWpkbnVuUis2SGk2VEN0bTNWYTZicTgvUTdOT2g0ankv?=
 =?utf-8?B?czJTcFNwb2tzT2lqaTluczZSVy8yTms0ZW94YTFuL0JNSFBqUDJ3OTZBMklM?=
 =?utf-8?B?aUFoYzlOclU3M01za00zZXV0ZEJiME96bjJzS3dwdUpCdy9TMm1BZXVNWDFo?=
 =?utf-8?B?bGI2cTRJZzZXWlBSU2hzYWk4aWk4MFhFQjl4aWNvd1BGL3ZIWU5aeC9tNHNC?=
 =?utf-8?B?MW00bWR2R0JRY1BESklraVNJYnlIeTdranl2cy9qNVZEUUNiQnJuUHFBamhY?=
 =?utf-8?B?Vnc2djVYV1VDZ1RyN014RE9mVXNZTU9OclJ5Y2I4S2tsbU8zZHJvcjhyNkVB?=
 =?utf-8?B?Y01HMlczaE9ESzlVcW5hend2cGJTN01tekZYM212TW9Mcyt2Ymp6VGVXdTU4?=
 =?utf-8?B?RFBodHFWT1V3ZTkzODZseDRSbFFOeG1DSzNDeGsrM3pEMGoxRExDcUVDT0JO?=
 =?utf-8?B?VjVuOWZTRHZvNjA4M3dKZytxT3hYY3pNWDlncDBaaERNTW1meGNMWWF0UDht?=
 =?utf-8?B?Z2dIZWlTUGpxQy9iMWVCdnJUTjU0V054dkRrMGlpQXd3Z05LOTh3Rmo5WWpC?=
 =?utf-8?B?NjdWMkNIUDBXcGJwRCtLUWRvQVJDU1ljMFJiOWMzdG9kQmhRd1Y2cWZVQ2ln?=
 =?utf-8?B?WmMrZE1ONkM5N0lOdWo0K3dlWWhHUFNVNGEzVysxSGpYYmVFMlYzR1RNQUV2?=
 =?utf-8?B?TUVWZUk0ODhxazd0SHV6RGcrWHdMdHVNVWhlenpRTlYydDB2bnNnRDlpZGJX?=
 =?utf-8?B?MTJsSjJ3VHRMaXByaXQ3SmxTS1o3UGIzZGNFa2kwYWRra29hamZ4UWZwb1RK?=
 =?utf-8?B?WldvN2VSb1FRUW1CL3cyMVJDZWRYUHBPQjFIY1h4MDZWNmtWak9tSTc1NlB5?=
 =?utf-8?B?NnRFQi9EQlExMUIyVmRUNVFIMTNLR1c0eWVpOExiVVZvbG9kRkhubllPL1Jh?=
 =?utf-8?B?S0dLMnpQRTMyV2dlaEtqMVMwWklvMFFoVjJYeE15NmNoa3k5U0RLQ0VEaUtP?=
 =?utf-8?B?SzZkVXQ1RitReHk3aHZ4OFlOUjRyQ09TVldzY2RrZXlMVU44dVh1eDlXSE1x?=
 =?utf-8?B?U1JuRDBuSlVTVVZZYzhjRkhsNFBhc1hFK1lUbUtBRTQ3TmNBRnNybDMwb2J0?=
 =?utf-8?B?SEVPbFIrb2NWczNQS2UrVzE2K3YwQ2QxVWVMd01aSnpiOFQzUTN0YU1KYUM5?=
 =?utf-8?B?czJzTmZZQ0NEZi96MkgrS0VkWDFiYzJJOWtDeC9neG41dy9HVXpsdlg0Y1FQ?=
 =?utf-8?B?T2FlcEo3aTNBL01yaFV2NXZOSmg4Q29iaHRnKzRndWdkOUdLbi9BSi9zNjFV?=
 =?utf-8?B?K0p6cmFmZlg0VGVsUmFpRFRYTUxYZU5nckY4bmhwMnU0RFVDOUthQTNBcEVn?=
 =?utf-8?B?MlppRG1aZi96WEp6Y2N6VUVtSUlJVzFYYkVrNmw2Tm5lSWJUMTgxSkFMbm9q?=
 =?utf-8?B?R3FGV202MzE1MDhmUHRKa01YVno4cVcyNkNsNXVRWE5zMXU1L0NJM3lQSUxa?=
 =?utf-8?B?YldtaTV3MjFjL2xqOTF0UWpJSVhtN1Y4dmVEcklWOXBJdU1ZVUZFdE5sVkJy?=
 =?utf-8?B?WmxoR0hXYlZxcVJJNUxUV20vRjNLSkFRWWJCelBqZGg3Rm9JSkRyY091M0VZ?=
 =?utf-8?B?eHNjK1pZVFVlM2JkM2ZzYXhHUjM5VHVsVDhQTHNNODhnY2FqSDJmMXVYWWxQ?=
 =?utf-8?B?YkMvTjI2eXYreHBwTEl3cFp4Ri84cXlGcGUwL0h2WSszVVdMUmtxU2xSRzhK?=
 =?utf-8?Q?I7BgtregN+UwJa4Ob2lvPK76GpMmb3REG+mnH7N?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5392
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	108bf1b6-4e62-492e-84fd-08d93f6352b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4OaXcgDA4vVXfzh9CxS7izIOmnkIclINveAoTs4V3q43aa2QNX86wj+3RPl5kt0ewEfguRFyuyS8ikiMJkzQT6Ov7PQLqj7Wlycy7FSmUBHobzG5quHpbUFeBvZrnClo4e+wU5Y819tyIx0UFcrQkftpGRa/45yp81SunKWSQQFe7AtECk+h+jF8suKcItRd0LEQ8FzvkCefkjp3/kbpnVNB/cadU3/HSvZcRVL1uTlVwYa+oK/xhm2+p3cyLwvLw382OJgyDMqWe1O62MyGr9P4wC70MB6Qaf4CX95/cO7TCESTYf8EFEShhfL43S9yABGpHnmoehYt3eapOlXVlkvRbRTySQcR/Qvi3uoDyzRRf0PBrHfX3QgJGx8pMPmpIgpj/osHHpm5eo3lYsdFEEGMxNq78mfvi1O/oBc4ULyJ/joYI0++3EGQrng0HiiQlJ/p+hlkQIQOHinCXzVoyxCtcsWgtY+zHzM6YpnWGMbaHvwD6DAGXA3giKuZn/X6KUr9bPKD1xK4Gyzs8yxkbuehfOWLTTQn3ZJBKcWcLfEtgNYJsx/PSoX1aNKGwARep1IVaWZ343KOjZ7+pKMcosET/kULzcKYtG4ta4W1BJ3AINFAVPJzAsbN53EkgTv44y4aOqpbiW680u3EzYM2yJSnGkGIxdJ71LuzaM1mKqciib5bfEKwfI7NY1fme2GHQxwmd/GUsoy5Rpw7pNrxog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(46966006)(36840700001)(52536014)(47076005)(2906002)(82740400003)(70586007)(186003)(70206006)(82310400003)(36860700001)(86362001)(110136005)(5660300002)(8936002)(7696005)(83380400001)(33656002)(8676002)(336012)(53546011)(55016002)(54906003)(6506007)(9686003)(316002)(478600001)(4326008)(26005)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 03:16:59.6446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b452ad-3003-43e5-8096-08d93f635a30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4316

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMSwgMjAyMSAx
OjQ1IEFNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxp
Y2hAc3VzZS5jb20NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJt
LmNvbT47IFdlaSBDaGVuDQo+IDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDMvOV0geGVuL2FybTogaW50cm9kdWNlIENPTkZJR19TVEFUSUNfQUxMT0NBVElPTg0KPiAN
Cj4gSGkgUGVubnksDQo+IA0KPiBPbiAwNy8wNi8yMDIxIDAzOjQzLCBQZW5ueSBaaGVuZyB3cm90
ZToNCj4gPiBGb3Igbm93LCBzaW5jZSB0aGUgZmVhdHVyZSBvZiBEb21haW4gb24gU3RhdGljIEFs
bG9jYXRpb24gaXMgb25seQ0KPiA+IHN1cHBvcnRlZCBvbiBBUk0gQXJjaGl0ZWN0dXJlLCB0aGlz
IGNvbW1pdCBpbnRyb2R1Y2VzIG5ldw0KPiA+IENPTkZJR19TVEFUSUNfQUxMT0NBVElPTiB0byBh
dm9pZCBicmluZ2luZyBkZWFkIGNvZGVzIGluIG90aGVyIGFyY2hzLg0KPiANCj4gU2ltaWxhcmx5
IHRvIHBhdGNoICMyLCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBpbnRyb2R1Y2UgdGhp
cyBLY29uZmlnIHdoZW4NCj4gaXQgaXMgdXNlZCBvciBhZnRlciB0aGUgY29tbW9uIGNvZGUgaXMg
aW50cm9kdWNlZC4gVGhpcyB3b3VsZCBwcmV2ZW50IGRlYWQNCj4gS2NvbmZpZy4NCj4gDQoNCnN1
cmUsIEknbGwgcmVtb3ZlIHRoaXMgY29tbWl0LCBhbmQgY29tYmluZSBpdCB3aXRoIHRoZSBjb2Rl
cyB3aGVyZSB0aGlzIGNvbmZpZyBpcyBmaXJzdGx5IHVzZWQuDQoNCkNoZWVycw0KDQo+IENoZWVy
cywNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5j
b20+DQo+ID4gLS0tDQo+ID4gY2hhbmdlcyB2MjoNCj4gPiAtIG5ldyBjb21taXQNCj4gPiAtLS0N
Cj4gPiAgIHhlbi9hcmNoL2FybS9LY29uZmlnIHwgMyArKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2Nv
bmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnIGluZGV4DQo+ID4gZWNmYTY4MjJlNC4uZjE2NWRi
OGVjZCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+ICsrKyBiL3hl
bi9hcmNoL2FybS9LY29uZmlnDQo+ID4gQEAgLTI3OCw2ICsyNzgsOSBAQCBjb25maWcgQVJNNjRf
RVJSQVRVTV8xMjg2ODA3DQo+ID4NCj4gPiAgIAkgIElmIHVuc3VyZSwgc2F5IFkuDQo+ID4NCj4g
PiArY29uZmlnIFNUQVRJQ19BTExPQ0FUSU9ODQo+ID4gKyAgICBkZWZfYm9vbCB5DQo+ID4gKw0K
PiA+ICAgZW5kbWVudQ0KPiA+DQo+ID4gICBjb25maWcgQVJNNjRfSEFSREVOX0JSQU5DSF9QUkVE
SUNUT1INCj4gPg0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQoNCi0tDQpQZW5ueSBaaGVuZw0K

