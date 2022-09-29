Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1665EF402
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413633.657403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrRh-0002qt-Jh; Thu, 29 Sep 2022 11:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413633.657403; Thu, 29 Sep 2022 11:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrRh-0002oI-G0; Thu, 29 Sep 2022 11:11:13 +0000
Received: by outflank-mailman (input) for mailman id 413633;
 Thu, 29 Sep 2022 11:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yp8n=2A=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1odrRg-0002oC-1W
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:11:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bb75825-3fe7-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 13:11:09 +0200 (CEST)
Received: from AM5PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:203:51::22) by AM8PR08MB5604.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:10:57 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::1a) by AM5PR0701CA0012.outlook.office365.com
 (2603:10a6:203:51::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 11:10:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 11:10:56 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Thu, 29 Sep 2022 11:10:56 +0000
Received: from 6e54db4d7f2c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F27D4E1-332D-4281-8DE4-8EAB79B7897F.1; 
 Thu, 29 Sep 2022 11:10:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6e54db4d7f2c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 11:10:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9805.eurprd08.prod.outlook.com (2603:10a6:102:2e6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 11:10:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%4]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 11:10:44 +0000
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
X-Inumbo-ID: 6bb75825-3fe7-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PDH00GmQZvLXQEyJSdALQMOgOgmJXUOQKl2f3fj19rCw7y2jAQvEdvdPVqU9uq26CDWuVtZzFCNVwJRsJ5vl2ljyCMpCfVvzJW6jjwaZNP9B1vxFnGr8kqbmlr3eW3zumfubydBKICOAdAqxJFHRD0Ee+LOahfo/BbJoYuAwmRV5cWqiFXg9lTwyzsaZ407NXneUl/b3obkvJTccCWkVM4aQF7sv3DA1vGjBoj90vWGEOWw51+bhvksTN9oZW+RHbfQQGQp3/R+E79g3D4DpA7AlsAnoJqJVSSAV4hIuX7+U/mtRYjSO+/7p0zObk4mNqWw8D0y4SoziJpeDrDMbQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmblhuZKYvHL5h1slSavwTVzyTtCnxNQQDsr42mAx8g=;
 b=YQn4N3IYwsD5I/E6yHM+oYRaEcmU1+WudPrG+4UpbJtvYM/vP+3bQQUOyEOYbzGIKkEc7pBzS8Vs2iMM4KV0lnNkLy8ZznjIO1KCZCV+UT+WLLUZ24i29AYJdErKhA5Xtv6GqyNeac/QsfIr0lT0ebUGL6LlHA0H8dosxCJ5ckqFOuVRHedPQHGjnC6gQ9XiY3AYu1QU6HQE1WfwWJPzSNwTlJpK8DEkVgxeN9O3+M/42atIdJ1iK5wypDrQQVhinIbJCXM5wJNwPA4RwzZvY+SiXfZwfUV6K2CwL59B4IfU4VS2xRGvc9YRvUvbXtNiInyYuC6Tm2k1hcJQ7bT8ZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmblhuZKYvHL5h1slSavwTVzyTtCnxNQQDsr42mAx8g=;
 b=q1ntSiyUPT9xCEWOhat9k8Vc45Mqt7oKLbSo7DTIkqrxf1NVbVeisoxIkdo5pwIrfI4XIPi6cluEBD7FG+MKPTMIGSd9mzg1Lm7VCKQNzGrGjht/B3K3sOeXwIsIRoEbwrUw9gXTcEXvF8YYFo/YiFIy6/n4TBQbVeKIm/ZAO3A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWO+FA7NbxjLP9w32xIf4oCKUzAncf8H/Ujr4G89WsCLbb/ZP5U7A1/P+wO+o+m4Jr+s0jetIuU6HNiPK2pLV2pPoZV5FfTONlf5pQAelvW47dqP4fkQAHr5cgLTo8spN0sQTlL9CaoGaW/+Hhn46dYldQ/WXYDkWqVhwKJegxVFlVR8y0CifYYf9wvgGklXkCU+qIWJRAUkCg32Sr9NkcZyJufW4SrtmifzO3ZYZ07dWZaEtrlSWpq/PNqam0xjTDpdFL6yrsml0h7dszAgbGVNXnHepCAqQrH+uWRE6ivL8M9T03T9b4xQrwOIgzLHlGDU/Tf+bcv6pTiZnF4d2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmblhuZKYvHL5h1slSavwTVzyTtCnxNQQDsr42mAx8g=;
 b=jiz+SDAZb0VyevDQJbiFaxTYgjNKoUvPmfilmRt0IMd66C+MH+vR24i8w5cgO+24Y1+DQqVHcQ75jmRsDrTxNB4hHQf9dUnnnuz40sDOW54wPPcyHOdBWkHFFE0ZPWLyP74FQRN8vOPs8sU2DOxJRXFrh/OB0XtMB7xE9YrcHgBfSq5E5tBlxKXujV1Z44JxTdvhJXv9KQ2NF/W2KnNtWlWL88j62qtX8UO7TwhSYMIF4uHzZMQovBHlBYqzbAQg25mduNqGPZKXsAG8yclwWuEcAnEcEKohhvfiJH/b7waCSrX+ov8+g1S3j23HMvlu6cJMJLch2Jtj0fOsMKMyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmblhuZKYvHL5h1slSavwTVzyTtCnxNQQDsr42mAx8g=;
 b=q1ntSiyUPT9xCEWOhat9k8Vc45Mqt7oKLbSo7DTIkqrxf1NVbVeisoxIkdo5pwIrfI4XIPi6cluEBD7FG+MKPTMIGSd9mzg1Lm7VCKQNzGrGjht/B3K3sOeXwIsIRoEbwrUw9gXTcEXvF8YYFo/YiFIy6/n4TBQbVeKIm/ZAO3A=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: For 4.17 (was: Re: [PATCH v3 0/2] Move calls to
 memory_type_changed())
Thread-Topic: For 4.17 (was: Re: [PATCH v3 0/2] Move calls to
 memory_type_changed())
Thread-Index: AQHY0/KB5XPe3+0pEU6tJMlnQ9n+0632PsWw
Date: Thu, 29 Sep 2022 11:10:44 +0000
Message-ID:
 <AS8PR08MB799136198FFB5CF1F1B71A9392579@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220928141117.51351-1-roger.pau@citrix.com>
 <d7a14258-713b-6fc6-5da5-ce4fd56202c3@suse.com>
 <YzV6UNneG0jOrvQJ@MacBook-Air-de-Roger.local>
In-Reply-To: <YzV6UNneG0jOrvQJ@MacBook-Air-de-Roger.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BF2EDA4F0ED47141AA97CD42FF157982.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9805:EE_|AM7EUR03FT019:EE_|AM8PR08MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 9399d22f-3c36-4982-bf1a-08daa20b4868
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IAVXN5eQaULaR2aJTX1UVRRqXTCi8Pxa8hs9YQNEP2fazC1jqs0sQnxM5ZbNEu6CHqiiuVwc9SVeVYQnPvl6maY4RueP9V8XicbtPZ/uQ24qZt6v14LNiTY2gWpm/T4azIKeehSGdskJbeiFxCMoj74VzGvOnT6zU/aXBaV4A+KhpQqC3bstpiaCjZWLFMJ+jV+yeOBMbgzjKWBK1aA7ZywNZpowUveJC708uHch1vCTaW5Mcao4IXbzZRDJ9e7pXpMp5XcbXoc+J2I+6NvcSM9arPlrpdvlbpzdImhVj4wTM0MhOeWWRlgaC87vXrMYnRhqq8bAhyWcZylSzBo79LrinKDkIOWZd7/5pxUSPpJF/52efUS9eYCoD8RL+dWRGV2UTStdDiypF3ZfJ3Aq/XBDFbHGGl88lMyguU6OY0h30BUn1kE/DcQfajT3+zxJwvXFV6a+7itJPbvEHp80Ku5XclW2QWL2gHh0YCRE2bh/uantlIoVdWr+oHvOI01v2Vsfr9YJZ2ESSd2p3QJdmKbfah+9PLAQ+aQef+gLniyECpPNV8+hNGAnaf5RrBFNWE+3CGxDIp++a/DYNSiQse/okRBpLaUgZ1z6RyuWH9JV8kvHMpdOTByfygY5Ar8AbieLitbbT1E0hFRaShJ1oMnRmFK0w7ynOnLeWneHww8lZuu3PDj6hNqJEcivEPSqBShtMzIGPeNI61xlqLioT/SEUmmkqFKkxQXuLENEoRplZDjno6l/S1QzeL23mg3okjPOfu6gwhLAVLwbcvB01w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(41300700001)(55016003)(7696005)(53546011)(6506007)(26005)(9686003)(478600001)(54906003)(71200400001)(110136005)(316002)(8676002)(86362001)(83380400001)(38100700002)(33656002)(2906002)(186003)(76116006)(66946007)(4326008)(38070700005)(52536014)(122000001)(66556008)(7416002)(66476007)(64756008)(5660300002)(66446008)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9805
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22cb03c3-8a0f-4b08-0b47-08daa20b40d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6XkAB7qP1tVi2DO1YFe5Oe5syoz5cVxSPoTr18tnwmxN0LqN5fq8mqio88yrOwhTYQJSThnl0f2ip2bpiL27RuFQLTwgiBmAtTI9FpQu0h5RqPYojwM6fAKBnCN2dSHanSb3IsRCqdf2Y8b5Rat8XOq6OKyL6ey/iCZvexfNLTSEplZUkfXYOQGap8R4djxxqSvztuxGYaKha8vQWwSaJC/oqENaT6X5RV0oj3/rnxhj4LAdz1zET6ZenNJadBBpO/XcfLGp4AWKE+WSDFWBiAx6Lbm30BQikOiiCXwrlsYTkjlKVgOWuDhenxFpcr7IinGKUCFhSR5w7JUxe9pVfzf4HqzcmuLAX731zCCGg2mmKZWgPbRleeQ+xb8xaS7HoajMFUViSWG3jkx1LdJy9Z/wRgy1VhH5RKP8W9V8GkGlZC48X7vgITOtVwUNgYCRnV5HwZQTPFVZBCXUXrCT2+E6hP8FD4rsd5nhtWHlpAWuYWuqinmvvKO2HxBQAy4/AGWiQoEXe/YlbZ12PFiGyKp45ioGxW1NS3ovxFrt+YUPx1iHVEU9zaF0lba1XdcCgxEtDGwi8fFFxymGX4QRzBAts/qsNn1GsemCPEpcmbf32jnLzMKYJf4rGUwgUH5H7hnA6BFYwhpfmUmdBggKeqSCNJKlHZjsKgIcgDfXWBDrJ5vtOwhSl9DBojUUmFgdHu+5IzuXBJ3w4fnXIdu2dlkPqu6W8f0oONC9AXgYgm/xrL/wCxIG7dmzyH8MnrwUcKGqBMV8jMV8YM08JLVYJw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(4326008)(33656002)(86362001)(316002)(40480700001)(81166007)(356005)(55016003)(40460700003)(47076005)(82740400003)(8676002)(110136005)(54906003)(70206006)(70586007)(478600001)(52536014)(41300700001)(2906002)(5660300002)(83380400001)(336012)(8936002)(186003)(82310400005)(9686003)(6506007)(26005)(7696005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:10:56.8885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9399d22f-3c36-4982-bf1a-08daa20b4868
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5604

SGkgUm9nZXIgYW5kIEphbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogRm9y
IDQuMTcgKHdhczogUmU6IFtQQVRDSCB2MyAwLzJdIE1vdmUgY2FsbHMgdG8NCj4gbWVtb3J5X3R5
cGVfY2hhbmdlZCgpKQ0KPiANCj4gT24gVGh1LCBTZXAgMjksIDIwMjIgYXQgMTI6MTQ6MTBQTSAr
MDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gT24gMjguMDkuMjAyMiAxNjoxMSwgUm9nZXIg
UGF1IE1vbm5lIHdyb3RlOg0KPiA+ID4gVGhlIGN1cnJlbnQgY2FsbHMgdG8gbWVtb3J5X3R5cGVf
Y2hhbmdlZCgpIGFyZSB3aWRlciB0aGFuIHN0cmljdGx5DQo+ID4gPiBuZWNlc3NhcnkuICBNb3Zl
IHRoZW0gaW5zaWRlIHRoZSBpb2NhcCBoYW5kbGVycyBhbmQgYWxzbyBsaW1pdCB0byBvbmx5DQo+
ID4gPiBpc3N1ZSB0aGVtIHdoZW4gcmVxdWlyZWQuDQo+ID4gPg0KPiA+ID4gSSB3b3VsZCByZWFs
bHkgbGlrZSB0byBnZXQgc29tZSBmZWVkYmFjayBvbiB0aGUgQXJtIGNoYW5nZSwgc2luY2UgdGhp
cw0KPiA+ID4gaXMgbm93IGEgcHJlcmVxIGZvciB0aGUgYWN0dWFsIGZpeC4NCj4gPiA+DQo+ID4g
PiBUaGFua3MsIFJvZ2VyLg0KPiA+ID4NCj4gPiA+IFJvZ2VyIFBhdSBNb25uZSAoMik6DQo+ID4g
PiAgIGFybS92Z2ljOiBkcm9wIGNvbnN0IGF0dHJpYnV0ZSBmcm9tIGdpY19pb21lbV9kZW55X2Fj
Y2VzcygpDQo+ID4gPiAgIHg4Ni9lcHQ6IGxpbWl0IGNhbGxzIHRvIG1lbW9yeV90eXBlX2NoYW5n
ZWQoKQ0KPiA+DQo+ID4gQXJlIHRoZXJlIGludGVudGlvbnMgZm9yIGhhdmluZyB0aGVzZSBvbiA0
LjE3Pw0KPiANCj4gSSB3YXNuJ3Qgc3VyZS4gIEZyb20gWGVuU2VydmVyIFBvViBpdCdzIGNlcnRh
aW5seSBhIGJ1ZyBmaXgsDQo+IG90aGVyd2lzZSBzb21lIHdvcmtsb2FkcyByZWxhdGVkIHRvIEdQ
VSBwYXNzdGhyb3VnaCBhcmUgc2ltcGx5IHRvbw0KPiBzbG93IHRvIGJlIHVzYWJsZS4NCj4gDQo+
IEkgd291bGQgY2VydGFpbmx5IGJlIGZpbmUgd2l0aCBpdCBtYWtpbmcgaXQncyB3YXkgaW50byA0
LjE3LCBsZXQgbWUNCj4gYWRkIEhlbnJ5Og0KPiANCj4gQ29uczoNCj4gIC0gQ2hhbmdlcyB0aGUg
bnVtYmVyIG9mIGlzc3VlZCBtZW1vcnlfdHlwZV9jaGFuZ2VkKCksIHNvIHRoZXJlJ3MgYQ0KPiAg
ICByaXNrIEkgbWlzcGxhY2VkIHNvbWUgb2YgdGhlIGNvbmRpdGlvbnMgYW5kIHdlIGVuZCB1cCB3
aXRoIHdyb25nDQo+ICAgIGNhY2hlIHR5cGVzIGluIHRoZSBndWVzdCBwMm0gZHVlIHRvIG1pc3Np
bmcgbWVtb3J5X3R5cGVfY2hhbmdlZCgpDQo+ICAgIGNhbGxzLiAgVGhhdCBob3dldmVyIHdvbid0
IGFmZmVjdCBYZW4gaXRzZWxmLCBqdXN0IHRoZSBndWVzdC4NCj4gDQo+IFByb3M6DQo+ICAtIFJl
bW92ZXMgdW5uZWVkZWQgbWVtb3J5X3R5cGVfY2hhbmdlZCgpLCB0aHVzIG1ha2luZyBzb21lDQo+
IG9wZXJhdGlvbnMNCj4gICAgZmFzdGVyLiAgSXQncyBlZmZlY3QgaXQncyBncmVhdGx5IGRlcGVu
ZGVudCBvbiB1c2luZyBhIHNldCBvZg0KPiAgICBoeXBlcmNhbGxzIGFnYWluc3QgYSBkb21haW4s
IHdoaWNoIGRvZXNuJ3Qgc2VlbSBjb21tb24gaW4gdXBzdHJlYW0uDQo+ICAgIEl0J3MgcG9zc2li
bGUgb3RoZXIgcHJvZHVjdHMgYmFzZWQgb24gWGVuIGFwYXJ0IGZyb20gWGVuU2VydmVyIHdpbGwN
Cj4gICAgYWxzbyBzZWUgYW4gc3BlZWR1cCBhcyBhIHJlc3VsdC4NCg0KVGhhbmtzIGZvciB0aGUg
aW5mb3JtYXRpb24gYW5kIHRoZSBkZXRhaWxlZCBzdW1tYXJ5IQ0KDQpJIHRoaW5rIG15IHVuZGVy
c3RhbmRpbmcgaXMgdGhlIHNhbWUgYXMgd2hhdCBKYW4gaGFzIGluIA0KIng4Ni9OVU1BOiBjb3Jy
ZWN0IG1lbW5vZGVfc2hpZnQgY2FsY3VsYXRpb24gZm9yIHNpbmdsZSBub2RlIHN5c3RlbSIsDQot
IHdlIGFyZSBzdGlsbCBub3QgaW4gY29kZSBmcmVlemUgYnV0IGluIGZlYXR1cmUgZnJlZXplLCBz
byBwcm9wZXJseS1yZXZpZXdlZA0KZml4ZXMgYXJlIGVsaWdpYmxlIGZvciB0aGUgcmVsZWFzZS4g
Rm9yIHRoaXMgc3BlY2lmaWMgc2VyaWVzLCAodG8gbWUpIGl0IGxvb2tzIG9rDQphbmQgSSB3aWxs
IG5vdCBibG9jayB0aGUgbWVyZ2luZyBvZiB0aGlzIHNlcmllcyBpZiBtYWludGFpbmVycyB3YW50
IHRvIG1lcmdlDQppdCA6KSkNCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gVGhhbmtz
LCBSb2dlci4NCg==

