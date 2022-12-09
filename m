Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED8647FDB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 10:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457731.715707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ZN8-0002UV-FH; Fri, 09 Dec 2022 09:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457731.715707; Fri, 09 Dec 2022 09:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ZN8-0002RC-CU; Fri, 09 Dec 2022 09:08:46 +0000
Received: by outflank-mailman (input) for mailman id 457731;
 Fri, 09 Dec 2022 09:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgY=4H=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p3ZN6-0002Qn-80
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 09:08:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13564d41-77a1-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 10:08:42 +0100 (CET)
Received: from DU2PR04CA0273.eurprd04.prod.outlook.com (2603:10a6:10:28c::8)
 by AM7PR08MB5527.eurprd08.prod.outlook.com (2603:10a6:20b:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.6; Fri, 9 Dec
 2022 09:08:39 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::88) by DU2PR04CA0273.outlook.office365.com
 (2603:10a6:10:28c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 9 Dec 2022 09:08:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.17 via Frontend Transport; Fri, 9 Dec 2022 09:08:38 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 09 Dec 2022 09:08:35 +0000
Received: from ef5bee15ad32.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D8EF828-03DC-4557-A7F3-BEC78605065D.1; 
 Fri, 09 Dec 2022 09:08:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef5bee15ad32.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Dec 2022 09:08:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB7594.eurprd08.prod.outlook.com (2603:10a6:102:270::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 09:08:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 09:08:22 +0000
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
X-Inumbo-ID: 13564d41-77a1-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfBVa7H0lksj3ilIgHlbBSj4rM5RsFqRl4fYbdre01E=;
 b=6Vhhr0XiCzSnfTpKlDEJIw6H2zWnXgTCitb/eq9BawHM/OwGNz9amvX6ebM9QCBzpu+zE7GFNJJ7V8j5t5+DycbWNJiQWYmW94jrOmTaWTM9cDydjzlFVjiYOCrNPtC6ZzWdQQVjr/RZJF77taQ6W4p2qtYt4KLsT2fJH5NpyeE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05a350d32cdf80d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmxPvKWHICoplVy4MQFVa8E34eXqpG8K70gRANMslBnbS260h/9JaP9pAbicopsBpqHDr3RJ/bngT/0aQSrwRB8QW5wtZ5aENcUH1uTxfYwoQ2oeAAVGWaed+e9UDAAVf851Mubmn7EsJbnatLla49p2tOw6fkylaceukELj0hyf+N/LZgqou4cMuZHuZxPEp9SPC/BLCq5vDKsKBs8cE+E7frVZ7XnR3Cfot3KRjAHyM0Or/Yg3G7LD7ihnKoI6rbYNGKmAFl5a8ijCXhy07YZpYXpmDaYRZBLbUpa21H2NsosIY63dB0dJetrGaDbUX97z5jXd/mHNIhq7lMHFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfBVa7H0lksj3ilIgHlbBSj4rM5RsFqRl4fYbdre01E=;
 b=IPXPiy4dF4bKfWERoQQB0iDFlGcNXavNGL+yznh90/jMFoA0t1wD6V+dAMhSkMwzef54fBPmFlvi5Fg5SF4pSXkqU4+wGDhYQ+PsT0gHgoF/G6UZJhaGVhpauGSpxQkTHmhggqW7tTNkcngJtoiub0A75l6qqGrdW+GhXvxMA6ugilHsjRpXUwSZF5D/KLmA22rWWAP4SZ9FCRmy6ALycFpT9AwRTYXwRa5uYIGcsjBjraR6vA/inF7E6gP9UHerVXL2w69pjDV/mv0W/kgq4cAIqSDdWmv04NMFPsw45ONE7AracuHreZsaLnhZ9l6NKDHsAlXzhj5TjLS5XsDpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfBVa7H0lksj3ilIgHlbBSj4rM5RsFqRl4fYbdre01E=;
 b=6Vhhr0XiCzSnfTpKlDEJIw6H2zWnXgTCitb/eq9BawHM/OwGNz9amvX6ebM9QCBzpu+zE7GFNJJ7V8j5t5+DycbWNJiQWYmW94jrOmTaWTM9cDydjzlFVjiYOCrNPtC6ZzWdQQVjr/RZJF77taQ6W4p2qtYt4KLsT2fJH5NpyeE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: efi-boot misra rule 4.1 fix
Thread-Topic: [PATCH] xen/arm: efi-boot misra rule 4.1 fix
Thread-Index: AQHZC2cU7mDXJsaiwEanXIsl1g+lUa5lRLWA
Date: Fri, 9 Dec 2022 09:08:22 +0000
Message-ID: <E178D80D-B5EC-4F50-A288-106A928FB030@arm.com>
References:
 <alpine.DEB.2.22.394.2212081538310.2965472@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2212081538310.2965472@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB7594:EE_|DBAEUR03FT039:EE_|AM7PR08MB5527:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e121c35-35de-427f-266e-08dad9c4f599
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NXdYCMJXCo7WRxtWk5aMXwA95EEgDmXAxzkBjHLh/7j0/Ufmdyl0YsHoEpJTMLLLHMct2nakTJIRx0ogsEGSFXUJHJwkC5dF9iq+WXurRSbNpaym9e/Y9SxSU9g3Msgh7kwOeqfEK+wJjg2Au2tp3POFTYvc0/5PrZI3QcEDj21Xefp0QrEn8E7fectmVkI/UhcCDPQ9d78Ur4gyArhZHLJksCjXBU7lzsJJxQiD202/gsSA4/35OhTELEHviea5SEbcHTpVEkctV2gY6o5V1yoTryGC0dFZobbt/jbVt0kDp6VVv/l7N75P3jPeRgkdGS8deIG1hnlHVeefMhBGvjzmhvBS52x+BwI2KBBWi9XMtEjq0PbHQskfmABT+1PGVKZbgaRPGom6w9OBulQvHjON5dfFfgA4GufxbsgBMZBTCwgknx6ot20egBB4uhS+YtZcaxdPhYan513T5l1vVs3ExyGyTjdmC29IiBjABtRyAZC6cieIMGkH0BGpmIbDdsvtLRLtedgDrRyqya5ZNVpxk+O8GZmv8qYP2crx8ZEqAZFU1y8hl42PPJ7jrF06ox8MLT00k0nhUP7CUwbe24AiUNgWKNheTf8tawiKbJfd76Xuw5PyqG2YBPWkCJo+WLEUS5+/Clpr1qmBzMxHh9+qLSeOhwbCuctyLUFUJHXshgxrhREwnfhvQ+wWneBAIIc0dCHYPWEDNPFETy+sIk9Q7qSlmtwolbzvv6gAz4A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199015)(38070700005)(53546011)(26005)(33656002)(36756003)(6486002)(478600001)(71200400001)(6506007)(316002)(4744005)(66446008)(8936002)(91956017)(66556008)(64756008)(54906003)(66476007)(6916009)(76116006)(8676002)(2906002)(4326008)(66946007)(83380400001)(38100700002)(41300700001)(186003)(2616005)(5660300002)(122000001)(6512007)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8E320E2C87B50439FB0935549B6DD00@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a262b008-08c5-46ed-051e-08dad9c4ec0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/cpYEcWqaVg8rfc2vQ/iV98FQo95xqxC+wu1NUQLEgpTIWA2yg/69zsOzSBxDY4xqbBEpItBIOhfE7XHysN+Gkwkg3LdUjQ+mJ2fiUI7NtoM5yChETpjjFYg4vI9K0CssEHEl3xX/VlHpAPrKlNRsrERg7qzvudqQ9Y9utrVI1sj3VGoJBq10eR31RK6FIdJ6zlWkEeUrHZQHKyw0ExacNrroV0cUMDZmk31LULIr1wNxIFQopXZTlV19rN1rYKKV/KHUeLIoxCRUZGcKgQNKSVxJARN+KVEO/Z4F/rt6S1bT5fq5vobnlc2nvphV9BlhrBVPrFOAuwxeu0LN5fXtJZisbWAG9TCQ1bA62Tu6SRTmsEPQgNHL6twFgKvpBV1EUuqTTqeqgP17EzBAW8u9+tQpoAhEDWbC2heQg6F1sT+X/4lGiEdZmLhbX3CMShvs9KLsaUSsXutWnkSk0+/T+abhXmsnJrZwV931hfvoTZxF4cktM6dotia2dMpzd41br3IJ30zKthx+aItYtA9A9ZgRZfGXgatv3gcxxl40tMlfk3Dg842jYC4sk2Cj/zJZ8Kz3EIdo2ZHLCdLp+3gz1dCDZdrY1cVvygEB1ihtMSOBEsa8KLpbA1gOBTsEOruPNu1yFIRcBYG8ARJnmgsf3J8GP3Mk0t986BZ/EB/MBxB+WU54YsMeMkwNDpmD94YUWPOXBtEdil2x9mzWHNlTw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(2616005)(336012)(47076005)(186003)(83380400001)(356005)(81166007)(86362001)(36860700001)(82740400003)(2906002)(6862004)(5660300002)(8936002)(4744005)(40480700001)(40460700003)(82310400005)(41300700001)(6486002)(26005)(478600001)(6512007)(70586007)(6506007)(53546011)(70206006)(8676002)(4326008)(54906003)(316002)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 09:08:38.3462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e121c35-35de-427f-266e-08dad9c4f599
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5527

DQoNCj4gT24gOSBEZWMgMjAyMiwgYXQgMDA6NDEsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBXZSBoYXZlIDMgdmlvbGF0aW9ucyBvZiBN
SVNSQSBDIFJ1bGUgNC4xICgiT2N0YWwgYW5kIGhleGFkZWNpbWFsIGVzY2FwZQ0KPiBzZXF1ZW5j
ZXMgc2hhbGwgYmUgdGVybWluYXRlZCIpIGluIHhlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaC4g
Rml4DQo+IHRoZW0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0
ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPg0KDQpIaSBTdGVmYW5vLA0KDQpJ4oCZdmUgY2hlY2tl
ZCBhbHNvIHdpdGggY292ZXJpdHkgYW5kIGl0IHNvbHZlcyB0aGUgdmlvbGF0aW9uLg0KDQpSZXZp
ZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg==

