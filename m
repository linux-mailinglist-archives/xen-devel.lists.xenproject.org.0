Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1F18B375B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 14:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712780.1113622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KtV-0007nZ-9s; Fri, 26 Apr 2024 12:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712780.1113622; Fri, 26 Apr 2024 12:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KtV-0007lB-6p; Fri, 26 Apr 2024 12:41:37 +0000
Received: by outflank-mailman (input) for mailman id 712780;
 Fri, 26 Apr 2024 12:41:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Jki=L7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1s0KtU-0007l3-EP
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 12:41:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2606::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5131c0fb-03ca-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 14:41:35 +0200 (CEST)
Received: from DU2PR04CA0286.eurprd04.prod.outlook.com (2603:10a6:10:28c::21)
 by GVXPR08MB10573.eurprd08.prod.outlook.com (2603:10a6:150:14b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 12:41:33 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::4) by DU2PR04CA0286.outlook.office365.com
 (2603:10a6:10:28c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Fri, 26 Apr 2024 12:41:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19 via
 Frontend Transport; Fri, 26 Apr 2024 12:41:32 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315");
 Fri, 26 Apr 2024 12:41:32 +0000
Received: from b09819178672.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8692D7A5-256F-4914-AF19-BCE20750B3CE.1; 
 Fri, 26 Apr 2024 12:41:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b09819178672.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Apr 2024 12:41:25 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DBBPR08MB6297.eurprd08.prod.outlook.com (2603:10a6:10:20b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Fri, 26 Apr
 2024 12:41:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 12:41:21 +0000
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
X-Inumbo-ID: 5131c0fb-03ca-11ef-909a-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bYHAOcoJNZB8umrwsfgLNNllFVjaKyyDn7+IOCpNzwX5aQdQBtE+G+Z26D0wJ0m4m6DtQwgKgVUsD9L7tMitChb/joii8ItaY9moXtWQ6W+bswAachJ2negdH9Ke6UMMY/bHU+knk1MtE9bkIusBS0W1MKWJpejfjSDKyDi8H7CDaR+h0fG0fR31KYXMg+bJ3Ec12TKcTrU46hw/dZ317N2ZRU6qGrnb4Ul5KFcsFEvuNpwmxfpbkYMyy3/rjBuTUAggD3isMDeSRriBdSL3jeZ/ZqN1oPsmoAjKLqtIMBKYluh2UmRF4gvvhwzXoq8acLgl262rZvwIMRBJvQ7LMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaBtnMchK3C7ex6X6auTqSqXQHGjBhqn97iB+AO9fOU=;
 b=ZyvvIKQC8WewVvoPf8s+FpGYc18XbhntQN033Oz2qwSD93W6ZE3MI5b0EN1bGyukEIdIx69Kbp/F2WRwfhVTGyhO3ngHJk2UjyI+9JjvQqPY7K/dTNMTke2XoJbkD2HnvEz4MMhpv7+4h6Xls2/2h/blRWqipCKWeCBd1lTQmpy0c3sEYdmQhgO0G1/Gh0UC2ESX7TUctO4WJeoDJ4sVC3OT7wMpNEIrD/L+iuHmUytr1RM+KHUYuN3jNuhSJryORdmn/TN3MHnl99/yvj/E5bhAB8iHdYvIR0Cu6vFzQuQoGO3J85/lopoubD2Ak3KqeVJXGYrgfUPJF2+iZSuO7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaBtnMchK3C7ex6X6auTqSqXQHGjBhqn97iB+AO9fOU=;
 b=KGa3wZ6fsmVsfza8P2R6fAEeAOFc6T/oLFMOmjDQI9CuYKqb9/2+Lqa4U7CR7QjP9wjJiAYxBsE6reCZLNZ3tr7IldpklRcMdWeE/VUCC+NR/spbDIMqrVOFuLyXA3WPq6t4AIA3qo5h2EWM45AWkCv0DM4kB+dZLqYkvygq1LE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 47d5d4fd82cdd49e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alLozC6NGPEW7ZPLEpG4MnMBf20n8RB9o5mmym9sFaIi/jzeM2NHxj8Xia6q2x5LoTpnmwmeOPitgqWFz9UOoOcXXjxnSQH0pzerEe2QAk/EDy/NG9T45fuLV/m4xMiamxSNbtlR0OJkHvS63utFn4/nxL9H3yoD2UKoMN3KcVm6Be9Hk4XLXgUYrfmu2IQyOoNYrUAbNWaEYwQ/McLnGmRgt3JbMevW2Jj5kvadLKnYS+8MpJ6qeqeAUlcfDPzRmK+rjBni8n/d2mPXY0/3v60aFb88pzNOSJDMjXQMSnkR6WKyW1Muh5OrPRrTKt+fWGUASdmrPAZTlCqYMXsGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaBtnMchK3C7ex6X6auTqSqXQHGjBhqn97iB+AO9fOU=;
 b=PNEUYCVErxBYa1GZDjVQw88HDeKQmGN2BTigt+6j2SeQyjxiCY1p9U43Grv/xLq1DkkrNmJFlfDNiIlMjHOPgOJdh8Sw8CfB12Lk2sATuQB1EKby/CmDCoWk+wk0wEhNbigxjVOFP4e9kAfOUoIsn2Zcqco+1hrvlSIaAKaeQXvMwmOKaU/9m5ORUOPWm+Ieptd/XBZ+cWeF3pTKlkvpYPqeXtP55wx8WHP02CNHuARTQLjfm68xRWLr06V+ZGtme2oIbwBrkBAVRZPrUVdPhobxSMuFj4dqBpboBO0vjWlTIF9PQss7GMHDdxJ0N3EaInYr/oBUO6i8uv4wYI60/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaBtnMchK3C7ex6X6auTqSqXQHGjBhqn97iB+AO9fOU=;
 b=KGa3wZ6fsmVsfza8P2R6fAEeAOFc6T/oLFMOmjDQI9CuYKqb9/2+Lqa4U7CR7QjP9wjJiAYxBsE6reCZLNZ3tr7IldpklRcMdWeE/VUCC+NR/spbDIMqrVOFuLyXA3WPq6t4AIA3qo5h2EWM45AWkCv0DM4kB+dZLqYkvygq1LE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Index: AQHal7ZoS0Rs3weazUuhKfXitmlnMLF6RnOAgAAvzwCAAAIygIAAA5kAgAACj4A=
Date: Fri, 26 Apr 2024 12:41:21 +0000
Message-ID: <42E71B74-157D-4A4E-AA57-2A93BB3D0007@arm.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
 <A0908DCC-6E15-406B-8E29-F241B6EA8BE1@arm.com>
 <CAHUa44ETaCY2pbUjMOW5T2NSpmRCq3sWMjLUbK0DC2jpQxHJRQ@mail.gmail.com>
 <3A576E95-454B-4C66-A164-A2871DB4E2B2@arm.com>
 <CAHUa44EC_H7Q_A2M63dZnEGGNanyjGM6m2MuBg4_6BNEO-XDKA@mail.gmail.com>
In-Reply-To:
 <CAHUa44EC_H7Q_A2M63dZnEGGNanyjGM6m2MuBg4_6BNEO-XDKA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DBBPR08MB6297:EE_|DU6PEPF00009524:EE_|GVXPR08MB10573:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd8b141-5c31-4118-c372-08dc65ee33f9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Q2ZqWmo0RWRYekpiQXJCelpzN0FWRUhsSHJzM1EyTlNKRUNibkY4WTdud2ZH?=
 =?utf-8?B?Q3RxWDQvcmR6YXZCNTNuWGpLdGxPOEE5OHR3ZXNRUE1jWnh0R2svWkpzUnZu?=
 =?utf-8?B?UmREb0JTSzFKUUo3eWdwcWdKbktjNUh0aXpuRXd2WWR1L0gzY09sUEo3eXZI?=
 =?utf-8?B?eStmUmNTczBBQ1pkbkRJYS9OMFVCK001MkNqeDNNVGNGTUNBZ0lCcWhoTGg3?=
 =?utf-8?B?RzdtZE9yekthM2N0U2E5cXozbmZJNkhBVGJkQkVtV1g0alQ0VXFZeGMxNDhD?=
 =?utf-8?B?VmEzRk5jYTNDdTNNOUQrQXBYUEpiazRYV00rM1NZdVB0YU52M2p6eW83bGpT?=
 =?utf-8?B?WFdpZXFobHZFM3E5QTdCaDBmUENKTjNzOXhzNm5rSWlVNDl6YTROUjRJVVJq?=
 =?utf-8?B?d0xpQnlPaXpQV1FEZWpnUEJtWDErdlEvZkxoUjdCSkowTXdEYTVTeFcvejhF?=
 =?utf-8?B?Q0E3ejBnbk1yOHliUHhpaDNkNUZad01hU1dWWmhTdzJIU2p6OWlnczdheGVS?=
 =?utf-8?B?M01selpPN2ZzMk5sMlJnTFc2NlFNSTJlcXdKR21KSWtwbFlmMjBORFlCaXJs?=
 =?utf-8?B?UmM4VFIvM0J4L0RGV0FSUVZkb2ZnM01qa1VSSGZnVXFBa2xuN1EvaHpkZ1g2?=
 =?utf-8?B?SkxXVDhnQkxvZmw2VGRoWHNoUHdVUEYvR3N0MnUwV1gwL3gyczI2SGltTEls?=
 =?utf-8?B?TURVRHI0cTc2Z3BvcVJEQ2ltWWJNRDVpcjhjZjV6b1p5R0ZrZmtHczFzSEFS?=
 =?utf-8?B?RmRkVHF3emE1ZWNjZDdvQ1pJWlNMVkNNRmpVUStjakNCMHF3WnhkMnppZS9V?=
 =?utf-8?B?UHRMbC92aUlXWjkyZkNUSFB0ZjlXSytBdldMR2RoN2szU2NCelp0WWczcGJ4?=
 =?utf-8?B?MjA5WVV5NkF3TkhLRGJxalRZamZ1YkY4UTdWdGpybUxFVUM1c2E5eWNidm5I?=
 =?utf-8?B?c2hhejlEdUY1TU5EUms0REgxUTBFOGdhQnM0eHFqQ2VIdkFqM1U1QnVOVG5k?=
 =?utf-8?B?U0lNcHJwQ2hONFRrd3NFOEVBRnNaODh5alZ0SWQ4RkhoQkRvMFI3ZVBvUksr?=
 =?utf-8?B?UkNMeGtocUxOc0c1bVlCNC9rTGJWcC9FWnNmcXl6dGRQRTdhS1dseFlSNFo5?=
 =?utf-8?B?dERrbHVsS1NrRnUybWJrdVF1M2FUTU1GYUFZL1EyRitUa3ZiblZlblEvSEh0?=
 =?utf-8?B?MktYUm1aRWU1SEErZnNoYzZpalZpTjFNa3IwL24wVFFhamNBMXZBWGFPOXlU?=
 =?utf-8?B?NGdpNGIvWTZ0cUVIaTFTZFdSZzY2MlA4OTlYYitZaUpCcG5HMGRiZTZaVmFL?=
 =?utf-8?B?eTNGek4veFFJVTBLcEg5em84TkVkcmM1a0dxRjBKQW1hYlFtUVVTUEF3MHcy?=
 =?utf-8?B?R3FFQjlOTitxVnJlVjZFZDBnYUlnZndSTVBMQnB5b250VXB0QnY1d2ZyZDI2?=
 =?utf-8?B?L3g0QlBrcTgwWTBWamgzZnFqTFpzOWU4WUVuNWlYSUJjbFF3MVJGQ3ZRVGpR?=
 =?utf-8?B?dDBMalBWNXBidklGNnRSRElQRXlzUVRobDFTay9rU1FlbGxJd1hKMFpYV2c1?=
 =?utf-8?B?NG9nVElWb1NFWVJwOWdJcEtSWDBDU3NtckpCbGV3c2d3b3JFa290SXRONkVr?=
 =?utf-8?B?U0hJWUJMOGRvZlo4MkIyd2Q3NDRMdFpPKzVaVXp0cXVNcFVxY0I5RDNoZU9G?=
 =?utf-8?B?R2NxelZWY20rbk9xb0l4alVvS2xSSGhoKytqbnBtTXp6Z2xJdDc0Q3hiOXkw?=
 =?utf-8?B?UzJOWGdjSE9xZnVMbG5GRW5tWEkwZXp1V0tkOXJsdVpvOFAyeUc2cExIaWwy?=
 =?utf-8?B?NFhKTVRjdWdSalVHOWhuQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8408C75789AFF4F9A5BA9047FFE9FE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63abf8aa-b521-4153-1d6f-08dc65ee2d3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk4vbzQvV0VQNnVIMm4rdWZ4WDBPQkM4VWtZMHp4NmR5anpQaTUrMGNnUGsr?=
 =?utf-8?B?OC9IVTNKTlIvYi9TNnVyaEhpK3lqZDVjcWY2cFpVQmlpUEluYzZaUU9jQ0pR?=
 =?utf-8?B?NnJVM0RhT081dW9md0c0aFM2Qkw2RkloTUZ6RWFybW95encvNWZhS3NKSll4?=
 =?utf-8?B?eitUQ2NzOUVKVUtjQmRVb2w1ZEEwNmNlTHFlYkhLbzFoZ1I0RWJVM1IwOGxq?=
 =?utf-8?B?dXhUSW9sREtDRVlIZUF5REhoOHg1V1o2c01XZGlrS0k0UWtySHU0eFZJaVNl?=
 =?utf-8?B?MWc0SXdjUDE5WGFEelV3N25OcTYwaHlSTzkveGRZK0xxTkJmNWI5MTdaL2sw?=
 =?utf-8?B?M1VtZnc5eks1SCtxQW1RVnIxTzlYb0FpRHFZRXZXMHZVNm9POElmNjNnZVhr?=
 =?utf-8?B?aGg1ellwQi90QUduaUlYOWtsNjR0S0oxdk9iWE1Idk5GQ2pldlBGNWJRanJh?=
 =?utf-8?B?Rkx4elRGcFplR0I0R2VneGkwdTM1UUJSWWtYTTdEajgyZW5iMkc0UlZzdm5V?=
 =?utf-8?B?bTJ1Qk50KzY3UGFmZEVNcWNUZGJ4MG1GVUR2R3R5Vm5RTUxOZ2NvZ2FLUHJw?=
 =?utf-8?B?enlobG5uZk5ZYzdNV1FQY3MzeXNtdDQ5REc0NHNqbCtRMHZDYmdVb1NIa2hI?=
 =?utf-8?B?OUhza2dzQVRLcUVKOVY4VDVaWEpaRHVnc0ZvdVhqUFRESU03NHExcm1ZVXVm?=
 =?utf-8?B?RVBqRmEzTW1KN1MyY1ZFZ1o5V0NrTTl6U3FwbzBXZm9ZOTFuZ3F6Nm8yVmV2?=
 =?utf-8?B?RVYrTTVuL0d1TllIMXZwekpPY0pGLzBuclZrRVNmaGVBMTN5S0FUMUlSNFY0?=
 =?utf-8?B?ODd1djJVWjlWU3BsdFM3L1dBcDJZYXRNbk5JcmxYd1ArQXhXSDFaSkFMckN1?=
 =?utf-8?B?Skw0NU1nRkhzSlZDZ3lvSjBDYkZDZkpjMW9zc0VMeGgwNm5nTXczWGpYZFM4?=
 =?utf-8?B?ZzA1d1U1SjVLMzZWdm1wNGl0UDgxTTFrVmc3RzR0eWZ2a1ZWVVpycmRSb2dO?=
 =?utf-8?B?ZXVRdkI0MWIxSytUV2tIR2trMm9sN0crTGZXWXR3TWlDM3kycGRxeURlRWVE?=
 =?utf-8?B?ZDF4WnFPdThabndBLzkvRTdBUnJiSDVGd1FmMnhhdzBIa3Q3ZHk1N2NRUEpX?=
 =?utf-8?B?UkVyNXhMVktDYmx4MjJEVmpZcFA4emV6M2M2OUFqMFJmRnNQNjRFY3gxbkpL?=
 =?utf-8?B?YmRLdGExQmtoWThMeGw0aHNnU1kzV05WVXdQS0NUVHlyYTdTa0FyL0plTmlY?=
 =?utf-8?B?YlJDbm1OOVNZWHRINmVneldweTZuRVQyRVpOS1BoUEd5UURTeXJrSStmcWFE?=
 =?utf-8?B?dFhnaE9BSGx4YWg5WUtGOXU3UDAzVkJIRlc4ZFlia2ZFS3dPNDJsMWVnTGJs?=
 =?utf-8?B?RTQ3c0FZQjlPcW1TZkpkejBBSEpjNUM1NVVCQVR5K2NUaFlLV1huajM4YXRS?=
 =?utf-8?B?SGhwRElhYkhtZTkwZ3ZHbndkN2h0V0JZR1ZMV2dhdGdiaFNtcGV5aldwMWlG?=
 =?utf-8?B?ZXBsZC8vT0tUYXNIeWQ2cmt5dG1wTUthNlJGeTNxOTRDVjZCNU5TVE15M2J0?=
 =?utf-8?B?TDdsMi9SaEVGMHplVk55NTNrdFdydnlxbERFZXlDSndMTys4Y1hraUtDT2VJ?=
 =?utf-8?B?d0wweU5GUDV3ejgwTWVBb09RNnI1QkFUdXhDVW1XZE1CUFhBMTQ2R3g4b3lS?=
 =?utf-8?B?bU0wS1g4NW5rbHVVempkOEdnb1BNQXk5VWRuOGFtcDMzWUhxN0lvZXVhMitX?=
 =?utf-8?B?bkJjaVd3aC9McXpEb3pLc09QblQ5azNSdW1MeTlSY01tUWxSQUlqam5BdXJa?=
 =?utf-8?B?U0k1cUF0dk9oMnBLNkNZTGorV1RoZjgvQy9mdXRKRXpIUW05eTlkdlZuMWRz?=
 =?utf-8?Q?341Y8TS/nW8y/?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 12:41:32.8239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd8b141-5c31-4118-c372-08dc65ee33f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10573

SGkgSmVucywNCg0KPiBPbiAyNiBBcHIgMjAyNCwgYXQgMTQ6MzIsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMjoxOeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEhpIEplbnMsDQo+PiAN
Cj4+PiBPbiAyNiBBcHIgMjAyNCwgYXQgMTQ6MTEsIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xh
bmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+
PiBPbiBGcmksIEFwciAyNiwgMjAyNCBhdCAxMToyMOKAr0FNIEJlcnRyYW5kIE1hcnF1aXMNCj4+
PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIEplbnMs
DQo+Pj4+IA0KPj4+Pj4gT24gMjYgQXByIDIwMjQsIGF0IDEwOjQ3LCBKZW5zIFdpa2xhbmRlciA8
amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4gWy4uLl0NCj4+Pj4+
ICtzdHJ1Y3Qgbm90aWZfaXJxX2luZm8gew0KPj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgaXJxOw0K
Pj4+Pj4gKyAgICBpbnQgcmV0Ow0KPj4+Pj4gKyAgICBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rpb247
DQo+Pj4+PiArfTsNCj4+Pj4+ICsNCj4+Pj4+ICtzdGF0aWMgdm9pZCBub3RpZl9pcnFfZW5hYmxl
KHZvaWQgKmluZm8pDQo+Pj4+PiArew0KPj4+Pj4gKyAgICBzdHJ1Y3Qgbm90aWZfaXJxX2luZm8g
KmlycV9pbmZvID0gaW5mbzsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgaXJxX2luZm8tPnJldCA9IHNl
dHVwX2lycShpcnFfaW5mby0+aXJxLCAwLCBpcnFfaW5mby0+YWN0aW9uKTsNCj4+Pj4+ICsgICAg
aWYgKCBpcnFfaW5mby0+cmV0ICkNCj4+Pj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJm
ZmE6IHJlcXVlc3RfaXJxIGlycSAldSBmYWlsZWQ6IGVycm9yICVkXG4iLA0KPj4+Pj4gKyAgICAg
ICAgICAgICAgIGlycV9pbmZvLT5pcnEsIGlycV9pbmZvLT5yZXQpOw0KPj4+Pj4gK30NCj4+Pj4+
ICsNCj4+Pj4+ICt2b2lkIGZmYV9ub3RpZl9pbml0KHZvaWQpDQo+Pj4+PiArew0KPj4+Pj4gKyAg
ICBjb25zdCBzdHJ1Y3QgYXJtX3NtY2NjXzFfMl9yZWdzIGFyZyA9IHsNCj4+Pj4+ICsgICAgICAg
IC5hMCA9IEZGQV9GRUFUVVJFUywNCj4+Pj4+ICsgICAgICAgIC5hMSA9IEZGQV9GRUFUVVJFX1ND
SEVEVUxFX1JFQ1ZfSU5UUiwNCj4+Pj4+ICsgICAgfTsNCj4+Pj4+ICsgICAgc3RydWN0IG5vdGlm
X2lycV9pbmZvIGlycV9pbmZvID0geyB9Ow0KPj4+Pj4gKyAgICBzdHJ1Y3QgYXJtX3NtY2NjXzFf
Ml9yZWdzIHJlc3A7DQo+Pj4+PiArICAgIHVuc2lnbmVkIGludCBjcHU7DQo+Pj4+PiArDQo+Pj4+
PiArICAgIGFybV9zbWNjY18xXzJfc21jKCZhcmcsICZyZXNwKTsNCj4+Pj4+ICsgICAgaWYgKCBy
ZXNwLmEwICE9IEZGQV9TVUNDRVNTXzMyICkNCj4+Pj4+ICsgICAgICAgIHJldHVybjsNCj4+Pj4+
ICsNCj4+Pj4+ICsgICAgaXJxX2luZm8uaXJxID0gcmVzcC5hMjsNCj4+Pj4+ICsgICAgaWYgKCBp
cnFfaW5mby5pcnEgPCBHSUNfU0dJX1NUQVRJQ19NQVggfHwgaXJxX2luZm8uaXJxID49IE5SX0dJ
Q19TR0kgKQ0KPj4+Pj4gKyAgICB7DQo+Pj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAi
ZmZhOiBub3RpZmljYXRpb24gaW5pdGlhbGl6YXRpb24gZmFpbGVkOiBjb25mbGljdGluZyBTR0kg
JXVcbiIsDQo+Pj4+PiArICAgICAgICAgICAgICAgaXJxX2luZm8uaXJxKTsNCj4+Pj4+ICsgICAg
ICAgIHJldHVybjsNCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAvKg0KPj4+Pj4g
KyAgICAgKiBTR0lzIGFyZSBwZXItQ1BVIHNvIHdlIG11c3QgZW5hYmxlIHRoZSBJUlEgb24gZWFj
aCBDUFUuIFdlIHVzZSBhbg0KPj4+Pj4gKyAgICAgKiBJUEkgdG8gY2FsbCBub3RpZl9pcnFfZW5h
YmxlKCkgb24gZWFjaCBDUFUgaW5jbHVkaW5nIHRoZSBjdXJyZW50DQo+Pj4+PiArICAgICAqIENQ
VS4gVGhlIHN0cnVjdCBpcnFhY3Rpb24gaXMgcHJlYWxsb2NhdGVkIHNpbmNlIHdlIGNhbid0IGFs
bG9jYXRlDQo+Pj4+PiArICAgICAqIG1lbW9yeSB3aGlsZSBpbiBpbnRlcnJ1cHQgY29udGV4dC4N
Cj4+Pj4+ICsgICAgICovDQo+Pj4+PiArICAgIGZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQ0KPj4+
Pj4gKyAgICB7DQo+Pj4+PiArICAgICAgICBpcnFfaW5mby5hY3Rpb24gPSB4bWFsbG9jKHN0cnVj
dCBpcnFhY3Rpb24pOw0KPj4+PiANCj4+Pj4gWW91IGFsbG9jYXRlIG9uZSBhY3Rpb24gcGVyIGNw
dSBidXQgeW91IGhhdmUgb25seSBvbmUgYWN0aW9uIHBvaW50ZXIgaW4geW91ciBzdHJ1Y3R1cmUN
Cj4+Pj4gd2hpY2ggbWVhbnMgeW91IHdpbGwgb3ZlcmxvYWQgdGhlIHByZXZpb3VzbHkgYWxsb2Nh
dGVkIG9uZSBhbmQgbG9zZSB0cmFjay4NCj4+Pj4gDQo+Pj4+IFlvdSBzaG91bGQgaGF2ZSBhIHRh
YmxlIG9mIGFjdGlvbnMgaW4geW91ciBzdHJ1Y3R1cmUgaW5zdGVhZCB1bmxlc3Mgb25lIGFjdGlv
biBpcw0KPj4+PiBlbm91Z2ggYW5kIGNhbiBiZSByZXVzZWQgb24gYWxsIGNwdXMgYW5kIGluIHRo
aXMgY2FzZSB5b3Ugc2hvdWxkIG1vdmUgb3V0IG9mDQo+Pj4+IHlvdXIgbG9vcCB0aGUgYWxsb2Nh
dGlvbiBwYXJ0Lg0KPj4+IA0KPj4+IFRoYXQgc2hvdWxkbid0IGJlIG5lZWRlZCBiZWNhdXNlIHRo
aXMgaXMgZG9uZSBpbiBzZXF1ZW5jZSBvbmx5IG9uZSBDUFUNCj4+PiBhdCBhIHRpbWUuDQo+PiAN
Cj4+IFNvcnJ5IGkgZG8gbm90IHVuZGVyc3RhbmQgaGVyZS4NCj4+IFlvdSBoYXZlIGEgbG9vcCBv
dmVyIGVhY2ggb25saW5lIGNwdSBhbmQgb24gZWFjaCBsb29wIHlvdSBhcmUgYXNzaWduaW5nDQo+
PiBpcnFfaW5mby5hY3Rpb24gd2l0aCBhIG5ld2x5IGFsbG9jYXRlZCBzdHJ1Y3QgaXJxYWN0aW9u
IHNvIHlvdSBhcmUgaW4gcHJhY3RpY2UNCj4+IG92ZXJsb2FkaW5nIG9uIGNwdSAyIHRoZSBhY3Rp
b24gdGhhdCB3YXMgYWxsb2NhdGVkIGZvciBjcHUgMS4NCj4+IA0KPj4gV2hhdCBkbyB5b3UgbWVh
biBieSBzZXF1ZW5jZSBoZXJlID8NCj4+IA0KPiANCj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0
IGZvcl9lYWNoX29ubGluZV9jcHUoY3B1KSBsb29wcyBvdmVyIGVhY2ggY3B1LA0KPiBvbmUgYXQg
YSB0aW1lLiBUaGUgY2FsbA0KPiBvbl9zZWxlY3RlZF9jcHVzKGNwdW1hc2tfb2YoY3B1KSwgbm90
aWZfaXJxX2VuYWJsZSwgJmlycV9pbmZvLCAxKTsNCj4gcmV0dXJucyBhZnRlciBub3RpZl9pcnFf
ZW5hYmxlKCkgaGFzIHJldHVybmVkIG9uIHRoZSBDUFUgaW4gcXVlc3Rpb24NCj4gdGhhbmtzIHRv
IHRoZSAiMSIgKHdhaXQpIHBhcmFtZXRlci4gU28gb25jZSBpdCBoYXMgcmV0dXJuZWQgJmlycV9p
bmZvDQo+IGlzbid0IHVzZWQgYnkgdGhlIG90aGVyIENQVSBhbnkgbG9uZ2VyIGFuZCB3ZSBjYW4g
YXNzaWduIGEgbmV3IHZhbHVlDQo+IHRvIGlycV9pbmZvLmFjdGlvbi4NCg0KUmlnaHQgc28geW91
IGxvb3NlIHRyYWNrIG9mIHdoYXQgd2FzIGFzc2lnbmVkIHNvIHlvdSBhcmUgbm90IGFibGUgdG8N
CmZyZWUgaXQuDQpJZiB0aGF0IGlzIHdhbnRlZCB0aGVuIHdoeSBzYXZpbmcgdGhpcyBpbiBpcnEu
YWN0aW9uIGFzIHlvdSB3aWxsIG9ubHkgaGF2ZQ0KdGhlcmUgdGhlIG9uZSBhbGxvY2F0ZWQgZm9y
IHRoZSBsYXN0IG9ubGluZSBjcHUuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gVGhhbmtz
LA0KPiBKZW5zDQoNCg0K

