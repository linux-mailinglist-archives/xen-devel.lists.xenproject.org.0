Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7122CAFDC43
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 02:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037530.1410146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIWJ-0002Sq-78; Wed, 09 Jul 2025 00:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037530.1410146; Wed, 09 Jul 2025 00:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIWJ-0002Ps-4G; Wed, 09 Jul 2025 00:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1037530;
 Wed, 09 Jul 2025 00:18:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0OMD=ZW=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1uZIWI-0002Pm-4b
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 00:18:42 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42f61bd3-5c5a-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 02:18:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 5690IaLt021958; Tue, 8 Jul 2025 20:18:38 -0400
Received: from XCH16-08-11.nos.boeing.com (xch16-08-11.nos.boeing.com
 [144.115.66.119])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 5690IVAB021928
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Jul 2025 20:18:31 -0400
Received: from XCH16-04-10.nos.boeing.com (144.115.66.88) by
 XCH16-08-11.nos.boeing.com (144.115.66.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Jul 2025 17:18:30 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-04-10.nos.boeing.com (144.115.66.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Jul 2025 17:18:30 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 8 Jul
 2025 17:18:28 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by SA1P110MB1503.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:191::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 00:18:28 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%5]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 00:18:28 +0000
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
X-Inumbo-ID: 42f61bd3-5c5a-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752020318;
	bh=NJhMUKmgXRm7rG9wDak+cZZvg3maGhU5bn/MU/R2Ynw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DGHIxnPfEFXzAeL+4bPubK/xQOg87EH9kmGDb4K4TGugmRwc2qylv4RJv0VTQvjDs
	 WtKrZgJGXRv2/f6jXiXvAqyS0MJlLe6LNGV3AAuJOpsK3qM1piVkGfjMnEOI1TSQ/h
	 NVWt45+/FWIvruKxz2abhGv0E8YWZEdI/zTCffMxTE+WnN5hR2f1klFUDHL8WzptOG
	 8hhGjrzMkC0Gei+kTjrNI84fCHgyXIm7SEZyE/3kuBkJPH3suXN8jnlFAHhRI1RAcu
	 2aVgOsFTOBGd/nJ5Lrg5/gfhkKZMm4jfztxSVNGg0fQ6GAhE6gTUowJFjm8oPyMq2X
	 7uXOb6TZjgDBA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=d94tez8U7f4guBBraljpvsvESGBsiPq2acHRWa8MGlPc96MGFjh8tq16WymJeKfK/NNwGQaSBwHvJZSfUdWJOJuhGOjBNUFd6FfVjLuewNOjc7zmhzBnHfy38PWi9INsq0pFUS15Lkx3yXOBEuUzDOuDHRBjFOVFgPh4SaomrqDgY2dE3j7SBKS5jCroWdDgk3117MxoDGmGBANrvZQZ8N6lBduLP0rUyIWrjjUDyc/DTtCKdoNlAkc3drL7v8J3y3yzMQtUu6j74D4NHEhGB5CpcL8+EuV3rnmFJ0kmKTd0HF/ESG5lCgOACM2bGMTJcLMSV/xLSrkksD5xfxELJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJhMUKmgXRm7rG9wDak+cZZvg3maGhU5bn/MU/R2Ynw=;
 b=yfH1Wn9WcLQah6zz8QRcJiHYjmVQiIsJbGSOB1zCq8fNO/7orNK7ZLszVYtamSPiigqb64FFcvtcjJXCEB7jwPhek1xXiH5VoL+gWP1WDscHQ7VwltDkPu7Ndcw0eC9xdBBvx2FuiUwjUD57WorGfKnO0KWr5rsLKzFxTGIe807rnjEOLm8E+gfffvyi0/f/L4caLmmbtvP/jJO5C+6gpJDgcxHF1PPVRDqzqUmzIBgSC0GZ4cFQ2CP2EYcVrQ+VEcNMUVuCulWx/gQUUGj/UaSpu1Dshd18TMDsEqAhRpJIeay7QtrVWwSi3/7Sgglgw1Y7kpxM00EXwN6A1GXBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJhMUKmgXRm7rG9wDak+cZZvg3maGhU5bn/MU/R2Ynw=;
 b=biNdtTZlj7YrKLnBd7cfSndb8WF/of67P7z5hNW7zPGC8Q2U2RaV3dASXtrrfLKlQJa8IuITiBKDDjAtXPB+5yyWkhkHpCGhKUswO4imr3RPy/TJLV53jfCoTWEX6aI41x92Y9cV9DG+NPnOkqWrRfZkOeQQaQB3wfAw41ByC6I=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>
Subject: RE: Re: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Re: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AQHb8Gb+1Qk//soDH0aTpVQu4kB81A==
Date: Wed, 9 Jul 2025 00:18:28 +0000
Message-ID: <BN0P110MB2148C8A93B5B55CDC35B3A9A9049A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <64ea50a0-67d6-4f95-a6fb-b56b3b657059@amd.com>
In-Reply-To: <64ea50a0-67d6-4f95-a6fb-b56b3b657059@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|SA1P110MB1503:EE_
x-ms-office365-filtering-correlation-id: 3271a0a2-61b1-409a-c287-08ddbe7e20e5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V2U3VXkzT3FNMjZZblBOb0FBd2V5a3Vwa3ZNVklhMUNLT1N5aTBnOG9SNW1z?=
 =?utf-8?B?VnNBQ0V4KzRMN2JaOWhuWjZDRGRSNUF1NUVZYzhjYWxmbE9BTTh2TWIwWmQw?=
 =?utf-8?B?MEcvNTJFN0pDd1B3dGpVRE5ONm5tUGZvZ3lwTEEvajlsM3pNNHZoN21KeG9V?=
 =?utf-8?B?OFppVXB3VjhYWmNLckVLODFZWC83U0pObEZoYU55TWN3ellWcjlzZEw3aURI?=
 =?utf-8?B?dFN1aExHRHprM1JGTDZpelJld2c3amRzdE5HMlIyVFpac3lTU3RYN1FVM25a?=
 =?utf-8?B?NmFWODE3VW9hRnpEdTRobG9YcnR3cy82d3JQWEwzTm1Gbm5vdU4xZTdTTmYv?=
 =?utf-8?B?Tm9rYkxFbEhOSndCY0VUajFKdjg2Z1JNWGV6VGNzY1lHMjVGZFRwTGtMdngz?=
 =?utf-8?B?Mlpja2ozNFNkOEdEeWFGb2dGYXVvbmdqd0xhWHpUM2JuRHZxOENZWStXd2h3?=
 =?utf-8?B?UlBYWjF1SVJ1S0NzUnNOZHgvYTJZL2VjYm5ZcGV0aExTRlFUeG1QNDNJWmly?=
 =?utf-8?B?bzlNWmswVkNTMGZGSUhhOXZhMlFrOVI0VnZWSmZtUFA1a1g0aEd3RXpjVDda?=
 =?utf-8?B?ZHdZT0dhYVNkS0w1VER2WEN2K1V0aWhxcGxqTzcrT2lrcXY0MGtiSVc5b0xN?=
 =?utf-8?B?dTdhdVJ1amZDenpNZG5FNXBLRW9ndWRYMEg2a2tpR2JEeWRwYnBCSEVTUmVw?=
 =?utf-8?B?RWNhY3JuK3AvOHhJYytQWi9YQWF0MjRRSWR3M1JWS1VOTzhkZnkweTROWVVN?=
 =?utf-8?B?YS9SYU5OSm1QU0lneE40eEhSc1hUQm41VWdtbEIrcllvVmVseTlaVngvbzZu?=
 =?utf-8?B?Y3lOVnZLWlZOWjRKcXJuKzRZRHBFKzlJd0lVM3Y4MEVZeEdZdWJrSlpXcEhZ?=
 =?utf-8?B?SU1NdFlwK2JtdnhxUnZadnlwOThiZG1pcTJaSkNHeXVhS1BmWjRPK2pqdnQr?=
 =?utf-8?B?LzFlWnZGSVVJTVZOaFlZdTFOSGtEM2hMb21oYW9uUFpSSkNnR1RFR1BzZGRx?=
 =?utf-8?B?SFp5cUVFbWR1amxiNUJaNjFaMGhsV3EvaDNaN241Yy91N3V5YU04RzJyT0pk?=
 =?utf-8?B?Mm4rcHh2c3Uzdll0VytEbkcxakZSRitTTlFJaVptVUJBWGMrUC93RW8ra2Yz?=
 =?utf-8?B?NnJ3NUtHbVRDN1B3SVZzNmhWZ2NJeThSL3Z3Y2ZxU1F3WjZqMVZUU3dzYVh2?=
 =?utf-8?B?bG1reFhvaFFDYmhiMVhiaDVkdWtSeHFqYjRRb1V1YzBlNkg2VlQ4QytFNmZO?=
 =?utf-8?B?UkJXRi9TN0E0Z3NDMXBycDNNOVIvMXFwTWxpOXorUVBodENFNmhGQWRLQ1kz?=
 =?utf-8?B?b3FVdUhjQ3VmUDIrT2RlaXQ1dHlGSmJjTDJISlZxY0VJaHBZOHdmZUtnZGhl?=
 =?utf-8?B?QllOTWlSK0lGZVZTbWZiUVpsZVdGT2VyN3RoNWZlVk14a3prTkJ1Rkx0T0xr?=
 =?utf-8?B?OHAwT095a2o0d0xrdURpZ1dOYlVQTVRVdlRLV3g1Mzhhb2hIZ0tSbEU1cGJM?=
 =?utf-8?B?a1dJNlpnRVN6TjRtcDFaUHhEYXhvVkw2akhva3ErSkFmYVVnUWM1eEF1Rm1H?=
 =?utf-8?B?Y2ZoMFpIZGo3SFZ5Ymh6NjdvcXBCd0NQdUdON3l4Nm5YQXN4SnpqSkhocDJu?=
 =?utf-8?B?cFMrQXZpL2JwWXNQSm5wM3p5dHBueTdleFRDcks3Yy9xYkJrQWhsV2V1OHlN?=
 =?utf-8?B?NFBWYUVudDdDM3pKQ1lSZXlRaTY5dHAzMERXMVRpVUJ4UjV2K1IyVmF5dUhF?=
 =?utf-8?B?UjVyNW5MeHV4Z0x5WEl5VXVaVkxXOTFnc291ZEJWMnBzdmMxM3BUSGNpVHhE?=
 =?utf-8?B?RTFpNnptTVVRUERPZFlNdFBCbCtsTlFlLzMzUkc2dWxCd09UdjRYYTdoelVv?=
 =?utf-8?B?WXdTMm1rZ3NIWUNIcmdWandZb0FRY09iMUo0RUNVbEdPVzZoNklrNjA4UUVh?=
 =?utf-8?B?eGZUWGRSdC9tN1FkcmRia2xOOWE5N2xPSCs1bm5tUmlEZ0NPSkF2T3JyUVIy?=
 =?utf-8?Q?4rGrnh2jYKHIYljHXYGg1Xjk1EI9e8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnpwVld5Lzd2TndnaWNQckRvNGowQm8wSE1EWlluaXJrbVpkZ0daOEtHZFA5?=
 =?utf-8?B?YnlVMVliMVNlNTgzY3pXZlZ4b291MHptZDgyazExV2RRaG1YUCtZVVU3OUU2?=
 =?utf-8?B?Yy96SEtXZzRTTVUvU0xRK081OC81QndUOXBpSzBMQVVJSVNPMGp4MGhXRXNy?=
 =?utf-8?B?aGVLaTdBbzJreG5rbVVLLzYrcWtDQlIrRXVJUnhFK0JJc0MxNUdVMldHbkR1?=
 =?utf-8?B?UjlsWTRnVTk3dzludWowYU9xN1VuWUNlaUxVNmZyWWplQkZLZFlzanI1U2s2?=
 =?utf-8?B?eTZKVjhrMEF4UEQ3NE5UQmNpcVE1M1F1RnRzYkNKVEsvTkpScW1QOEJUam1x?=
 =?utf-8?B?TUVVMHpOSU94MGsrQVo0UC9ERDZDZDgxS243TWtVaHRKTWtwQVRzZitlT0hS?=
 =?utf-8?B?RVo5RzhuYmNhM01raUhhV2pwdStZY1ZBOERyQm1VeWxtWFJRWkM0TUQrWWF5?=
 =?utf-8?B?NnU4d3d2T1dlaWl2UlBUY2xDdGZzNWRCbWIzdE5jNUhURVlRK1hXaVE0UzlQ?=
 =?utf-8?B?LytVOUxuaWVYTld3Wk1wMTdxMVgvcEhiNFNDOW05L1dVZzdxVVNNbElyVkNS?=
 =?utf-8?B?ZmZOQWJhTWFoY1BSczg3WnJrSnUyTUhPaHZwRTlKb05ucG54cC9JU1RUT1Mw?=
 =?utf-8?B?V0l0SUlZc1IwSDlSZ3dYbkFCRHhvR2JhWms0WFNONXRES3plbGR1ZVN0cThN?=
 =?utf-8?B?OUhCUnEvYkVSTlllbU1FdGUxZnEyS2xtV1pDcmgwZm1tajZUMllBZTZYWU8y?=
 =?utf-8?B?bnkzUVpwSEJtbXBEZHdwVkVVamE5bC9DVVVhT3ZZZGxCUUdmM1dFL2J3NXFp?=
 =?utf-8?B?V3BERitvRjBQZ09SdlRMU1Y1OUl0RGxMSFBtbkdtdWVXOTFTaXN5Z0JjLzAz?=
 =?utf-8?B?Z0NpTC8rdnZIaDdzU0xyUDFnWmhmenh6QnlxRW5HcFFWNE9RS0E3M1ZPOWxr?=
 =?utf-8?B?OC9LcTRKOU9TRGVJSWkwM3RiL1pGa2NORzRiL1dpaWl0S1VqUGJ5WWJJR04x?=
 =?utf-8?B?WWtWZWpRcjU3V1k2SzNFMis0UnkrMTdIVG1kTG1RSjQ3OC8zZ0JiUC9vcEhU?=
 =?utf-8?B?NnRDMDRKcUo3RDA3c3IrVkZDc1BKalYrVXlxUi9RUE9GWDZnRllSekN5YTRI?=
 =?utf-8?B?a0UyVUQwa3hSZTczSU01d2ZsLzd4YmtNVlN3SjRoM29nanUrVjhFb2VrVW9i?=
 =?utf-8?B?V0RjSEQ0NHB4MjFGdVg2V21ROEV0REFXSUlLQ3J4N2t0UTZDbkdPaENlY2k3?=
 =?utf-8?B?dGdycjQyMXpFc0Z1M1luWHh5TUs4YUVHUFovUnFGcEZ4K3lNN2owK3FDZVZx?=
 =?utf-8?B?V2dRVHJaN2JtL05KMHVwN2hHci9yVzZIZXYreWFjUzZxbkN4NW4zUVczZGRi?=
 =?utf-8?B?TVVOOUppVlhnTVZuTndDQnRTRDZUcjJUZWY5bUdib2dsbmFRcTF1QmFVN25u?=
 =?utf-8?B?UzE5dGJCc1JoRWtJRE4vNXJFeWRjRlFtdG9mcWthUnVSMk1mVkdlV1pzcXM5?=
 =?utf-8?B?MnlRdERWSjIwY2JUVDJYZjNmTUFLMHN1a2VBRWZyQVBSci9WTWx5Y0xWRndW?=
 =?utf-8?B?QVBFRndhSXA1Z0lYTCt2bTFvZmRLU0g4a0dLWjFSWHZjMExsK08xUGpCNXRx?=
 =?utf-8?B?SmRBQkgrT1luWlRTdjhFbkNySklzSVNtemxBSnhrTkljMllnMDN6Um9ObWdX?=
 =?utf-8?B?ajE0Nzl3bmgvaW9HaUlYRXFxMkJ4ejlGdlNEdVJoVlBWSFlBZ2s5L3lvRHV4?=
 =?utf-8?B?M1pNK0dYbHZrMVBWQ1NVdW1wanVNMG9FK1NuSCt0YkxwV05TUnB5QVNBVzA4?=
 =?utf-8?B?dXRNa3I1eEJIZ1pMWEd6K2o0NlVWeXhoSENOcVB4ZWdqc2J5RHNTZWhFQXFB?=
 =?utf-8?B?WDl3TkFjNzdXaUpROGNBdUdtS0RYZ0ViS2VhZW56NWJsUXJnalkvM0grMy9r?=
 =?utf-8?B?N0VGWE16bXNUeFk0MWE4TkxNb0JtTlNNVXl0cUZDT3EvWG9LSXpFNmRzdUYv?=
 =?utf-8?B?dU53T2pGazErVVFndk1TcWdRRzBjY09PejdsV3Z4SnpodVhkb2J6K3VRRUpi?=
 =?utf-8?Q?nuVuKY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3271a0a2-61b1-409a-c287-08ddbe7e20e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 00:18:28.3029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1503
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

U3Rld2FydCwNCg0KPiBPbiA2LzI1LzI1IDIzOjUwLCBDaG9pLCBBbmRlcnNvbiB3cm90ZToNCj4+
IFdlIGFyZSBvYnNlcnZpbmcgYSBzbGlnaHQgZGVsYXkgaW4gdGhlIHN0YXJ0IG9mIG1ham9yIGZy
YW1lIHdpdGggdGhlIGN1cnJlbnQNCj4gaW1wbGVtZW50YXRpb24gb2YgQVJJTkM2NTMgc2NoZWR1
bGVyLCB3aGljaCBicmVha3MgdGhlIGRldGVybWluaXNtIGluIHRoZQ0KPiBwZXJpb2RpYyBleGVj
dXRpb24gb2YgZG9tYWlucy4NCj4+IA0KPj4gVGhpcyBzZWVtcyB0byByZXN1bHQgZnJvbSB0aGUg
bG9naWMgd2hlcmUgdGhlIHZhcmlhYmxlDQo+PiAibmV4dF9tYWpvcl9mcmFtZSIgaXMgY2FsY3Vs
YXRlZCBiYXNlZCBvbiB0aGUgY3VycmVudCB0aW1lc3RhbXAgIm5vdyINCj4+IGF0IGE2NTNzY2hl
ZF9kb19zY2hlZHVsZSgpLg0KPj4gDQo+PiBzdGF0aWMgdm9pZCBjZl9jaGVjaw0KPj4gYTY1M3Nj
aGVkX2RvX3NjaGVkdWxlKA0KPj4gPHNuaXA+DQo+PiAgICAgZWxzZSBpZiAoIG5vdyA+PSBzY2hl
ZF9wcml2LT5uZXh0X21ham9yX2ZyYW1lICkNCj4+ICAgICB7DQo+PiAgICAgICAgIC8qIHRpbWUg
dG8gZW50ZXIgYSBuZXcgbWFqb3IgZnJhbWUNCj4+ICAgICAgICAgICogdGhlIGZpcnN0IHRpbWUg
dGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQsIHRoaXMgd2lsbCBiZSB0cnVlICovDQo+PiAgICAgICAg
IC8qIHN0YXJ0IHdpdGggdGhlIGZpcnN0IGRvbWFpbiBpbiB0aGUgc2NoZWR1bGUgKi8NCj4+ICAg
ICAgICAgc2NoZWRfcHJpdi0+c2NoZWRfaW5kZXggPSAwOw0KPj4gICAgICAgICBzY2hlZF9wcml2
LT5uZXh0X21ham9yX2ZyYW1lID0gbm93ICsgc2NoZWRfcHJpdi0+bWFqb3JfZnJhbWU7DQo+PiAg
ICAgICAgIHNjaGVkX3ByaXYtPm5leHRfc3dpdGNoX3RpbWUgPSBub3cgKyBzY2hlZF9wcml2LT5z
Y2hlZHVsZVswXS5ydW50aW1lOw0KPj4gICAgIH0NCj4+IFRoZXJlZm9yZSwgdGhlIGluaGVyZW50
IGRlbHRhIGJldHdlZW4gIm5vdyIgYW5kIHRoZSBwcmV2aW91cw0KPiAibmV4dF9tYWpvcl9mcmFt
ZSIgaXMgYWRkZWQgdG8gdGhlIG5leHQgc3RhcnQgb2YgbWFqb3IgZnJhbWUgcmVwcmVzZW50ZWQg
YnkNCj4gdGhlIHZhcmlhYmxlICJuZXh0X21ham9yX2ZyYW1lIi4NCj4+IA0KPj4gQW5kIEkgdGhp
bmsgdGhlIGlzc3VlIGNhbiBiZSBmaXhlZCB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdlIHRvIHVz
ZQ0KPj4gIm5leHRfbWFqb3JfZnJhbWUiIGFzIHRoZSBiYXNlIG9mIGNhbGN1bGF0aW9uLg0KPj4g
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jIGIveGVuL2NvbW1v
bi9zY2hlZC9hcmluYzY1My5jDQo+PiBpbmRleCA5MzAzNjFmYTVjLi4xNWFmZmFkM2EzIDEwMDY0
NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jDQo+PiArKysgYi94ZW4vY29t
bW9uL3NjaGVkL2FyaW5jNjUzLmMNCj4+IEBAIC01MzQsOCArNTM0LDExIEBAIGE2NTNzY2hlZF9k
b19zY2hlZHVsZSgNCj4+ICAgICAgICAgICAqIHRoZSBmaXJzdCB0aW1lIHRoaXMgZnVuY3Rpb24g
aXMgY2FsbGVkLCB0aGlzIHdpbGwgYmUgdHJ1ZSAqLw0KPj4gICAgICAgICAgLyogc3RhcnQgd2l0
aCB0aGUgZmlyc3QgZG9tYWluIGluIHRoZSBzY2hlZHVsZSAqLw0KPj4gICAgICAgICAgc2NoZWRf
cHJpdi0+c2NoZWRfaW5kZXggPSAwOw0KPj4gLSAgICAgICAgc2NoZWRfcHJpdi0+bmV4dF9tYWpv
cl9mcmFtZSA9IG5vdyArIHNjaGVkX3ByaXYtPm1ham9yX2ZyYW1lOw0KPj4gLSAgICAgICAgc2No
ZWRfcHJpdi0+bmV4dF9zd2l0Y2hfdGltZSA9IG5vdyArIHNjaGVkX3ByaXYtDQo+PiBzY2hlZHVs
ZVswXS5ydW50aW1lOyArICsgICAgICAgIGRvIHsgKyAgICAgICAgICAgDQo+PiBzY2hlZF9wcml2
LT5uZXh0X3N3aXRjaF90aW1lID0gc2NoZWRfcHJpdi0+bmV4dF9tYWpvcl9mcmFtZSArDQo+PiBz
Y2hlZF9wcml2LT5zY2hlZHVsZVswXS5ydW50aW1lOyArICAgICAgICAgICANCj4+IHNjaGVkX3By
aXYtPm5leHRfbWFqb3JfZnJhbWUgKz0gc2NoZWRfcHJpdi0+bWFqb3JfZnJhbWU7ICsgICAgICAg
IH0NCj4+IHdoaWxlICgobm93ID49IHNjaGVkX3ByaXYtPm5leHRfbWFqb3JfZnJhbWUpIHx8IChu
b3cgPj0gKw0KPj4gc2NoZWRfcHJpdi0+bmV4dF9zd2l0Y2hfdGltZSkpOw0KPj4gICAgICB9DQo+
PiAgICAgIEVsc2UNCj4+IENhbiBJIGdldCB5b3VyIGFkdmljZSBvbiB0aGlzIHN1YmplY3Q/DQo+
IA0KPiBUaGUgZHJpZnQgeW91J3JlIG9ic2VydmluZyBpcyBhIGtub3duIGlzc3VlIHdpdGggdGhl
IHNjaGVkdWxlci4gVGhlIG5leHQgbWFqb3INCj4gZnJhbWUgc2hvdWxkbid0IGJlIGNhbGN1bGF0
ZWQgd2l0aCB0aGUgIm5vdyIgdmFyaWFibGUuIEl0IHNob3VsZCByYXRoZXIgYmUNCj4gY2FsY3Vs
YXRlZCBieSBhZGRpbmcgdGhlIG1ham9yIGZyYW1lIHBlcmlvZC4gQWxzbywgYXMgeW91ciBjb2Rl
IHN1Z2dlc3RzLCBpdA0KPiBzaG91bGQgdGFrZSBpbnRvIGFjY291bnQgZWRnZSBjYXNlcyB3aGVy
ZSAibm93IiBtYXkgYmUgaW4gdGhlIGZhciBmdXR1cmUuDQo+IFRoZXJlIGlzIGFub3RoZXIgaW5z
dGFuY2Ugb2YgbmV4dF9tYWpvcl9mcmFtZSBiZWluZyBjYWxjdWxhdGVkIHVzaW5nICJub3ciDQo+
IGp1c3QgYWJvdmUuIEFyZSB5b3Ugd2lsbGluZyB0byBzdWJtaXQgYSBwYXRjaD8NCg0KSSBhcHBy
ZWNpYXRlIHlvdXIgZmVlZGJhY2sgb24gdGhpcyBzdWJqZWN0LiBIZXJlJ3MgdGhlIGxpbmsgdG8g
dGhlIHBhdGNoIEkgaGF2ZSBzdWJtaXR0ZWQuDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjZmNGZiNDA5ZjAzY2IyMjFhOTg2OTJjNGYyOTE3
NTZkOWNjMjZhZS4xNzUxOTQ4MzQyLmdpdC5hbmRlcnNvbi5jaG9pQGJvZWluZy5jb20vDQoNCkNv
dWxkIHlvdSByZXZpZXcgdGhlIHBhdGNoPw0KDQpUaGFua3MsDQpBbmRlcnNvbg0KDQoNCg==

