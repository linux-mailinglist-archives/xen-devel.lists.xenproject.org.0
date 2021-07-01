Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49743B91F8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 15:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148666.274729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lywNJ-0003c2-9y; Thu, 01 Jul 2021 13:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148666.274729; Thu, 01 Jul 2021 13:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lywNJ-0003a4-6b; Thu, 01 Jul 2021 13:05:01 +0000
Received: by outflank-mailman (input) for mailman id 148666;
 Thu, 01 Jul 2021 13:04:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T0jQ=LZ=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1lywNH-0003Zy-HD
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 13:04:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eef0ed59-da6c-11eb-8315-12813bfff9fa;
 Thu, 01 Jul 2021 13:04:57 +0000 (UTC)
Received: from DB3PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:8::40) by
 VI1PR08MB3550.eurprd08.prod.outlook.com (2603:10a6:803:84::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22; Thu, 1 Jul 2021 13:04:54 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::2d) by DB3PR08CA0027.outlook.office365.com
 (2603:10a6:8::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Thu, 1 Jul 2021 13:04:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 13:04:54 +0000
Received: ("Tessian outbound c836dc7aad98:v97");
 Thu, 01 Jul 2021 13:04:54 +0000
Received: from 62cba1562938.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A500274B-1F25-45E9-B540-386AFFCD65D0.1; 
 Thu, 01 Jul 2021 13:04:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62cba1562938.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jul 2021 13:04:21 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6414.eurprd08.prod.outlook.com (2603:10a6:102:12e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 1 Jul
 2021 13:04:19 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%7]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 13:04:18 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Thu, 1 Jul 2021 13:04:17 +0000
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
X-Inumbo-ID: eef0ed59-da6c-11eb-8315-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkfW9EFB2q2P7/g6zZD+KOXOcZxry0Qw1WOUthlY+AU=;
 b=KMmwUSWamm2G93bATLbdtbrwZqRTOeH6Dqjc8FCzczGX2xBQ6jX4VRa9f2xRISVIkOctkNrdbx3g6EaIlhRJMcGRCdxnsX2ybaDSmlB8S+dtoYWsd6thUQLgkUsV8I1uky8bujWLavPkUQ2frLkogJp640134sR8wtDvL+HJMxg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1bce61ad77d499c2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAjmqtnOPV3pNsVwMTgnk3FVVW8IGjs4uYdUWFdQRtGgmORC+xALLLdfzo09ZPtBvoB4wQEqMkfSQPyKQTSYI9WbWzlPlcycfzx/w4rP006NobIugnf8R3uJErhXxQZHvuX4cLKOZXTOq2lkb2uT2+ZfdGRJDM0uCp1GiP/nlTvHxtCUPdf3FHbEYBDUmfdXEoAmL8PKHFxbSm0rZX6sW90jh18iw+3Oz4C/YYEMkIc2fhoTaOA5y2UNXVNXG4aJqRCFYRDCMmJHITj4caQkldOdr7cK23q+eoV+sWu+DvQLcME+8lAPexslx1QrAA7F9k4P45Q85Ulm8u5CJ2Qf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkfW9EFB2q2P7/g6zZD+KOXOcZxry0Qw1WOUthlY+AU=;
 b=lctB6daPaK074qTrjWz4FVwUlSaNJUjeCI4Woss0ZTBmIYRWPvfxTCBoBQygI511S44klfmdfyScMY0aM24jSVLfI+10ZPcvOuj54qEW/GTtbAyMaA325F9wbT9VLxwEJi5VwBISTkEzN2N1bTOivtiHWeju+UHN5aqBlB7yyG8VX3eydoaBWfkTv44TYRzC4FWqGLgu+if5X9PReNm6y1F9wzTgsX5MglP4WplkdzMsyz76pqGy7vOEwYHO1pJMPLBmEbW6llv6AURK7fhwRB2g7m99rOdEpOX5cM7wNcqrgnqXQolJrn4qbgrYepqZGJwFl1TjRKITs4YrKWcGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkfW9EFB2q2P7/g6zZD+KOXOcZxry0Qw1WOUthlY+AU=;
 b=KMmwUSWamm2G93bATLbdtbrwZqRTOeH6Dqjc8FCzczGX2xBQ6jX4VRa9f2xRISVIkOctkNrdbx3g6EaIlhRJMcGRCdxnsX2ybaDSmlB8S+dtoYWsd6thUQLgkUsV8I1uky8bujWLavPkUQ2frLkogJp640134sR8wtDvL+HJMxg=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 6/9] docs: add doxygen preprocessor and related files
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2106231456290.24906@sstabellini-ThinkPad-T480s>
Date: Thu, 1 Jul 2021 14:04:11 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D3534B9-30AC-484F-B2CF-02822D3D1226@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
 <20210510084105.17108-7-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2106231456290.24906@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dba9457-aec9-4f1b-3dff-08d93c90d20f
