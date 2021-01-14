Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F42F5584
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 01:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66805.118816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzqLP-0002ud-D7; Thu, 14 Jan 2021 00:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66805.118816; Thu, 14 Jan 2021 00:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzqLP-0002uE-A7; Thu, 14 Jan 2021 00:18:31 +0000
Received: by outflank-mailman (input) for mailman id 66805;
 Thu, 14 Jan 2021 00:18:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NBCl=GR=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kzqLO-0002u9-4j
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 00:18:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ff98af8-e936-4dd1-8aca-fd2cc73d7c5d;
 Thu, 14 Jan 2021 00:18:28 +0000 (UTC)
Received: from AM6PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::18)
 by HE1PR08MB2698.eurprd08.prod.outlook.com (2603:10a6:7:34::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Thu, 14 Jan
 2021 00:18:26 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::e7) by AM6PR10CA0041.outlook.office365.com
 (2603:10a6:209:80::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Thu, 14 Jan 2021 00:18:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 00:18:25 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Thu, 14 Jan 2021 00:18:24 +0000
Received: from ddc56259b4d2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F02FC59E-5E19-44BC-AB49-DDA9A48BDF37.1; 
 Thu, 14 Jan 2021 00:18:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddc56259b4d2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jan 2021 00:18:19 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM4PR08MB2769.eurprd08.prod.outlook.com (2603:10a6:205:a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 00:18:16 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::158a:5405:59b6:e0a8]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::158a:5405:59b6:e0a8%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 00:18:16 +0000
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
X-Inumbo-ID: 6ff98af8-e936-4dd1-8aca-fd2cc73d7c5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFVjeO2HKfz+8yFfQbk/8p07EWt0C+eOvYslVYNd9uA=;
 b=qXxtN/pJixOBvs8sPf95DSGCWoPH2JoBRA/A/ayzYBB6CNGO6xfiw3qcB1CCb8Jok1igWHgog1JWaAT78V07RUK3Iw2PEkcsWsoZflD/PKgXtbrqZOt0QCHvT37haAglj7EMnfP26kj+CH9I9Cj5AICAX/0MTjK+k2pjnhGHtTk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWjivyFt/7vsxqCEUvj2uz3eBvwX60/U5BmpClv7uoi6dHM+fXkxSbc5jZWU3oN/6NwA/gKF9X7MQFpKz+qpd8LkHhSM2EM8Nc7IcKDbLb6O3n8ET9ai+sQ0WIIdJ1qJe9pL7mHS3kFY6/T9TSsSAskGY/cM1X3Tt1V5BnHF9T3y3wYqMQNWzwJdWSRNvQosAa0F7JIABu8i8f/IizJX/RPT5xODpDcxEoAUEjtdwf4ocJH0RtGOuquQzncMR0Gw0unYw1XnIHWhYT4yCxo0Dxbsb8A+8Xdw/Hp9GenI/iwrdBR3qFp/8l9RrJ/HO+5Q5Stn0lcYgUzlZyazsO2nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFVjeO2HKfz+8yFfQbk/8p07EWt0C+eOvYslVYNd9uA=;
 b=FxBjiePd0PFg2aO+plq/l81am11qkDEgc/dbSVo46y3Sb7YUkDdExnQe/4BaGNFFVZyk2XxMUysvIcrzQ/Wp2F0CiQuu5U8cTaa0Rii0lladQKg5QGIabwuRDpHO7LQYFdzJU+crsUPUp3362N0dnenvnujPoKFjZnxytZt66odsrIITYgBy8kERfyaIb9vbgjVTInEyrdNLDk/ixQA39F+P7JBTp3cqeFGiqm3lv99v/jq63eMqd/2Bmme3u6re6VQmTcNwHToh5U2vKnTP9ioGxbSa92aRUSAVo3Z3GZiDTC9JWHmJbMQ6UQFA9yZVIvXl4mNjgSQoZJLyYyakZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFVjeO2HKfz+8yFfQbk/8p07EWt0C+eOvYslVYNd9uA=;
 b=qXxtN/pJixOBvs8sPf95DSGCWoPH2JoBRA/A/ayzYBB6CNGO6xfiw3qcB1CCb8Jok1igWHgog1JWaAT78V07RUK3Iw2PEkcsWsoZflD/PKgXtbrqZOt0QCHvT37haAglj7EMnfP26kj+CH9I9Cj5AICAX/0MTjK+k2pjnhGHtTk=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v2 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
Thread-Topic: [PATCH v2 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
Thread-Index: AQHW5YaLYmn6Iv39+kOUEKfQN8gcb6odn1eAgAGSDjCABrfTgIAAVpWA
Date: Thu, 14 Jan 2021 00:18:16 +0000
Message-ID:
 <AM0PR08MB374768761C5A1A22480F27829EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20210108062126.2335873-1-wei.chen@arm.com>
 <20210108062126.2335873-2-wei.chen@arm.com>
 <c6de687f-2836-ec44-7d24-b088bfa10378@xen.org>
 <AM0PR08MB3747AE4B6F16FCB255D44D2C9EAD0@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <e7943b76-a0b8-fac6-d743-47b0cd42f7ad@xen.org>
In-Reply-To: <e7943b76-a0b8-fac6-d743-47b0cd42f7ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 92C1802CC3EBEF4F892DD860B760C759.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fb2e82c-16b8-42cd-5c98-08d8b821e8d6
x-ms-traffictypediagnostic: AM4PR08MB2769:|HE1PR08MB2698:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2698A0A835991C64A074C3D99EA80@HE1PR08MB2698.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ND0ZND9XVhsR9TpTMx9oOAS9OvVznvkpp8wsP58/7LjJRxUWk5ae2VYMYQiXtlbORFOzho7OvELVauU2t5Cn6C/8HA2vTu4jafb8WrWfJBNJM77Ur/ySOhNrcXiU/TFDqW9vzVwrz0jawJ+CTi6pX4TXdVofK/TdwYK5f0G1FdRo+5hX8tGiyduCOI9337EPG8SWtwU0squl1MsUhgAwyLCRDuub4Nmsh06asMBYvy0nPtNgigKdD2L/c5rAcfd0XLznJEyQGYG2v9t4GoZ4f3EROuQi8Q4Z149xg3DwsB1orZJvljynIWF9rW03xH55qmJmvr2mvYLHotZ5ii7DjAVdbfajE0hFO4haJ4TM0AnpkTxm5BKSbxmhzNEkNKXYCRqk9Q8QRO1UQOYFTpqLtcuoJlu1QMSmWOptJFAxxPxGC0XLkYnDtXh6TST0KsEcIIu3QJ8tl20a3tvV2Ayjbw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(76116006)(64756008)(66446008)(186003)(33656002)(55016002)(66476007)(52536014)(7696005)(2906002)(5660300002)(66556008)(83380400001)(54906003)(66946007)(26005)(6506007)(53546011)(86362001)(8936002)(966005)(316002)(4326008)(8676002)(9686003)(110136005)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WEI2cHdSVEgxOTFaandwb2FRNG5RUWNmV0tkVVZBbWU2dGluR2o0VFJ4RHFo?=
 =?utf-8?B?SmRqZnNUM2IzcWZzeGtLcHNDMXduN0thN2s3eElJZHg0UHNYeldtL251SDV2?=
 =?utf-8?B?V1VnWG1WNEhvMWhCMzFOeGNBdEZkZ0ZNRlhkTEZKRmlzYlNVRE02RDVpWnJK?=
 =?utf-8?B?QjV2NDN1K0VpY3EwYlh6c1NON3FpR2M3aFRINEYyKzVyY0tnZlhRR3poU21S?=
 =?utf-8?B?ZnNkQ3NPMnlyNTFiSEdEYlpSL0dSbjlDVGpQK1cxajJHMlpIZHFobVJRL3FQ?=
 =?utf-8?B?VHlEYkNUUlRnREIwZnJaazNQa2hXSXJCWHRuTitHaU9pYzJUa2haNDNwM2ha?=
 =?utf-8?B?N0VuZnIwcGh2dWpLMW83bUoyOEVQWFI3YXE5KzF4djFpNiswVzAweHB4Wmth?=
 =?utf-8?B?ZEZ3bFNwcGRBdW9JN1V1SElwYkY1QlZPS2JwL2RzNU9qQ3BZTk15MFNhY3Er?=
 =?utf-8?B?OFNyUWlGdVNlYWdEWTVDZ0RpSWlFMGR5YmtrM29HUlVaMUtBRUgvUXBuUWg3?=
 =?utf-8?B?Ky9GSWYrYmN3ZVM1QndxNW9wWTRlK1c0UFVJTmtMaWpPMHVZN1BXc0J5WmVR?=
 =?utf-8?B?Y2loVmQ4VkhxZ3pGZlJtTEZaRmxzSzVZMmgzeUNlRld5Ym0wUjVTaWtsOHFD?=
 =?utf-8?B?YW5OQUJGSnZ1NkxCY0lHWTBiU2tyL3NYMHZJSE9rVnRkc3NJNnkxcVFaZEw5?=
 =?utf-8?B?RVRucmh4bC9QNHVDOFhDaTU4R3Y5NjEybm1IZmpFaUIrZThVWTBSdWQ2aWRR?=
 =?utf-8?B?K0NSdWlPL3d0SEptalNzQ1hlNEZXVVlacGthOHZvSHJsT0Nod2dkSkVGUHF1?=
 =?utf-8?B?d2VtTjV3NjgrM0xhQTFkSUI3RVE1ZzhQK0xzWnFyMXVFUXNtNk0yTVFXTUk1?=
 =?utf-8?B?dmdJdWM3cE1hTzBZM3FZbVN1alkyYnFVVzBOeWswQ2h2SENsWVd0YTRQSVBG?=
 =?utf-8?B?YVVjYUY3WCtSMkxZV3JxZXIrblFoSVdIM0F1bmhidkNWTUpqMWhwbGhaSmNz?=
 =?utf-8?B?NUNZd1BoVWhXdzZPWnA3bkxqRGhhakt3VDVac0NMSEE5WkJEd0RBakpUQjZW?=
 =?utf-8?B?R1U1dnJRcllOZ1FmbGwwRWhRTzRiWlJpMU8xaUFIZ2FNK2NhWndVUkkyai9E?=
 =?utf-8?B?MU93d3p0VkRBck4wWndrdW52a29JajRKN1doOVFya2drc2tuSHpBQWxqUDdI?=
 =?utf-8?B?M3ZzWTNJSlYxRTJPT2hUUVBXbE5hQ0Vld2lKbHpxTHFaUDVxdlVrdWl4aEhl?=
 =?utf-8?B?QktPQjh4UmpHakNDM1drOEtJUnM5Y2duUHRwR2duSmUvMGc5N2RleFVDSXY1?=
 =?utf-8?Q?oash70XtcOK2k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2769
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04ed2ee1-faef-4280-2874-08d8b821e3ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NTg6RlYVC6TA5QemuPKAF0Edku0jS5FkSIsgRwcycjJCY8LyzD8vWKOHmZmjrLFb7TI7Wkcg2WuYWnHUK4GIjPQ3eetHVzSM0ohmLzc9PnoSo8KP426gYzqFK4ZO7jxuXWYCv70e5GDfARWN8eK9o+Pd0xvjINHcAT+eL6m50V36i41to+h4CvVZHrf+aBYQIq9dvKHDi87chXTD8BdtMi55YRsNhlSCvTXpACyEfqo+hbzAkF2s5EvyoO4M9WNToth+UxS3kBlOtyP4LF3lGpcIJuVdMfbDaQXAxqNbS7oopxBe1DXQuptmAp57QavcNJhTd0aAJEfcTI5ql38Hc1t8ARntIh8vNCSwf34zFZ4V9/5ateRM1x7qm6X/7ycvPTIhYJ4pgBtQhTZGVg+dotOXlRw7UvM41Vf+gv6hSjpt/XStsgoarIZfFKgxzbWySTJ2Exhn0R2+Jq/Pf4Ihj3mwliOP0UAalnhmkS9NnGbgr9Sf8F5SEYRdJxPriH/VewN8hRs7XvIGSXIIG1ltjh83UsS2OZlYRdTnKe0ujIJFmcVIo8vWAFc4GiQ+Z7oc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(46966006)(9686003)(86362001)(33656002)(47076005)(356005)(70586007)(26005)(316002)(55016002)(8676002)(83380400001)(336012)(8936002)(54906003)(186003)(966005)(2906002)(81166007)(70206006)(4326008)(110136005)(34020700004)(6506007)(53546011)(7696005)(52536014)(82740400003)(478600001)(5660300002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 00:18:25.1969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb2e82c-16b8-42cd-5c98-08d8b821e8d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2698

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQx5pyIMTTml6UgMjozMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBlbm55IFpoZW5nDQo+IDxQZW5ueS5aaGVu
Z0Bhcm0uY29tPjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgbmQNCj4gPG5kQGFy
bS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSB4ZW4vYXJtOiBBZGQgZGVmZW5z
aXZlIGJhcnJpZXIgaW4gZ2V0X2N5Y2xlcyBmb3INCj4gQXJtNjQNCj4gDQo+IA0KPiANCj4gT24g
MDkvMDEvMjAyMSAxMjoxNiwgV2VpIENoZW4gd3JvdGU6DQo+ID4gSEkgSnVsaWVuLA0KPiANCj4g
SGkgV2VpLA0KPiANCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4gU2VudDogMjAyMeW5tDHmnIg45pel
IDE5OjU2DQo+ID4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiA+PiBD
YzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgUGVubnkgWmhl
bmcNCj4gPj4gPFBlbm55LlpoZW5nQGFybS5jb20+OyBKaWFtZWkgWGllIDxKaWFtZWkuWGllQGFy
bS5jb20+OyBuZA0KPiA+PiA8bmRAYXJtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAyLzJdIHhlbi9hcm06IEFkZCBkZWZlbnNpdmUgYmFycmllciBpbiBnZXRfY3ljbGVzIGZvcg0K
PiA+PiBBcm02NA0KPiA+Pg0KPiA+PiBIaSBXZWksDQo+ID4+DQo+ID4+IE9uIDA4LzAxLzIwMjEg
MDY6MjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gUGVyIHRoZSBkaXNjdXNzaW9uIFsxXSBvbiB0
aGUgbWFpbGluZyBsaXN0LCB3ZSdkIGJldHRlciB0bw0KPiA+Pj4gaGF2ZSBhIGJhcnJpZXIgYWZ0
ZXIgcmVhZGluZyBDTlRQQ1QgaW4gZ2V0X2N5Y2xlcy4gSWYgdGhlcmUNCj4gPj4+IGlzIG5vdCBh
bnkgYmFycmllciB0aGVyZS4gV2hlbiBnZXRfY3ljbGVzIGJlaW5nIHVzZWQgaW4gc29tZQ0KPiA+
Pj4gc2VxbG9jayBjcml0aWNhbCBjb250ZXh0IGluIHRoZSBmdXR1cmUsIHRoZSBzZXFsb2NrIGNh
biBiZQ0KPiA+Pj4gc3BlY3VsYXRlZCBwb3RlbnRpYWxseS4NCj4gPj4+DQo+ID4+PiBXZSBpbXBv
cnQgTGludXggY29tbWl0IDc1YTE5YTAyMDJkYjIxNjM4YTFjMmI0MjRhZmI4NjdlMWY5YTIzNzY6
DQo+ID4+PiAgICAgICBhcm02NDogYXJjaF90aW1lcjogRW5zdXJlIGNvdW50ZXIgcmVnaXN0ZXIg
cmVhZHMgb2NjdXIgd2l0aCBzZXFsb2NrDQo+IGhlbGQNCj4gPj4+DQo+ID4+PiAgICAgICBXaGVu
IGV4ZWN1dGluZyBjbG9ja19nZXR0aW1lKCksIGVpdGhlciBpbiB0aGUgdkRTTyBvciB2aWEgYSBz
eXN0ZW0gY2FsbCwNCj4gPj4+ICAgICAgIHdlIG5lZWQgdG8gZW5zdXJlIHRoYXQgdGhlIHJlYWQg
b2YgdGhlIGNvdW50ZXIgcmVnaXN0ZXIgb2NjdXJzIHdpdGhpbg0KPiA+Pj4gICAgICAgdGhlIHNl
cWxvY2sgcmVhZGVyIGNyaXRpY2FsIHNlY3Rpb24uIFRoaXMgZW5zdXJlcyB0aGF0IHVwZGF0ZXMg
dG8gdGhlDQo+ID4+PiAgICAgICBjbG9ja3NvdXJjZSBwYXJhbWV0ZXJzIChlLmcuIHRoZSBtdWx0
aXBsaWVyKSBhcmUgY29uc2lzdGVudCB3aXRoIHRoZQ0KPiA+Pj4gICAgICAgY291bnRlciB2YWx1
ZSBhbmQgdGhlcmVmb3JlIGF2b2lkcyB0aGUgc2l0dWF0aW9uIHdoZXJlIHRpbWUgYXBwZWFycyB0
bw0KPiA+Pj4gICAgICAgZ28gYmFja3dhcmRzIGFjcm9zcyBtdWx0aXBsZSByZWFkcy4NCj4gPj4+
DQo+ID4+PiAgICAgICBFeHRlbmQgdGhlIHZEU08gbG9naWMgc28gdGhhdCB0aGUgc2VxbG9jayBj
cml0aWNhbCBzZWN0aW9uIGNvdmVycyB0aGUNCj4gPj4+ICAgICAgIHJlYWQgb2YgdGhlIGNvdW50
ZXIgcmVnaXN0ZXIgYXMgd2VsbCBhcyBhY2Nlc3NlcyB0byB0aGUgZGF0YSBwYWdlLiBTaW5jZQ0K
PiA+Pj4gICAgICAgcmVhZHMgb2YgdGhlIGNvdW50ZXIgc3lzdGVtIHJlZ2lzdGVycyBhcmUgbm90
IG9yZGVyZWQgYnkgbWVtb3J5IGJhcnJpZXINCj4gPj4+ICAgICAgIGluc3RydWN0aW9ucywgaW50
cm9kdWNlIGRlcGVuZGVuY3kgb3JkZXJpbmcgZnJvbSB0aGUgY291bnRlciByZWFkIHRvIGENCj4g
Pj4+ICAgICAgIHN1YnNlcXVlbnQgbWVtb3J5IGFjY2VzcyBzbyB0aGF0IHRoZSBzZXFsb2NrIG1l
bW9yeSBiYXJyaWVycyBhcHBseSB0bw0KPiA+Pj4gICAgICAgdGhlIGNvdW50ZXIgYWNjZXNzIGlu
IGJvdGggdGhlIHZEU08gYW5kIHRoZSBzeXN0ZW0gY2FsbCBwYXRocy4NCj4gPj4+DQo+ID4+PiAg
ICAgICBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+ID4+PiAgICAgICBDYzogTWFyYyBa
eW5naWVyIDxtYXJjLnp5bmdpZXJAYXJtLmNvbT4NCj4gPj4+ICAgICAgIFRlc3RlZC1ieTogVmlu
Y2Vuem8gRnJhc2Npbm8gPHZpbmNlbnpvLmZyYXNjaW5vQGFybS5jb20+DQo+ID4+PiAgICAgICBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0tDQo+ID4+IGtlcm5lbC9hbHBp
bmUuREVCLjIuMjEuMTkwMjA4MTk1MDI2MC4xNjYyQG5hbm9zLnRlYy5saW51dHJvbml4LmRlLw0K
PiA+Pj4gICAgICAgUmVwb3J0ZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4
LmRlPg0KPiA+Pj4gICAgICAgU2lnbmVkLW9mZi1ieTogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29u
QGFybS5jb20+DQo+ID4+Pg0KPiA+Pj4gV2hpbGUgd2UgYXJlIG5vdCBhd2FyZSBvZiBzdWNoIHVz
ZSBpbiBYZW4sIGl0IHdvdWxkIGJlIGJlc3QgdG8gYWRkIHRoZQ0KPiA+Pj4gYmFycmllciB0byBh
dm9pZCBhbnkgc3VwcmlzZS4NCj4gPj4+DQo+ID4+PiBJbiBvcmRlciB0byByZWR1Y2UgdGhlIGlt
cGFjdCBvZiBuZXcgYmFycmllciwgd2UgcGVyZmVyIHRvDQo+ID4+PiB1c2UgZW5mb3JjZSBvcmRl
ciBpbnN0ZWFkIG9mIElTQiBbMl0uDQo+ID4+Pg0KPiA+Pj4gQ3VycmVudGx5LCBlbmZvcmNlIG9y
ZGVyIGlzIG5vdCBhcHBsaWVkIHRvIGFybTMyIGFzIHRoaXMgaXMNCj4gPj4+IG5vdCBkb25lIGlu
IExpbnV4IGF0IHRoZSBkYXRlIG9mIHRoaXMgcGF0Y2guIElmIHRoaXMgaXMgZG9uZQ0KPiA+Pj4g
aW4gTGludXggaXQgd2lsbCBuZWVkIHRvIGJlIGFsc28gZG9uZSBpbiBYZW4uDQo+ID4+Pg0KPiA+
Pj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAyMC0NCj4gPj4gMTIvbXNnMDAxODEuaHRtbA0KPiA+Pj4gWzJdIGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDIwLzMvMTMvNjQ1DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIENo
ZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IHYxIC0+IHYyOg0KPiA+Pj4g
MS4gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIHJlZmVyIExpbnV4IGNvbW1pdC4NCj4gPj4+IDIu
IENoYW5nZSB1NjQgdG8gdWludDY0X3QNCj4gPj4+IC0tLQ0KPiA+Pj4gICAgeGVuL2luY2x1ZGUv
YXNtLWFybS90aW1lLmggfCA0Mw0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQ0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
dGltZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmgNCj4gPj4+IGluZGV4IDVjNDUyOWVi
YjUuLjZiOGZkODM5ZGQgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3Rp
bWUuaA0KPiA+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmgNCj4gPj4+IEBAIC0x
MSw5ICsxMSwyNiBAQA0KPiA+Pj4NCj4gPj4+ICAgIHR5cGVkZWYgdWludDY0X3QgY3ljbGVzX3Q7
DQo+ID4+Pg0KPiA+Pj4gLXN0YXRpYyBpbmxpbmUgY3ljbGVzX3QgZ2V0X2N5Y2xlcyh2b2lkKQ0K
PiA+Pj4gKy8qDQo+ID4+PiArICogRW5zdXJlIHRoYXQgcmVhZHMgb2YgdGhlIGNvdW50ZXIgYXJl
IHRyZWF0ZWQgdGhlIHNhbWUgYXMgbWVtb3J5IHJlYWRzDQo+ID4+PiArICogZm9yIHRoZSBwdXJw
b3NlcyBvZiBvcmRlcmluZyBieSBzdWJzZXF1ZW50IG1lbW9yeSBiYXJyaWVycy4NCj4gPj4+ICsg
Ki8NCj4gPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfQVJNXzY0KQ0KPiA+Pj4gKyNkZWZpbmUgcmVh
ZF9jbnRwY3RfZW5mb3JjZV9vcmRlcmluZyh2YWwpIGRvIHsgXA0KPiA+Pj4gKyAgICB1aW50NjRf
dCB0bXAsIF92YWwgPSAodmFsKTsgICAgICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICBhc20gdm9s
YXRpbGUoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICAiZW9yICUw
LCAlMSwgJTFcbiIgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICAiYWRkICUw
LCBzcCwgJTBcbiIgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICAibGRyIHh6
ciwgWyUwXSIgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICA6ICI9ciIg
KHRtcCkgOiAiciIgKF92YWwpKTsgICAgICAgICAgICAgICAgXA0KPiA+Pj4gK30gd2hpbGUgKDAp
DQo+ID4+PiArI2Vsc2UNCj4gPj4+ICsjZGVmaW5lIHJlYWRfY250cGN0X2VuZm9yY2Vfb3JkZXJp
bmcodmFsKSBkbyB7fSB3aGlsZSAoMCkNCj4gPj4+ICsjZW5kaWYNCj4gPj4+ICsNCj4gPj4+ICtz
dGF0aWMgaW5saW5lIGN5Y2xlc190IHJlYWRfY250cGN0X3N0YWJsZSh2b2lkKQ0KPiA+Pg0KPiA+
PiBPT0ksIGlzIHRoZXJlIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiB0byBjcmVhdGUgYSBuZXcgaGVs
cGVyPw0KPiA+Pg0KPiA+DQo+ID4gWWVzLCBJIHRyeSB0byByZWR1Y2UgdGhlICNpZiBkZWZpbmVk
KENPTkZJR19BUk1fNjQpIGNodW5rcy4NCj4gDQo+IEhtbW0uLi4gVGhlcmUgaXMgbm8gI2lmZGVm
IGNodW5rIGluIHJlYWRfY250cGN0X3N0YWJsZSgpLiBEaWQgSSBtaXNzDQo+IGFueXRoaW5nPw0K
DQpObywgSXQgd2FzIEkgd2hvIG1pc3VuZGVyc3Rvb2QgeW91ciBjb21tZW50cy4NCg0KPiANCj4g
PiBJIHRoaW5rDQo+ID4gaWYgd2UgaW50cm9kdWNlIGFuIGVtcHR5IGhlbHBlciBmb3IgQXJtMzIs
IHdlIGNhbiByZWR1Y2UgdGhlIG90aGVyDQo+ID4gY2h1bmsgaW5zaWRlIGdldF9jeWNsZXMuIElu
IGFkZGl0aW9uLCBpZiB3ZSBuZWVkIHRvIGRvIHRoZSBzYW1lIHdvcmsNCj4gPiBmb3IgQXJtMzIg
aW4gdGhlIGZ1dHVyZSwgd2UgbWF5IG5vdCBuZWVkIHRvIG1vZGlmeSBnZXRfY3ljbGVzLg0KPiBJ
IGRvbid0IHJlYWxseSBmb2xsb3cgdGhpcy4gSSB3YXNuJ3QgYXNraW5nIGFib3V0DQo+IHJlYWRf
Y250cGN0X2VuZm9yY2Vfb3JkZXJpbmcoKS4gSW5zdGVhZCBJIHdhcyBhc2tpbmcgYWJvdXQNCj4g
cmVhZF9jbnRwY3Rfc3RhYmxlKCkgd2hpY2ggbG9va3MgbGlrZSB5b3UganVzdCBzcGxpdCBnZXRf
Y3ljbGVzKCkuDQo+IA0KPiBUaGlzIGNoYW5nZSBsb29rcyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0
byB0aGUgcHVycG9zZSBvZiB0aGlzIHNlcmllcy4gSQ0KPiBhbSBub3QgZ29pbmcgdG8gYXNrIHRv
IHNwbGl0IGl0LCBidXQgSSB0aGluayB0aGlzIHNob3VsZCBiZSBleHBsYWluZWQgaW4NCj4gdGhl
IGNvbW1pdCBtZXNzYWdlLg0KPiANCg0KWWVzLCBJIGZvcmdvdCB0byBleHBsYWluIHRoaXMgY2hh
bmdlcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCldoZW4gSSB3YXMgdHJ5aW5nIHRvIGFkZCBy
ZWFkX2NudHBjdF9lbmZvcmNlX29yZGVyaW5nIGludG8gZ2V0X2N5Y2xlcywNCnRoZXJlIHdlcmUg
dGhyZWUgd2F5cyBJIGNhbiBkbzoNCjEuIEFkZCByZWFkX2NudHBjdF9lbmZvcmNlX29yZGVyaW5n
IHRvIHRoZSBlbmQgb2YgZWFjaCBicmFuY2gNCjIuIEFkZCBhIG5ldyBjeWNsZXNfdCB2YXJpYWJs
ZSBhbmQgcmVjb3JkIHZhbHVlIG9mIGVhY2ggYnJhbmNoLiBVc2luZw0KICAgIHRoZSBmdW5jdGlv
biBlbmQgYXMgdW5pcXVlIHJldHVybiBwb2ludC4gQW5kIHRoZW4gd2UgY2FuIGFkZA0KICAgIHJl
YWRfY250cGN0X2VuZm9yY2Vfb3JkZXJpbmcgdG8gdGhlIGVuZCBvZiBnZXRfY3ljbGVzLg0KMy4g
RG9uJ3QgdG91Y2ggdGhlIGdldF9jeWNsZXMgZnVuY3Rpb24gYm9keSwganVzdCByZW5hbWUgaXQg
YW5kIGNyZWF0ZQ0KICAgIGFub3RoZXIgaGVscGVyIG5hbWVkIGdldF9jeWNsZXMgdG8gaW5jbHVk
ZSBvcmlnaW5hbCBmdW5jdGlvbiBhbmQNCiAgICByZWFkX2NudHBjdF9lbmZvcmNlX29yZGVyaW5n
DQoNClBlcnNvbmFsbHksIEkgcHJlZmVyIHRoZSAjMywgc28gSSBjaGFuZ2VkIHRoZSBmdW5jdGlv
biBsaWtlIHRoaXMuDQoNCkhvdyBhYm91dCBhZGRpbmcgdGhlIGV4cGxhbmF0aW9uIGluIHRoZSBl
bmQgb2YgY29tbWl0IG1lc3NhZ2UgbGlrZSB0aGlzOg0KIg0KLi4uLiBJZiB0aGlzIGlzIGRvbmUg
aW4gTGludXggaXQgd2lsbCBuZWVkIHRvIGJlIGFsc28gZG9uZSBpbiBYZW4uDQoNClRvIGF2b2lk
IGFkZGluZyByZWFkX2NudHBjdF9lbmZvcmNlX29yZGVyaW5nIGV2ZXJ5d2hlcmUsIHdlIGludHJv
ZHVjZWQNCmEgbmV3IGhlbHBlciByZWFkX2NudHBjdF9zdGFibGUgdG8gcmVwbGFjZSBvcmlnaW5h
bCBnZXRfY3ljbGVzLCBhbmQgdHVybg0KZ2V0X2N5Y2xlcyB0byBhIHdyYXBwZXIgd2hpY2ggd2Ug
Y2FuIGFkZCByZWFkX2NudHBjdF9lbmZvcmNlX29yZGVyaW5nDQplYXNpbHkuDQoiDQoNClRoYW5r
cywNCldlaSBDaGVuDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

