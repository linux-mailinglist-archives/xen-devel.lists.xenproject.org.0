Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4335EF4F6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413713.657535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsL8-0006jB-37; Thu, 29 Sep 2022 12:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413713.657535; Thu, 29 Sep 2022 12:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsL7-0006gB-VZ; Thu, 29 Sep 2022 12:08:29 +0000
Received: by outflank-mailman (input) for mailman id 413713;
 Thu, 29 Sep 2022 12:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8rd=2A=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1odsL6-0006g5-2v
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:08:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 684743eb-3fef-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 14:08:20 +0200 (CEST)
Received: from AM6PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::35)
 by AS2PR08MB9426.eurprd08.prod.outlook.com (2603:10a6:20b:5ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 12:08:16 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::e8) by AM6PR10CA0022.outlook.office365.com
 (2603:10a6:209:89::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 12:08:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 12:08:16 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Thu, 29 Sep 2022 12:08:16 +0000
Received: from 0e942f836745.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04ED3472-6FFE-4F9D-B03C-6A98DB09931B.1; 
 Thu, 29 Sep 2022 12:08:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e942f836745.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 12:08:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8277.eurprd08.prod.outlook.com (2603:10a6:10:40f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 12:08:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 12:08:01 +0000
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
X-Inumbo-ID: 684743eb-3fef-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KsRYhraHtBLQWR+tc7+CGVxQttQnjlHd228DMD+EXLoNFatvEZdTp6XU5NilEq+JnIcNZJAV6gDYW+0DtbuCQXEMW+njNc6z9JZ+pPjKYYiSmqSm8jek/A80Ze1mXXHElofQAWP5wwCn7MW4/Gvei9+77QFjygdYTj2yJZZIa3B2T296okSubylEA3noFCPgPMr72PBx7+gvtAU3imhqOEcRnRRHObiP5BezU0YmLA0WRL+uzDecsX0VXffstkuAQDzuIQGWxDZqAzy6MNRNPy23gYSbFEHz1/OOPt6Izya98Rc9RFPi6NKaGoku4rilw55ohKaANeyKw5b9oJ0GdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNYnYCt5wgmdmTpjs8A09erpqq+3ycDz7WjGP6Qvkyc=;
 b=TSesAkwLL8y6RGexku4G3pRVcIWcM/igMOx9BIVBieFckspn/CqUlYlSwTqOh2EwgDc+BpnmVvc5H5pROXBNUeYlETknrm+rSTmn18JRbL1Rv8xiL5lKibKaIU0Hn5y0Hfv0QbpHymjRGtQzuc4jdmerV75mbCA3g0Na35lvo5VqyacK8TKGFCryI7EhptXvFJcE2q0cT0eGrSFZsvcTYBBz/NWPZZlMoUrcdz9YCGur6aR70chMl8d28Djcn6H7WTGs2L7er3NYEYypVBTp7cSWOsVKwFYw9misd4FX4Q3fNH9xhVAwahOOzIoZeYk9mW7n3U+7T5ioAfQCTG/8sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNYnYCt5wgmdmTpjs8A09erpqq+3ycDz7WjGP6Qvkyc=;
 b=RnAvmnxMRypWOQM0BoE16au/MF7ybgji+5zmTsmi/Kn6B6bUBHxwrdmEeqtvBfzG/NSxDZQn+x+RYC+n/wpZD04+KCCih3Qr8prw6yTR2whaOLLiZ3wGDN3QihPkaI58rHBxagE4PuE3l3ESlpPjM2UiXH01rKjnx9rXnj6Dh10=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a777a96faeb21193
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IefyNYxyP218Q+Mp7WaJ8Q2eRZIaGvnprB2PFntuGDnk6jC5uD8rkVA3hfiNVgTMQh9moXr9eneei3V8OauB95SClpTM+o28BVZZwSFO1iUY9vJYjZcBFrmGnqdqbesC1U27B7928I/mtDzLC5jwNWqzambz45BV6bauFelSEIUEXuxYxALV7PG0mKVXe+zc4tjmQr8G9X+vwbezeOQn6vIymJu+YTIQN+bf0nDJZU9TBnWHxgM/zRjdKrLRgYQOp4a44U/69Ik/maryHc+FB9lfXfG/8+WxM2eD6fiWk+40zAIJ+88aLp+iBSEy/1vbomzqhtyoQ8RadgzSSaTYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNYnYCt5wgmdmTpjs8A09erpqq+3ycDz7WjGP6Qvkyc=;
 b=LmhbobdKD+L19OvKHH8rmMK2yvJapAr99678BImqR5lBHhyIzezJqP+1gZWUXLrpIIrRtB8wkXsdm+DYmW6ti0rE/1+61Rkrs3+8Fvvjxp24vsHcZXDmXHAqQIAHDdbwK2ADgOhqChJupr3gYkeJRWk1S9rL9Z3uyrh+PMBBrOpWLu17MhZV+4gEnwr3nFhrYKtyCUGKEB+MBFT8bY4Kw7gUZz9FN/zD1iiiRiQx3ys9FipIyKNWW88+c7o79PEgWTjz6OLcSc7qdID0Iv2hJL0a0Cipbjmg9lRfCFZj/t++512OThtX1kpMM3+vekDLWzidGTxpI2fAdyvcD4A6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNYnYCt5wgmdmTpjs8A09erpqq+3ycDz7WjGP6Qvkyc=;
 b=RnAvmnxMRypWOQM0BoE16au/MF7ybgji+5zmTsmi/Kn6B6bUBHxwrdmEeqtvBfzG/NSxDZQn+x+RYC+n/wpZD04+KCCih3Qr8prw6yTR2whaOLLiZ3wGDN3QihPkaI58rHBxagE4PuE3l3ESlpPjM2UiXH01rKjnx9rXnj6Dh10=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/ept: limit calls to memory_type_changed()
Thread-Topic: [PATCH v3 2/2] x86/ept: limit calls to memory_type_changed()
Thread-Index: AQHY00RZ62t9oHqr90W0wJ20vCS6F632MZIAgAAgIIA=
Date: Thu, 29 Sep 2022 12:08:01 +0000
Message-ID: <7764D305-5415-4AAE-9B36-5E123A5FA5E1@arm.com>
References: <20220928141117.51351-1-roger.pau@citrix.com>
 <20220928141117.51351-3-roger.pau@citrix.com>
 <576b8ac4-7ebe-e8eb-2fb8-2cb7f592d585@suse.com>
In-Reply-To: <576b8ac4-7ebe-e8eb-2fb8-2cb7f592d585@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8277:EE_|AM7EUR03FT043:EE_|AS2PR08MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: de457755-5f36-4083-5e6d-08daa2134a94
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f5sFy2aAwyKaBmDOGXvP28VSgY02p3VfYtfsyWBAmJi3qGpygat1SLb6jNlKc2x3SfOX8YJchMHAOCWNQwW8afFzC83g5STjP/N2BB7mQItzBh0Voq9gqTKL64GGf0OIZLmN+27YaI/RBcX13M34PZQ00e5KWVffd+7r4+VYbiBYlpXPtPyMlNO8+UJqMbTJEkxCMflKD20ZPS7+q8fO4/DKsW5RoPak00OqccEge4EUQwolOI7zc5VdNptxB89BN6BI5LXxO7d0zFwj9XrFUZHgcvU9P4bhc7RwHB9HpzKtpuWPJ0OR7kdJwpS5yWniQXY28C0kxiAB07jiJc0Vj6sICcBPoekiavp77CAoZr31ujwHcOTKFlFjllIuipOk9djXSQ0RfO+oVV4eUf9cZkXvi7x5bnS2UtWRAsZSYPG61LlkTd9/b0OSv0Zfh8vu1b9MCA3KthQZxO7DScFxNuHshXA/6+eej3oQf76kF1jwrCdgZgtJH8Zu5mAmms3xDNqvmTVYIMuYL7cIjgQadzf/s/NonswMAA6bUFhusJORJWDGlAyDj0QXit3NOJ/buvSr3kjguFxjwqEWVsBb0SJPdf1TNFHMudhjPIYyBkOqn5UEVuqZ4iRPwUHfv5BLnxiru8eclG0Uq8D0xcjQP7bmhDxXAFfK5frKsZPataz/+/2FzD/W5fhjTpJ7nQb+hnLBUZ84qycL7uPUy1aYX33rKAQoQN2bRbteCIIllEWZCgRHItka0ZW7fJFaLPKomClIE8AuAPQFoFG+82T06jNgLIVFHa3HDSvtURZz4xc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(53546011)(71200400001)(2906002)(66446008)(6486002)(6506007)(54906003)(36756003)(83380400001)(478600001)(38070700005)(38100700002)(33656002)(316002)(122000001)(66946007)(8676002)(76116006)(64756008)(4326008)(66556008)(41300700001)(86362001)(91956017)(8936002)(7416002)(6916009)(5660300002)(2616005)(186003)(66476007)(6512007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9DABA3D70F91647BD2292BFE68283C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8277
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3248398a-07f5-4743-c502-08daa213416e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zc3lYZAopX/wmbCh9RR1qjtNJfuDZEhxNAj/j3aOFHlOaSu6I2i7MKi6ZDQJvry2xzwK9gbmvrJ/Iu4PMOsM1GL1DkyD9GSVDaiYtz9CEHMdHFQFi/O7tgMlJbxkE+yb7oESl9kqdbsZ4g1ki+iEIvB+opadqpr5KeB8Z4BOzACTMqo6bZ5SAoNGfm+yQUImbj6Y7fCTOhNNpR9kej4lfYHdBzELiiFj7YMS1IxYUGrzVUikk24VcCT0tNkD5+qEZItgRgGaa9BJx47QJHttnWX4fuQ6tlEDU9csOICqsi0gIYgZBkOFHQK4u03Y9B4WDCfTL0e1KwxAywKkIl3BXrpOMbZreTpPMueRSuy7U3wOTux9YQvp30Wh5MCQnZnWqEDVNCw5cUY2grP9NfaprMOr31K75wVpi77JfYY5rSGQ1WVn7EBjdIXlJ+jR6UCAc7QbetQ8s2idzhC1ENbLDDF6MbX+IA+5PV7qhIgW18GRxdOy0kPbYW7uTYzForwAwZZvM5eKcpuRmJMSAbx5X9ifZiVxKNZNAfoNAXWXOC9mZ6nvrzHZmEUp2advtBYGYBjAUKPt1sffiuxRutkgnHLd/UEqsM10ybe+FsGLWdrb2Lw8Aprc8VtMoeFNm5o5GkFp1EceXq4kgrVzAXb0hfGPPqDJrFW0PvvVmdSmheg2ZdUeZN/0xqHUQxZhzP9/Lxwg8+khTH1aSIgFVQmj9geHhv+NLYt5QPWTQhu+7HQPkH7JfUDkx8U14elqTkw7UxM7Sc9vDEOgW/MdUAFBag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(316002)(6486002)(54906003)(70206006)(70586007)(6862004)(5660300002)(8936002)(53546011)(8676002)(4326008)(6506007)(478600001)(41300700001)(6512007)(336012)(82740400003)(81166007)(356005)(47076005)(82310400005)(26005)(83380400001)(2616005)(2906002)(186003)(36756003)(33656002)(40480700001)(86362001)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:08:16.5193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de457755-5f36-4083-5e6d-08daa2134a94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9426

SGkgSGFuLA0KDQo+IE9uIDI5IFNlcCAyMDIyLCBhdCAxMjoxMywgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI4LjA5LjIwMjIgMTY6MTEsIFJvZ2VyIFBh
dSBNb25uZSB3cm90ZToNCj4+IG1lbW9yeV90eXBlX2NoYW5nZWQoKSBpcyBjdXJyZW50bHkgb25s
eSBpbXBsZW1lbnRlZCBmb3IgSW50ZWwgRVBULCBhbmQNCj4+IHJlc3VsdHMgaW4gdGhlIGludmFs
aWRhdGlvbiBvZiBFTVQgYXR0cmlidXRlcyBvbiBhbGwgdGhlIGVudHJpZXMgaW4NCj4+IHRoZSBF
UFQgcGFnZSB0YWJsZXMuICBTdWNoIGludmFsaWRhdGlvbiBjYXVzZXMgRVBUX01JU0NPTkZJRyB2
bWV4aXRzDQo+PiB3aGVuIHRoZSBndWVzdCB0cmllcyB0byBhY2Nlc3MgYW55IGdmbnMgZm9yIHRo
ZSBmaXJzdCB0aW1lLCB3aGljaA0KPj4gcmVzdWx0cyBpbiB0aGUgcmVjYWxjdWxhdGlvbiBvZiB0
aGUgRU1UIGZvciB0aGUgYWNjZXNzZWQgcGFnZS4gIFRoZQ0KPj4gdm1leGl0IGFuZCB0aGUgcmVj
YWxjdWxhdGlvbnMgYXJlIGV4cGVuc2l2ZSwgYW5kIGFzIHN1Y2ggc2hvdWxkIGJlDQo+PiBhdm9p
ZGVkIHdoZW4gcG9zc2libGUuDQo+PiANCj4+IFJlbW92ZSB0aGUgY2FsbCB0byBtZW1vcnlfdHlw
ZV9jaGFuZ2VkKCkgZnJvbQ0KPj4gWEVOX0RPTUNUTF9tZW1vcnlfbWFwcGluZzogdGhlcmUgYXJl
IG5vIG1vZGlmaWNhdGlvbnMgb2YgdGhlDQo+PiBpb21lbV9jYXBzIHJhbmdlcyBhbnltb3JlIHRo
YXQgY291bGQgYWx0ZXIgdGhlIHJldHVybiBvZg0KPj4gY2FjaGVfZmx1c2hfcGVybWl0dGVkKCkg
ZnJvbSB0aGF0IGRvbWN0bC4NCj4+IA0KPj4gRW5jYXBzdWxhdGUgY2FsbHMgdG8gbWVtb3J5X3R5
cGVfY2hhbmdlZCgpIHJlc3VsdGluZyBmcm9tIGNoYW5nZXMgdG8NCj4+IHRoZSBkb21haW4gaW9t
ZW1fY2FwcyBvciBpb3BvcnRfY2FwcyByYW5nZXMgaW4gdGhlIGhlbHBlcnMgdGhlbXNlbHZlcw0K
Pj4gKGlve3BvcnRzLG1lbX1fe3Blcm1pdCxkZW55fV9hY2Nlc3MoKSksIGFuZCBhZGQgYSBub3Rl
IGluDQo+PiBlcHRlX2dldF9lbnRyeV9lbXQoKSB0byByZW1pbmQgdGhhdCBjaGFuZ2VzIHRvIHRo
ZSBsb2dpYyB0aGVyZSBsaWtlbHkNCj4+IG5lZWQgdG8gYmUgcHJvcGFnYWVkIHRvIHRoZSBJTyBj
YXBhYmlsaXRpZXMgaGVscGVycy4NCj4+IA0KPj4gTm90ZSBjaGFuZ2VzIHRvIHRoZSBJTyBwb3J0
cyBvciBtZW1vcnkgcmFuZ2VzIGFyZSBub3QgdmVyeSBjb21tb24NCj4+IGR1cmluZyBndWVzdCBy
dW50aW1lLCBidXQgQ2l0cml4IEh5cGVydmlzb3IgaGFzIGFuIHVzZSBjYXNlIGZvciB0aGVtDQo+
PiByZWxhdGVkIHRvIGRldmljZSBwYXNzdGhyb3VnaC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KPiBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiB3aXRoIG9uZSBtaW5vciByZW1h
cmsgYXQgdGhlIGVuZCwgd2hpY2ggY2FuIGJlIHRha2VuIGNhcmUgb2Ygd2hpbGUgY29tbWl0dGlu
Zy4NCj4gDQo+PiAtLS0NCj4+IENoYW5nZXMgc2luY2UgdjI6DQo+PiAtIFNwbGl0IHRoZSBBcm0g
c2lkZSBjaGFuZ2VzIGludG8gYSBwcmUtcGF0Y2guDQo+IA0KPiBEZXNwaXRlIHRoaXMgSSdkIHBy
ZWZlciB0byBoYXZlIGFuIEFybSBtYWludGFpbmVyIHZpZXcgb24gdGhpcyBhcyB3ZWxsLiBBcw0K
PiBwcmV2aW91c2x5IHBvaW50ZWQgb3V0IHRoZSByZXN1bHRpbmcgY29kZSBpcyBnb2luZyB0byBi
ZSBzdWItb3B0aW1hbCB0aGVyZS4NCg0KT24gYXJtIG5vbmUgb2YgdGhvc2Ugd2lsbCBiZSBjYWxs
ZWQgYXQgcnVudGltZSwgaXQgaGFwcGVucyBvbmx5IGR1cmluZyBndWVzdCBjcmVhdGlvbg0Kc28g
dGhlIHBvdGVudGlhbCBwZXJmb3JtYW5jZSBpbXBhY3QgaXMgdmVyeSByZWR1Y2UuDQoNCkNoZWVy
cw0KQmVydHJhbmQNCg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb2NhcC5oDQo+PiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vaW9jYXAuaA0KPj4gQEAgLTcsMTMgKzcsNDMgQEANCj4+ICNp
Zm5kZWYgX19YRU5fSU9DQVBfSF9fDQo+PiAjZGVmaW5lIF9fWEVOX0lPQ0FQX0hfXw0KPj4gDQo+
PiArI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPj4gI2luY2x1ZGUgPHhlbi9yYW5nZXNldC5oPg0K
Pj4gI2luY2x1ZGUgPGFzbS9pb2NhcC5oPg0KPj4gKyNpbmNsdWRlIDxhc20vcDJtLmg+DQo+PiAr
DQo+PiArc3RhdGljIGlubGluZSBpbnQgaW9tZW1fcGVybWl0X2FjY2VzcyhzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBsb25nIHMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGUpDQo+PiArew0KPj4gKyAgICBib29sIGZsdXNoID0gY2Fj
aGVfZmx1c2hfcGVybWl0dGVkKGQpOw0KPj4gKyAgICBpbnQgcmV0ID0gcmFuZ2VzZXRfYWRkX3Jh
bmdlKGQtPmlvbWVtX2NhcHMsIHMsIGUpOw0KPj4gKw0KPj4gKyAgICBpZiAoICFyZXQgJiYgIWlz
X2lvbW11X2VuYWJsZWQoZCkgJiYgIWZsdXNoICkNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAg
ICAgKiBPbmx5IGZsdXNoIGlmIHRoZSByYW5nZShzKSBhcmUgZW1wdHkgYmVmb3JlIHRoaXMgYWRk
aXRpb24gYW5kDQo+PiArICAgICAgICAgKiBJT01NVSBpcyBub3QgZW5hYmxlZCBmb3IgdGhlIGRv
bWFpbiwgb3RoZXJ3aXNlIGl0IG1ha2VzIG5vDQo+PiArICAgICAgICAgKiBkaWZmZXJlbmNlIGZv
ciBlZmZlY3RpdmUgY2FjaGUgYXR0cmlidXRlIGNhbGN1bGF0aW9uIHB1cnBvc2VzLg0KPj4gKyAg
ICAgICAgICovDQo+PiArICAgICAgICBtZW1vcnlfdHlwZV9jaGFuZ2VkKGQpOw0KPj4gKw0KPj4g
KyAgICByZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICtzdGF0aWMgaW5saW5lIGludCBpb21lbV9kZW55
X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIHMsDQo+IA0KPiBBIGJsYW5r
IGxpbmUgd291bGQgYmUgbmljZSBiZXR3ZWVuIHRoZXNlIHR3byAoYW5kIHNpbWlsYXJseSBmb3Ig
dGhlDQo+IHg4Ni1vbmx5IHBhaXIpLiBPbWl0dGluZyBzdWNoIGJsYW5rIGxpbmVzIGlzIGltbyBh
ZHZpc2FibGUgb25seSBmb3INCj4gdHJpdmlhbCBpbmxpbmUgZnVuY3Rpb25zLg0KPiANCj4gSmFu
DQoNCg==

