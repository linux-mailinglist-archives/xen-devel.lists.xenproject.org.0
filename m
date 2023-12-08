Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19780A40C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 14:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650624.1016333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBaS1-00055q-7H; Fri, 08 Dec 2023 12:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650624.1016333; Fri, 08 Dec 2023 12:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBaS1-00053z-4S; Fri, 08 Dec 2023 12:59:29 +0000
Received: by outflank-mailman (input) for mailman id 650624;
 Fri, 08 Dec 2023 12:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBaRz-00053t-Kp
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 12:59:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d1d6c58-95c9-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 13:59:25 +0100 (CET)
Received: from AS9P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::13)
 by DB9PR08MB6380.eurprd08.prod.outlook.com (2603:10a6:10:256::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 12:59:22 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:532:cafe::31) by AS9P250CA0010.outlook.office365.com
 (2603:10a6:20b:532::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27 via Frontend
 Transport; Fri, 8 Dec 2023 12:59:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 12:59:21 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Fri, 08 Dec 2023 12:59:21 +0000
Received: from c65ecc65a0fe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BD784C2-76ED-480D-8097-5D3DFB7E24F9.1; 
 Fri, 08 Dec 2023 12:59:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c65ecc65a0fe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 12:59:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5908.eurprd08.prod.outlook.com (2603:10a6:20b:283::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 12:59:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 12:59:08 +0000
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
X-Inumbo-ID: 9d1d6c58-95c9-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PQJP/+sPQl+KAQzFEYbjTPBZ7GdD0n30QuBjRKp9tjdlhyuXe57OwnKzvzOIgjUCkg/dLNLINzns7o+1pa7JICIEhbtYoE8fHyfvdHlQ62Y23PgglDTsS6+/aolMSZCn4iL6ZpnYFQ/lhq0VpM/AIhF2wUZkHyTnH58vu68BLMlEptjsdpMMa7LQY5Gq0OT8VbI2I3K6WhDzCQi8bB1ja28WXUMiJ7Pbi+y7XgYahLKRwaOri3GnkGG4ZSkiZT+Cvla1CQuVhvc06KZ0PFlVoJgiT3ZmjzrSMv+A1EeZNaeZXRx1Zqel5ILB/6Xf9MLTa9BW123FSoY7JhsrIFx7tA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghaz2hCu0+d+DNZFyq5RO+pXkikfYO5bwzkD+cUIKSs=;
 b=XhNeQ1mKMOXvsXO90A1hfwqQ0FSBChs1N3DYkv0XLxNylEoi5wT1TK1HxRhwkbgyENaJxoOPkjOwiRktLbM0ArOHA3y70JRdySD1/BKCfi8+zEOiPD2DoQizcesPL/RZ8xkc09llAprHqHdwt4+DPtajpelZSS2nE8gh3L6qJmSBk9iZLI2EEm+fXbBz194CxIrteEY4seK8Ok19px0fGgSUl9dZifAOvYtqjSf4rEuZ2RyM6o8XPcRqvrpQXwWiFUaNKzGylS61Np/M3Gu4PRR5QtJTi8XB/HGQLxIyiot77Vcp01e9qpx4vs6nTmPJUG4Wsvc3OZYdgXF7C/NFLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ghaz2hCu0+d+DNZFyq5RO+pXkikfYO5bwzkD+cUIKSs=;
 b=Imq3YI/gGSvxl3/dx+kq4CASYwV8Cwk2rNDlP3b3rfjg5hIvHsoMTvYdkpWkQsuyL4qVy+GQB+Dh2l6Zh0mI01UdpwBshBC4BRUywzj44TwSNIFm3wPVMiJxQm4Nh1husKfxZqgridv09IBV9S5z0vNfl/LDEr5LsUuoz0Bb1Hs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0973385fabec46f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm0hiDAOj70ObA7q2zSOME+JgssfNbFFEffKgWdoG9iDL6L69c6r511RYcGu7fHerxXK/ZoToJrX+qhTwSmRc7kP8IEvojMVvqj0cbdrWGrIgnPUkNeUovnkVXkw7Na7gQmk4jO4zTL81232XE3wnMTU9Q8rbc/hLcCCLrJ6QzVYUJG+/T+nGR8pTdVrbllwsjwmKbInYZVQfITvdVcWSD25q0aGBbqi2tsllfeJh6lwAT61fJXGJl1DlKfviEo1AxA2FEUKI2CzJSCRan63O5hQcAhxOfRbhO9Z29B9uuwyKuQlxmIlYjcjkabPYzGAW1Fzixvly5eyO+8NnhbFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghaz2hCu0+d+DNZFyq5RO+pXkikfYO5bwzkD+cUIKSs=;
 b=dfMwDEVjx6Vk3GZaGUc2rKEG0j29KAiCiys1yMYdsHD1yMDaEu86Tr1VrKPz+DpSD6eGTHi9eq2jn/l9XxoayDFkba+nayFq7Fxz6758s1hC3ZOy+vqeKxdhzWYcZqMSHCsYXtVkyQDpdOFKe+jzvi5Q8peua3cFRKayoi+pO2/5zxRc7ozpYdGakul+BkdGQOKzybOqmtDGN4Uy7FghqKsZjbxvni5JKYxxMqddbGnnmoKGQkd9tuGYaCb1RXnN03HARK9joDtIQ+y4+RzfBKVEIjGBX4GDmGpahN9LkYEa1pBKPhzmoZiI6pbST/KTcNtVXHCpncTpXJYWWAyEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ghaz2hCu0+d+DNZFyq5RO+pXkikfYO5bwzkD+cUIKSs=;
 b=Imq3YI/gGSvxl3/dx+kq4CASYwV8Cwk2rNDlP3b3rfjg5hIvHsoMTvYdkpWkQsuyL4qVy+GQB+Dh2l6Zh0mI01UdpwBshBC4BRUywzj44TwSNIFm3wPVMiJxQm4Nh1husKfxZqgridv09IBV9S5z0vNfl/LDEr5LsUuoz0Bb1Hs=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal
 Orzel <michal.orzel@amd.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v2 1/5] automation: Add a Dockerfile for running FVP_Base
 jobs
Thread-Topic: [PATCH v2 1/5] automation: Add a Dockerfile for running FVP_Base
 jobs
Thread-Index: AQHaKZn45o1GTQZ/qUu1MgNMYGRTZLCfUZCAgAAH1gA=
Date: Fri, 8 Dec 2023 12:59:07 +0000
Message-ID: <239318A5-BBE7-495A-8BA6-1DBA75FDBE46@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-2-Henry.Wang@arm.com>
 <9978c881-9d1a-4554-b0f8-577a1cf6fc35@xen.org>
In-Reply-To: <9978c881-9d1a-4554-b0f8-577a1cf6fc35@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB5908:EE_|AMS0EPF0000019F:EE_|DB9PR08MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7b45e8-8a78-4397-d945-08dbf7ed7f67
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0zA5JbD8XsslzJFbQPE/skqMkN0Xp8wMXHUryfiynng+SVwwOIXoHy3g3uzcAQ3++Ix2PVFGg9S8jxntwz50TOmtoJ/MVmK4qzy6csSiFV3ROEH4QbEIASq8j/QLenTaDTc4/zjg48Uc3WjBxixBN/Y8PHvO5CNwcE/Ievud5diq0yBRKz+p7JK3rUW/BIuno4+ncAcvIk9Uerm9zNNZsY85hWdlxXRtWKxtgm03Fz23lH/5OSGcpzGi+L1C88I/cy5sG1VYpuVAAMlYBMFSb6KaRqp/L7y18QUS+TX8bj/co8JLvsx9SzEYUKrEM6y9FIOGgj3DcKBvXHHXLxwS6lIchW4sczeSXUAxtHvYDBSwJOJ2yfF47krDCSLP6Tnwy/1KY+OrwNu6SBeCAQWk+Oxo6KZuVW9ZXaDf6Ge5m9WZHAwZb33wC++t2KF64ZCILF2tXSzd59EItnMibry3ewaeA3wgktPYi3lwhUA4yDdgyF3pJCymnaSH0RhUWf/a9sLBw+q5+k9hBuiiWtTirJmLmM1bvmXYDWhuLp2o+jNSGjcm/wb57uTF9ayLOkxxr+cTjgXBKrzRfW1F3bgS+dmdHrl4H1XEiKeROKXsgrBEvz03XxReFOPhDK0zZ+RZ1Z3ky/vnClpd8nfD4dBaiYxxPnhS0nvryK1TXFd1gRESq9KfJjUfkEL6z/f8t7nh
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(478600001)(2906002)(5660300002)(41300700001)(86362001)(33656002)(36756003)(122000001)(38100700002)(2616005)(26005)(6506007)(6512007)(6486002)(4326008)(71200400001)(966005)(8936002)(8676002)(83380400001)(54906003)(76116006)(316002)(64756008)(66556008)(91956017)(66946007)(6916009)(66476007)(66446008)(53546011)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <72B1523CC4C03147B5295074C0099D8E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5908
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e08e23a-46f7-4521-90f2-08dbf7ed7714
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Y2HeETT0TH/IBQ6vcFUdhwFw1TEf4w0RYNeSz1D+UzMedA1rDWtPFK20QiZ3+f7itG85u8SiGkC372ZLIVyL2j6/DiS+N5eWs2xBPCkD2sN7xRIa85EzxoNeq6wDCaj63GSyAVK3hlaFUIB1FfNIQoYOb68NJYq6YxLM/MVbNVb5JRzbvdLRV4CV5foKtKoeAvloTJ7xLPx4JW0j5rCYlKpMIdcfYzswOV/H089K+60wbsxjamAnij8LDa8lZCvxWRAeWjSce9WDHyC0tnwx1xP0isuJf17Fr5RXggdMy/X3Y25TqG28gY88wL6D8QKRySNj0qkTEkCj+zjxu1RUAW7tm17+32cWbKlvXgfBPGy3d08FKbV1olFRJYyp3sK3KKzwm/yVKhaaRHWjzeE3b2GeUrrZf8xse/DljGZP0JDgDaIG5UvQMDquJv7IgbmiP3z503VU6QnS/t1bZoL+oB5w+Xr4CTlzzQXeKeIrjZV0HrP1tULCqRXU1AgdnlnOxpiiA8o8NNqNE3keBS5gB5X+3ledDHJXHjzL4dxD6oecOsz1HXC2Bh0dXAzIAyacliexZ5006UWaXcPwh1pj51/rDCzQXnmuyeLvzaf+3K2I41Ocb2tnLo3CBLJXOCCemtqltCc60emAHrulUiSdiUaucJrl5wDLDiGyRwIEK+VeVHAxBa6ltmAF7b0revxqZCceAPMXjdXiaLCBRv5ipwhdDU0Tyq2rKpqwvYMJ2O5rsmXCQqtApCXJRtuznvntq5XgqZ4ZmuTQ+NuuvahQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(6862004)(4326008)(8936002)(8676002)(36756003)(86362001)(41300700001)(82740400003)(356005)(40460700003)(81166007)(83380400001)(40480700001)(336012)(2616005)(47076005)(6512007)(26005)(36860700001)(70206006)(70586007)(54906003)(316002)(53546011)(6506007)(33656002)(966005)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 12:59:21.9254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7b45e8-8a78-4397-d945-08dbf7ed7f67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6380

SGkgSnVsaWVuLA0KDQo+IE9uIERlYyA4LCAyMDIzLCBhdCAyMDozMCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDA4LzEyLzIwMjMgMDU6
NDYsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiBGaXhlZCBWaXJ0dWFsIFBsYXRmb3JtcyAoRlZQcykg
YXJlIGNvbXBsZXRlIHNpbXVsYXRpb25zIG9mIGFuIEFybQ0KPj4gc3lzdGVtLCBpbmNsdWRpbmcg
cHJvY2Vzc29yLCBtZW1vcnkgYW5kIHBlcmlwaGVyYWxzLiBUaGVzZSBhcmUgc2V0DQo+PiBvdXQg
aW4gYSAicHJvZ3JhbW1lcidzIHZpZXciLCB3aGljaCBnaXZlcyBwcm9ncmFtbWVycyBhIGNvbXBy
ZWhlbnNpdmUNCj4+IG1vZGVsIG9uIHdoaWNoIHRvIGJ1aWxkIGFuZCB0ZXN0IHNvZnR3YXJlLiBG
VlAgY2FuIGJlIGNvbmZpZ3VyZWQgdG8NCj4+IGRpZmZlcmVudCBzZXR1cHMgYnkgaXRzIGNtZGxp
bmUgcGFyYW1ldGVycywgYW5kIGhlbmNlIGhhdmluZyB0aGUgRlZQDQo+PiBpbiBDSSB3aWxsIHBy
b3ZpZGUgdXMgd2l0aCB0aGUgZmxleGliaWxpdHkgdG8gdGVzdCBBcm0gZmVhdHVyZXMgYW5kDQo+
PiBzZXR1cHMgdGhhdCB3ZSBmaW5kIGRpZmZpY3VsdCB0byB1c2UgcmVhbCBoYXJkd2FyZSBvciBl
bXVsYXRvcnMuDQo+PiBUaGlzIGNvbW1pdCBhZGRzIGEgRG9ja2VyZmlsZSBmb3IgdGhlIG5ldyBh
cm02NHY4IGNvbnRhaW5lciB3aXRoDQo+PiBGVlAgaW5zdGFsbGVkLCBiYXNlZCBvbiB0aGUgZGVi
aWFuIGJvb2t3b3JtLWFybTY0djggaW1hZ2UuIFRoaXMNCj4+IGNvbnRhaW5lciB3aWxsIGJlIHVz
ZWQgdG8gcnVuIHRoZSBGVlAgdGVzdCBqb2JzLiBDb21wYXJlZCB0byB0aGUNCj4+IGRlYmlhbiBi
b29rd29ybS1hcm02NHY4IGltYWdlLCB0aGUgcGFja2FnZXMgaW4gdGhlIG5ld2x5IGFkZGVkIEZW
UA0KPj4gY29udGFpbmVyIGRvZXMgbm90IGNvbnRhaW4gdGhlIGB1LWJvb3QtcWVtdWAsIGFuZCBh
ZGRzIHRoZSBgZXhwZWN0YA0KPj4gdG8gcnVuIGV4cGVjdCBzY3JpcHRzIGludHJvZHVjZWQgYnkg
Zm9sbG93aW5nIGNvbW1pdHMsIGB0ZWxuZXRgIHRvDQo+PiBjb25uZWN0IHRvIEZWUCwgYW5kIGB0
ZnRwZC1ocGFgIHRvIHByb3ZpZGUgdGhlIFRGVFAgc2VydmljZSBmb3INCj4+IHRoZSBGVlAuDQo+
PiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+PiBSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4g
LS0tDQo+PiB2MjoNCj4+IC0gQWRkIFN0ZWZhbm8ncyBSZXZpZXdlZC1ieSB0YWcuDQo+PiAtLS0N
Cj4+ICsNCj4+ICtSVU4gd2dldCBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vbWVkaWEvRmls
ZXMvZG93bmxvYWRzL2Vjb3N5c3RlbS1tb2RlbHMvRlZQX0Jhc2VfUmV2Qy0yeEFFTXZBXyR7RlZQ
X0JBU0VfVkVSU0lPTn0udGd6ICYmIFwNCj4gDQo+IEkgdmFndWVseSByZWNhbGwgc29tZSBkaXNj
dXNzaW9ucyBvbiB3aGV0aGVyIGl0IHdhcyBvayBmb3IgdXMgdG8gcHVibGlzaCBhIGNvbnRhaW5l
ciB3aXRoIHRoZSBGVlAgbW9kZWwgZHVlIHRvIHRoZSBsaWNlbnNlIGFncmVlbWVudC4NCj4gDQo+
IEkgZ3Vlc3MgdGhpcyBoYXMgbm93IGJlZW4gcmVzb2x2ZWQgYmVjYXVzZSB0aGUgZG93bmxvYWQg
Y2FuIGJlIGRvbmUgd2l0aG91dCBzaWduLWluIHRvIHRoZSBhY2NvdW50LiBDYW4geW91IGNvbmZp
cm0/DQoNClllcywgcXVvdGluZyBzb21lIHdvcmRzIGZyb20gdGhlIHBlb3BsZSB3ZSBhc2tlZCBp
bnRlcm5hbGx5Og0KKHRoZSBwYWdlIHJlZmVycmVkIHRvIGlzIGh0dHBzOi8vZGV2ZWxvcGVyLmFy
bS5jb20vVG9vbHMlMjBhbmQlMjBTb2Z0d2FyZS9GaXhlZCUyMFZpcnR1YWwlMjBQbGF0Zm9ybXMp
Og0KDQoiQWxsIHRoZSBGVlBzIHJlZmVyZW5jZWQgb24gdGhpcyBwYWdlIHRoYXQgeW91IGFyZSBp
bnRlcmVzdGVkIGluIGFyZSBsaWNlbnNlZCB1bmRlcg0KbGlnaHR3ZWlnaHQgRWNvIFN5c3RlbSBF
VUxBIHRoYXQgaGFzIG5vIHJlc3RyaWN0aW9ucyBvbiB0aGUgcmVkaXN0cmlidXRpb24u4oCdDQoN
CiJTbywgeWVzLCB3ZSBjYW4gc2hpcCBjb250YWluZXIgaW1hZ2VzIGNvbnRhaW5pbmcgdGhlIEZW
UCBhbmQgdGhlIGxpY2Vuc2Ugb24gdGhlIEZWUCB3aWxsIHJlbWFpbiBhcyBpcy7igJ0NCg0KIk5v
IGlzc3VlcyB3aXRoIHJlZGlzdHJpYnV0aW5nIHRoZSBtb2RlbCBwYWNrYWdlIGluIGEgRG9ja2Vy
IGNvbnRhaW5lciwgYXMgbG9uZyBhcyB0aGUgRVVMQSBpbiBpbmNsdWRlZC4iDQoNCj4gSXQgd291
bGQgYWxzbyBiZSBnb29kIHRoYXQgdGhlIGNvbW1pdCBtZXNzYWdlIGluZGljYXRlcyB3aGV0aGVy
IHRoZXJlIGlzIGFueSBpbXBsaWNpdCBsaWNlbnNlIGFncmVlbWVudCBmcm9tIFhlbiBQcm9qZWN0
IChvciBhbnkgdXNlciB0aGF0IGRlY2lkZSB0byB1c2Ugb3VyIHNjcmlwdHMpLg0KDQpJIHRoaW5r
IGl0IGlzIHRoZSDigJxFTkQgVVNFUiBMSUNFTlNFIEFHUkVFTUVOVCBGT1IgQVJNIEVDT1NZU1RF
TSBNT0RFTFPigJ0/DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