X-MS-TrafficTypeDiagnostic: PAXPR08MB6414:|VI1PR08MB3550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3550A5D37A56F26CF17D4F9AE4009@VI1PR08MB3550.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XZOS+bvUR2FfY1emeJGouVdbxzw4GOrmwlZ2NqUdoHUGRpzWvbDkk9K3ZA/vzuoLks445PvEdZwangs+5L423wgnIJMOtsD0BiRTaRzrjQULwbgWEQSxT21NbiBzTvIn5Pboz6fYSCbDwM3wvIpN67aVTuM7oCDiLBbM3D75XPRr9gxlE1TCvmQt27i05KzgN/SOxIP/zvA45WC0QRCZgYQpVOu6IaRvZ7lvdU9ap5apq7IJadDlUrXosh8Rox/Qx3dni12iuPG1ufA3d3ZPqYpXp2oJCt//bQgX427NbsOjxW59jNldrGLBsgls845L+HThrdQrlkpFZOddMHfg2MgpVPlgUeaqAEp90c93XLAJmncg8NBdbNFa8qAkyD8bcbTQWrfahpTGibFuYfIcKuZh6xgkIB0OJuYRLYfu6G73TWzKPeFiZ+IjQuTouqWpbkqWT/uZvcl6/TGCf8W7h1aPnpL2XtuQwpsxoLVf+uof6P8Dd/oSTyLa19CnQ1W5tsBQYk65tZ5I/jNZnwEjns6WkJLIIZmUBd8iM4oc7Ei4vQAeSZ+RvRT0XZnsflZwUCWWhkBp0Vf7XGbjJz4BuUBaHsykdAxdT6kyyXfki1tk4HufygD01fiDLRYESWWp+8eg2AFofhnJ+TOpQqLa9FSldXZO4AN7nQBPUVbF72ZO+0p0f/7ZO5BYrEMLOTaaQps+6AS/QAGa7TQMaxiiU2/Q+XjyI90Lt3Q4d6/JDjc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(39850400004)(376002)(478600001)(186003)(316002)(6512007)(6666004)(38350700002)(16526019)(6486002)(4326008)(54906003)(5660300002)(53546011)(38100700002)(83380400001)(66946007)(956004)(33656002)(86362001)(26005)(6506007)(44832011)(8676002)(66556008)(2906002)(66476007)(6916009)(2616005)(36756003)(8936002)(52116002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UnV4QlhDbFliK0hHQTdRWVh6N242RkNKaUNXTUtQUnk5UmIzdktad2loSEN3?=
 =?utf-8?B?TVlHTHlsa0pWTFpZUGIrbkMxaHhFU2hiZ2pndXgrdkhuUEtLazJnNmZMQTlx?=
 =?utf-8?B?d0szeXpjdzBkc2tQSzVUWXFUOS9lUHBaRHpvbDZDcmJHR1l4WFNnMmZRUzA4?=
 =?utf-8?B?cWoyajBlWmNzczdjTmdCM2VhSjZuM21QaDRVT2ZUaDNVMDNRdllrWkdaQ2d4?=
 =?utf-8?B?dVNveE5lcUJvbnFyUDlYQVVDbExkV0hwam5VOHVTNXdXSG8rU1p5MzdFUmdJ?=
 =?utf-8?B?c1F6alJWZTJyN0pPVGt3SzhyRWFhcEVMVWhoL3ppTk9kOEU1ZnQ2ZDJIRDZr?=
 =?utf-8?B?THRyMVVlYUppMUlMRDhjSzY4NXo0dG1KbitvWXk0cW4zUlI5eGF0VTd2cWpD?=
 =?utf-8?B?NlZwcHowdHJRMzZ4VnkyZE9lVHgvenZDUDBwdWtaU3lJbURCc2xTRmJHR3ZC?=
 =?utf-8?B?bUpUYm45SUxLZmFRRTdiV0NrVWhESk1HNDVGL2xNMXpzVm1MNS9aVVB3ZnFv?=
 =?utf-8?B?aG41ck5Ud3RDUXJKVExjVVhabnN1NGIydDByUTNBOVc0bjlva3RraFZtY0cz?=
 =?utf-8?B?VmJrU2RIZnBFZkwzc2lQOExVWVFZbXhXUWNBL2QxVkVEMm03R3l5RVdCNlp3?=
 =?utf-8?B?SzVScGViZUdFUlpUVlFUeGk5aVhyZkplMGRvMzJRckQ2OTlBQVF5R3V2b2xh?=
 =?utf-8?B?WWpwRGd2WFNuZzE4a1oyVEI4cTl1Qk9JTjhlN2JNa1FwdTBrb29icHBuV1hB?=
 =?utf-8?B?ZmpvdnFOQStEd1BFekMralB2ZjJzN3lMUXFiOEg1NC9VM1lyNkJ0OVBBSURK?=
 =?utf-8?B?amFQdzhjaVVnOC9JM09tdkRKTS9wSVJMRk1QdndJZ1Z2R3dvSFFhVkZpTXNO?=
 =?utf-8?B?dmpWcHRnZU9ScldSZS9JcHdRSmpUQVRIUU94WERGdzlPbTNSeWFTcVczZzdv?=
 =?utf-8?B?WFk0Z25zbHNjWDJpalErTGY5bHdnc1pTbkxLWHNaOVVFU0poWVBKMWI1USsy?=
 =?utf-8?B?a2V0VVBwODVsclhWakhiVlpOTzJONEYvaWp4R1ZMcGpUYUYxaldoVnhML1RM?=
 =?utf-8?B?MlRuM0k4WW5PWHZVL1BmTzN5VEMvaTYxQjJvNmx2ekw5Mkd2cTQ5ZUJOSXdJ?=
 =?utf-8?B?U1VSdVJ5RUQyMTEvRjJFcUlGN3VIaC9UeWdxdGJhb0JOWEdVd1BkTUdnWGNF?=
 =?utf-8?B?N3daOTlMclRuZTZWQnlIcjUzRUZDenEwZ2YvTU5KVWh5UWpIUmgyWkNIZmlp?=
 =?utf-8?B?eWlOUEEvZTQ3dCtPeElBSmVMbEIvS2Jpd3kwSzFCS2pNdE0yRWpaMUFyMVJB?=
 =?utf-8?B?U0gwaDFJbmNjd01DbUx6bjl6dCsxQ0M5d1hvanFlOGRiamJaZGNWVXRsUkNE?=
 =?utf-8?B?Mk9GS0FpQzhpN0I1UyttZGNWZ25TK0RHRk1MWnAySWJmMGNMSkpITlFucTFH?=
 =?utf-8?B?MWw4eWVQaktQYVFpZmFDeGhsM2JmS0drSDB1L1pKcEh5Q2xZbWFxRXQ0SWZZ?=
 =?utf-8?B?Z2FvOFNxV3lOUmp4aTVRZXh1R3pTWFlnanBwc2Z6UXpVY3VHdDdiS2hPaTZl?=
 =?utf-8?B?Sm9DWjJWaFdqeG5Kc2pvelRFWndYWmZ1NzRHNnovcnF1UUVVZUJCUE0vYmJh?=
 =?utf-8?B?SjB4TnNGdDAvQkowSGtkOGdDUUdlbWFxQlF4M2NkdGFhSytVT3EwYXliRnRk?=
 =?utf-8?B?NHRNRnBIUVo1Y3UyZU53SXZyazFWR2R2R0JoSEdHdTQ4NnRCUC9nNUtuMkZZ?=
 =?utf-8?Q?Ex9Y7BtLj/fEKTTAgI/Oz1lpg4i2XClsEhxkQz2?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6414
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	384fa76a-92bd-442c-65b3-08d93c90bc43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vwIG/kIHqNdIHIiYmKBAM+Bc23G0H88UqKgK9iOUaUkwleFfD+ybXbDMuHdkcd0yp0TRehz6ezZJTlOtsrFaJgC2cidSOMpQuAnV6l4ffwGTIUVDhtaXd3Qk2paLRlr3rSqcLDHVY+iPpp3WciRPfWhxQL3zqlgLD9CFouSXxBUg+Vh3KGFL8ziQJh9ZOvZDM5Bx61F21Y6QTZpjWHfXPiYqjI6yj6cJOB+uigjwnr85YM6LFkMYES2hET6+Dw3GSwsnwbfBkqZU3aHPM8Icrc3UD0P0ybAm5Fztb+hMXZfSlWclQT1XOIgurimp6qNOHZevN06nDoyA16tGWvEcT3ByAmZeCqJKJHoTmoo8pQJi075/pC/YuKQlbb+oBXu3zfaFcU8c1GUP4sIjU6FfZJ5wnTn/r+7an2DvMmFQVG/LHGX6AfPS0gwtrTSkMrKoQku8BCXp43Kll/Pm7IA2ny2/sJAYwKswY5zjDUWUk+LvdLJypTen07tnWQYT211yCmooxhNU5SjIXZEAgBu/P1pOsiTdfDpTXiTLZ2bPmObSJeudLckUrxHUf5WlPnT80yKCpoSQTAjAp3lvjKyCf/dpTjAgJhENhXdXh8i2Di2zsascoMnCQ+DwXPpVXBICJxzx4RD7dLW5I/Xy6FeT59o1rzAGeUzXSq9lb3K53GBJX1qZzT88HQ8W9LpRLt5c2eXVE/zmbfa9Sj+4snrb5Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(346002)(396003)(46966006)(36840700001)(4326008)(82310400003)(6512007)(336012)(2906002)(6486002)(956004)(36860700001)(44832011)(47076005)(2616005)(33656002)(54906003)(83380400001)(82740400003)(81166007)(26005)(53546011)(6506007)(70586007)(8936002)(8676002)(86362001)(6666004)(6862004)(36756003)(5660300002)(70206006)(356005)(186003)(478600001)(316002)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 13:04:54.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dba9457-aec9-4f1b-3dff-08d93c90d20f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3550



