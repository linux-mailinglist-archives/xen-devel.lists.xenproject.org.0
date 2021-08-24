Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C3C3F571B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 06:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170651.311492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mINu9-0003jL-3d; Tue, 24 Aug 2021 04:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170651.311492; Tue, 24 Aug 2021 04:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mINu9-0003gO-0A; Tue, 24 Aug 2021 04:19:17 +0000
Received: by outflank-mailman (input) for mailman id 170651;
 Tue, 24 Aug 2021 04:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uHFs=NP=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mINu7-0003gI-9j
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 04:19:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1283d1df-39c8-4f19-b871-73eb3cf6d764;
 Tue, 24 Aug 2021 04:19:12 +0000 (UTC)
Received: from AM4PR0701CA0025.eurprd07.prod.outlook.com
 (2603:10a6:200:42::35) by AM6PR08MB4007.eurprd08.prod.outlook.com
 (2603:10a6:20b:a1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 04:19:10 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:42:cafe::f4) by AM4PR0701CA0025.outlook.office365.com
 (2603:10a6:200:42::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Tue, 24 Aug 2021 04:19:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 04:19:10 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 24 Aug 2021 04:19:10 +0000
Received: from 1659e92aa7a3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 612CBD8D-79D5-4AE2-B615-6CD1A9FE021E.1; 
 Tue, 24 Aug 2021 04:18:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1659e92aa7a3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 04:18:59 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6960.eurprd08.prod.outlook.com (2603:10a6:10:2c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 04:18:57 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 04:18:57 +0000
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
X-Inumbo-ID: 1283d1df-39c8-4f19-b871-73eb3cf6d764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B/xjtBpUOxDahcCe8b/trxJvEWYMcCovUcpTJ0I3SU=;
 b=LBBbAN3jVJ4U0lJVViyXcueTUPSmRudrEf2Z2OgdVil5/kRvoqwfCZCRr73I1P1kSw/Lza0Sxwv274/GxE1vvUCOQ8cTcENPpqBqLOfKtnAFEGNt3Pji7fKCb6mYFp8iQiFcet8Nt6N2wIEbZjbO/kQlGcDak7LBsGe3fwBUA9s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnqLjSUoUdXlGnWpX9sieRpofaZUlSK8LKt9rFPn5l2DKNVlbnJKKlmSprSX7t4hQ5yvhLOx/HbG40r2yHleSz0bZMiov6m/tDi4EP6hRz2+K7eSVs4TsBQUfPEi9rtYNwxSpL5VYJLDs75AdOlI1uqJg9jMITnteleAlAHb+OxA+Toygubz7OIzfDicscerl4HpS39wkoBCO+IedJdcbz1fw+NF3tRyNRe2RYIx6POH903kXxHh/Wx2sZ/97FOSf/mNjF0xyEhGHqiGRsmj7tbu/rOF2WNs447Ykh+P6zqKNewTFJnMGvr5yw3BkmQPSnH0lB9Y4pGe3xfQZ9+7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B/xjtBpUOxDahcCe8b/trxJvEWYMcCovUcpTJ0I3SU=;
 b=OwDNlicXpPjYykvwpV6ideVVn62djmt6CrICZPs7jpmzvSxr6n1cAe82ZcKG5f/ySsxtir/lbtz8cbfmX1be4IejLawgikk0JLqbhR4Z8QYDxAFAlfKQGAyEyqKYmDgK1C9CU9KjImohAmdN5AnDjcbOJ9IfTrJ4cjk4Nph8qvsozmC32kPJkXaiDfH1eH48/UkmPNuYepUjsBsVRukZZQkiphVm4tMHb5APsqYjgf3DxkkRU/mbeBqWsukkjdVuFdGTkrT0dAM211Xpkkxvla0H6oYGOc/hv4uuPFezCaA6rcsVjTw/Nsppqig5oH+wn+aqoriuqyuCFwnuu+m44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B/xjtBpUOxDahcCe8b/trxJvEWYMcCovUcpTJ0I3SU=;
 b=LBBbAN3jVJ4U0lJVViyXcueTUPSmRudrEf2Z2OgdVil5/kRvoqwfCZCRr73I1P1kSw/Lza0Sxwv274/GxE1vvUCOQ8cTcENPpqBqLOfKtnAFEGNt3Pji7fKCb6mYFp8iQiFcet8Nt6N2wIEbZjbO/kQlGcDak7LBsGe3fwBUA9s=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 09/40] xen/x86: Move numa_add_cpu_node to common
Thread-Topic: [XEN RFC PATCH 09/40] xen/x86: Move numa_add_cpu_node to common
Thread-Index: AQHXjpsxWzM+1+Y9tEG1bhQyDwIVUKuBcpmAgACuDNA=
Date: Tue, 24 Aug 2021 04:18:57 +0000
Message-ID:
 <DB9PR08MB685766A6223512E9D954A61A9EC59@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-10-wei.chen@arm.com>
 <b867041b-0b36-c197-a54a-28cb58075c94@xen.org>
In-Reply-To: <b867041b-0b36-c197-a54a-28cb58075c94@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 40C334157FED7A429930A6AFB7F0E006.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 14158035-4ff7-4d29-a14d-08d966b65297
x-ms-traffictypediagnostic: DB9PR08MB6960:|AM6PR08MB4007:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4007AA331C285DB31D4A047A9EC59@AM6PR08MB4007.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p4FFqiP7CXhJDWmcrQlcbXBJbTbkmz40Fp/+/QS94jXi44GU6FKFVtrE+Qo4hhvLSgIVw1h5Ce8R5+R3W0JRZ9zbqdzHDntcrupA2ZgFXX+y0uOLsKWTiPDa4tI6ESnbOK8WXF0PSVyyuya2JR7B9RT59PxhXmn4yQqsXPnBl4vmAY9GgIHiMkdbZlUbPTKJ++uhuur8KosVTGdxf3anoJUdKEDn2J3FWveYeyaKW8KB9fZWk37myErSrZKGV8YLaelf/NKvn0aB1Me4/UeAvfLjBvPuoUofcUYjw7SettrSmb9MSPewvIVhPwBnYA9iDS2Td+JEy1R1LwyrSUUwDevrrcWozeaJnmoSr805YtevfysUiX13nCXaEk2AcQcvJoR6CJYx7ytp5JTSsJhON/m3Q+09t0VyIJ/r9Uxoin41W235Gc0BFKvUhd+KvAh1pgoqdoCtpfSkQQmdNOrDywlLM1GwTcc+SwaLiFzU179OixFIunW4a71n90zBYH68nDEZopDlV3d3Wrd5DgQpKfWO5rasLlRFzi/JeqWcgrLwDwqEcnSshQ48IEpAOXouo7o/OhCpOcq9uzDIK1yPAPuOIiROUpRtAp2o5f2SjUvNRtzDZiSaBKITt30370odi5FlHgTOfobtDwqYaSWaYVAoZZPThXXGo2b2BRz6hb4xqgb8oaoyykhTMjoxGeDREMqgR2JPRJNVTsUxs+7USw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(33656002)(316002)(7696005)(66946007)(86362001)(53546011)(5660300002)(186003)(6506007)(4326008)(9686003)(71200400001)(38070700005)(38100700002)(55016002)(76116006)(66446008)(52536014)(64756008)(26005)(66476007)(66556008)(110136005)(8676002)(8936002)(122000001)(478600001)(83380400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3dRSmFER1lEaG1BTWhTazRkV0VtaC9RWVRoNnlwRlgvbnUxWDRPbXBqWG1J?=
 =?utf-8?B?T0R2RG5FK0dXazdmMmx2cHFDMDlVWGV4RVJhUm5NUmNBSnRVdlB0ZXh5Tyt0?=
 =?utf-8?B?TnB0N2FyK0NvM3EvKzVQK3M1VVV2eFBSNGZpd01aOUZiUDdiRUpPSlBTZVJh?=
 =?utf-8?B?NW54REFudG16S2ZKL1lxZlI1WXdMdEF3bFRLTytPQkh2a0t6MFRwWjlOZ2Q5?=
 =?utf-8?B?ZS9WbzdpeGNJZzVCcDExbzl0aHJEVnh5eVFmaGh3WFdyYlBrM1lOVVRodDc3?=
 =?utf-8?B?T2xwei9kQ2dGN0VoOHBtRXI5NDF5ZEplTDkyOEFuK3NXdWsvQkJhZ0N4eWNr?=
 =?utf-8?B?V0dxK3Q1Yk9KQ0d4SjNzNVV1aWxab3pEN01uYWp0dVFiWTliZnM0N1B2T3U2?=
 =?utf-8?B?TitKeHNCYkRmalpla2FUM1NiWlVleGpubWhHVTU5ZU50R3dPQXp3WTdVV1JG?=
 =?utf-8?B?UGowSVpoTU1HM0g0cHgrdkZkY0RXZERzck1UeGQxUE9leDZTZkNkbmp2bnhm?=
 =?utf-8?B?WWFuVU55YXN5NnRuRnBtQmtSMXlFaEV5blFlVFdveGxsNXF5QUZRelgrOFkv?=
 =?utf-8?B?SVVscTVKSTlZcTRNQ01ic1JsRnJyVnZNbVhIV3BVM3ZhM0wzZDdIQ2I4clMz?=
 =?utf-8?B?RTFHNEtmZWtJby8vemIyOVd3YVhjTkQ3M3h1WjRyY2ZiSTNiNGlvUFo3UmZC?=
 =?utf-8?B?RDFycHdweCs1SEp0TU9DSU5XYll0VlRnZ1RORktPZGs3OGtPYVEyVEVDdWw5?=
 =?utf-8?B?Q05XdEtsSVBaaUtNMEpGSTl2bFk1Qm40eHBIOStMWG14R1lqVjZMbGhvQWRL?=
 =?utf-8?B?VE5ncDA0TGYyNUZnRmM1eGcyZHAxLzdPNUpEdjNDQjFtNzRQMldWOFlqSmYv?=
 =?utf-8?B?Z3dyY2lvKzE0Yi91dkh4Y3FqVVFZNCt6N2dnL1BaVm5KNGdGNm1KaEtBdmlZ?=
 =?utf-8?B?TXdONVdIZFdKUy80M2IyQ0pOR3NTOGZPQ1dpR2ZUcmJ0WGtub2lkdis3ODhs?=
 =?utf-8?B?SWNna005R0M0UUJnQUlXMytvbU5QMlg0bm5IajFpOEdURGxjUVVIby8xeUF2?=
 =?utf-8?B?QWQxR0llVENSVzJ0cXRYblcrRU8ybXY1R0FtdlVyUkZqcERsNHpPWUJXWERw?=
 =?utf-8?B?clNBYWk4QWpVazNKUG9lR1llK2NBMHR5Wm5pM1ErS0FEYWRGck5iaU04SUQy?=
 =?utf-8?B?dllObmRqalZPS1h1UXlCUk1QcUtuMHB4ZG5qTElPY2NBd3BqZU5oZUQwcnVl?=
 =?utf-8?B?VkM1amwzOGlsYUozdHM4Y3B1elpOL3JsWTR3aUh0Q3I5VWNtS2lsM2cycjZ0?=
 =?utf-8?B?TmUvbGFyQm5RWmNBWWhrTXZnQ0NnTG1BUERSOEt0d0srQWcwOW9KNVc3Vzhq?=
 =?utf-8?B?bnBKQklKL2hGTjBMNmswekVVR3ZNWGhHSWRnREh2a2VNZ2FnWmdHanVCaFI2?=
 =?utf-8?B?Q2tDSDhRZWg4TmlvbEw0ZEVkcUV0VDNVMHF3Z214aWlyK2RJbUFXcEJIQ2Ey?=
 =?utf-8?B?cVM5TnhacE9lMHRDOTlpbjI0R2R5VWtIdlFqSSt2Z1Z1bnNmdzVvNmJ6L3Zq?=
 =?utf-8?B?emV2Wm1UdG1ZQTQzMnVib1ZPK3BucjgxNXVQVSsxZC9mSTR2aXIzNC8zTjBJ?=
 =?utf-8?B?YUJwL3FaOFNKNHFKNE9Qdkc5RjVraUQ4RHlLRmU3dnVQSHFWWld4bUtWUTNs?=
 =?utf-8?B?K09HRnRDNlhPN2crNzR4d0pTMFBMMWtMRW9tNXJoRFNBTTFFNVVEVEVxV05G?=
 =?utf-8?Q?+H/GISBBaagTHv+nokeQVklBuM4T5rD0gcEujfw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6960
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25b65ff7-ae5d-484f-ab80-08d966b64ae1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	meCJDl0zjmjGTQY0Z5gSznshiDt5Zh6xl1QrmMxm7TB05wHfcFl/TiHGsNew0LWWwMKHuuAHTuZkVaW976Ojo98t3nZUrcT+kQ3YwmakXaOw9sCF7Fet8yabdS1Ow73f5g5HZWCXTwy/45QW9PQVLNEKisZ7Agez69gKfxRv+WDiixOLeInlJoi10Kxwfb8yyKwUPcowuZeK0oY3NiGFfckeDu4IdFNCqYI8Cgp7POkOwMkXckqrYICtE3FyETuxKD/nLfQDH0ywU7oiO6tCjrm6By2nIoxdnccsPEhsoFSasn2ffDa333BkRRD4567JthVkxydCaCHdrWmqWZgX+yVpYh5PrLonSrm7e/Ay5tyjpmz+ORHTGc6aJXIzVhO8utVtzVxLsYszffVuOaCC+BzG1bNWbDnrtI7ZWvaOL9p7JRuKTkWpn38VtPf5uWEy7lmoztvZDNSHyxI07MAXroVs5u8MR6rfM7w8yphTiXePeu5fwMndsPhlDs8TF1BOaiSAWUXuuNGxOFDvVoDAVpL08Q8ajSdL7sFmGo/90MSChAha6XRkoqqSI5GTFJcaXPdQgJ7mu5Jowfy14SGQBQgGDCEqqADad4zKWL1mpeFxGLcWBidXGVF+0GrlZgHH+xCJwP1tX1BssBR3cL7EYVIAbhRjF+QSC7wea8ejPBLdw+tBC2529ztVI8j9b4TAGpmOh42BXUqjpVbjZxGnrw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(81166007)(356005)(110136005)(82740400003)(8676002)(7696005)(478600001)(9686003)(55016002)(26005)(8936002)(36860700001)(33656002)(53546011)(86362001)(82310400003)(83380400001)(6506007)(52536014)(47076005)(316002)(70206006)(2906002)(186003)(4326008)(336012)(5660300002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 04:19:10.4326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14158035-4ff7-4d29-a14d-08d966b65297
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4007

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjTml6UgMTo1NA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAwOS80MF0geGVuL3g4NjogTW92ZSBudW1hX2FkZF9jcHVf
bm9kZSB0bw0KPiBjb21tb24NCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDExLzA4LzIwMjEgMTE6
MjMsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFRoaXMgZnVuY3Rpb24gd2lsbCBiZSByZXVzZWQgYnkg
QXJtIGxhdGVyLCBzbyB3ZSBtb3ZlIGl0DQo+ID4gZnJvbSBhcmNoL3g4NiB0byBjb21tb24uIEJ1
dCB3ZSBrZWVwIGNwdV90b19ub2RlIGFuZA0KPiA+IG5vZGVfdG9fY3B1bWFzayB0byB4ODYgaGVh
ZGVyIGZpbGUuIEJlY2F1c2UgY3B1X3RvX25vZGUgYW5kDQo+ID4gbm9kZV90b19jcHVtYXNrIGhh
dmUgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uIGZvciB4ODYgYW5kIEFybS4NCj4gPiBXZSB3aWxs
IG1vdmUgdGhlbSB0byBjb21tb24gaGVhZGVyIGZpbGUgd2hlbiB3ZSBjaGFuZ2UgdGhlIEFybQ0K
PiA+IGltcGxlbWVudGF0aW9uIGluIGxhdGVyIHBhdGNoZXMuDQo+IA0KPiBBRkFJQ1QsIHRoZSBB
cm0gaGVscGVycyBhcmUgZ2F0ZWQgYnkgIUNPTkZJR19OVU1BIGFuZCB0aGUgb25lcyBpbiBjb21t
b24NCj4gY29kZSB3aWxsIGJlIGdhdGVkIGJ5IENPTkZJR19OVU1BLiBTbyBJIGFtIG5vdCBxdWl0
ZSB0b28gdW5kZXJzdGFuZCB3aHkNCj4gdGhleSBjYW4ndCBiZSBtb3ZlZCBub3cuIENhbiB5b3Ug
Y2xhcmlmeSBpdD8NCj4gDQoNClllcywgeW91J3JlIHJpZ2h0LiBBZnRlciB3ZSBoYWQgaW50cm9k
dWNlZCAhQ09ORklHX05VTUEsIHdlIGNhbg0KbW92ZSBub2RlX3RvX2NwdW1hc2sgYW5kIGNwdV90
b19ub2RlIGluIHRoaXMgcGF0Y2ggdG9vLiBJIHdpbGwNCmZpeCBpdCBpbiBuZXh0IHZlcnNpb24u
DQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