> On 23 Jun 2021, at 23:03, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 10 May 2021, Luca Fancellu wrote:
>> Add preprocessor called by doxygen before parsing headers,
>> it will include in every header a doxygen_include.h file
>> that provides missing defines and includes that are
>> usually passed by the compiler.
>>=20
>> Add doxy_input.list that is a text file containing the
>> relative path to the source code file to be parsed by
>> doxygen. The path sould be relative to the xen folder:
>> E.g. xen/include/public/grant_table.h
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> docs/xen-doxygen/doxy-preprocessor.py | 110 ++++++++++++++++++++++++++
>> docs/xen-doxygen/doxy_input.list      |   0
>> docs/xen-doxygen/doxygen_include.h.in |  32 ++++++++
>> 3 files changed, 142 insertions(+)
>> create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
>> create mode 100644 docs/xen-doxygen/doxy_input.list
>> create mode 100644 docs/xen-doxygen/doxygen_include.h.in
>>=20
>> diff --git a/docs/xen-doxygen/doxy-preprocessor.py b/docs/xen-doxygen/do=
xy-preprocessor.py
>> new file mode 100755
>> index 0000000000..496899d8e6
>> --- /dev/null
>> +++ b/docs/xen-doxygen/doxy-preprocessor.py
>> @@ -0,0 +1,110 @@
>> +#!/usr/bin/python3
>> +#
>> +# Copyright (c) 2021, Arm Limited.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +
>> +import os, sys, re
>> +
>> +
>> +# Variables that holds the preprocessed header text
>> +output_text =3D ""
>> +header_file_name =3D ""
>> +
>> +# Variables to enumerate the anonymous structs/unions
>> +anonymous_struct_count =3D 0
>> +anonymous_union_count =3D 0
>> +
>> +
>> +def error(text):
>> +    sys.stderr.write("{}\n".format(text))
>> +    sys.exit(1)
>> +
>> +
>> +def write_to_output(text):
>> +    sys.stdout.write(text)
>> +
>> +
>> +def insert_doxygen_header(text):
>> +    # Here the strategy is to insert the #include <doxygen_include.h> i=
n the
>> +    # first line of the header
>> +    abspath =3D os.path.dirname(os.path.abspath(__file__))
>> +    text +=3D "#include \"{}/doxygen_include.h\"\n".format(abspath)
>> +
>> +    return text
>> +
>> +
>> +def enumerate_anonymous(match):
>> +    global anonymous_struct_count
>> +    global anonymous_union_count
>> +
>> +    if "struct" in match.group(1):
>> +        label =3D "anonymous_struct_%d" % anonymous_struct_count
>> +        anonymous_struct_count +=3D 1
>> +    else:
>> +        label =3D "anonymous_union_%d" % anonymous_union_count
>> +        anonymous_union_count +=3D 1
>> +
>> +    return match.group(1) + " " + label + " {"
>> +
>> +
>> +def manage_anonymous_structs_unions(text):
>> +    # Match anonymous unions/structs with this pattern:
>> +    # struct/union {
>> +    #     [...]
>> +    #
>> +    # and substitute it in this way:
>> +    #
>> +    # struct anonymous_struct_# {
>> +    #     [...]
>> +    # or
>> +    # union anonymous_union_# {
>> +    #     [...]
>> +    # where # is a counter starting from zero, different between struct=
s and
>> +    # unions
>> +    #
>> +    # We don't count anonymous union/struct that are part of a typedef =
because
>> +    # they don't create any issue for doxygen
>> +    text =3D re.sub(
>> +        "(?<!typedef\s)(struct|union)\s+?\{",
>> +        enumerate_anonymous,
>> +        text,
>> +        flags=3Dre.S
>> +    )

Hi Stefano,

>=20
> My python is a bit rusty but I thought this is really clever!
>=20
> One question: given that anonymous_struct_count is local per file being
> processed, it always starts at 0 for each header. I think that is
> actually better from a documentation readability point of view.
>=20
> However, is it possible that Doxygen gets confused in a case where we
> can multiple "struct anonymous_struct_0", e.g. one for grant_table.h,
> one for event_channel.h, etc. ?

Yes this is a very good point, I did some experiment and it can happen, how=
ever so far we didn=E2=80=99t notice any
problem because all the anonymous union/struct were part of other data stru=
cture, in that case there is no
problem at all because we have upper_data_structure::anonymous_{struct/unio=
n}_0/1/2=E2=80=A6

So given the fact that is difficult to have clash, I would say we can handl=
e any future case separately.

Having a global numbering can solve the issue but because the script is cal=
led separately for each header,
Implementing it will involve some changes, there should be a file to mainta=
in the number across invocation
and so on.

Let me know what do you think about that and if in your opinion we can proc=
eed the way it is now.

Cheers,

Luca




