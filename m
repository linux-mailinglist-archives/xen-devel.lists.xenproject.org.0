Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CEA55B90E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356395.584600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lad-00074Z-SY; Mon, 27 Jun 2022 10:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356395.584600; Mon, 27 Jun 2022 10:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lad-000721-Op; Mon, 27 Jun 2022 10:03:31 +0000
Received: by outflank-mailman (input) for mailman id 356395;
 Mon, 27 Jun 2022 10:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nImS=XC=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o5lac-00071l-4P
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:03:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6444d3cc-f600-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 12:03:28 +0200 (CEST)
Received: from AS8PR04CA0198.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::23)
 by AM8PR08MB6436.eurprd08.prod.outlook.com (2603:10a6:20b:365::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 10:03:27 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::b5) by AS8PR04CA0198.outlook.office365.com
 (2603:10a6:20b:2f3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Mon, 27 Jun 2022 10:03:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 10:03:26 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Mon, 27 Jun 2022 10:03:26 +0000
Received: from eb22d8152005.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EEEDF57A-D528-4C0C-8DD4-113D25516E65.1; 
 Mon, 27 Jun 2022 10:03:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb22d8152005.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jun 2022 10:03:16 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB4833.eurprd08.prod.outlook.com (2603:10a6:20b:ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 10:03:15 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5373.017; Mon, 27 Jun 2022
 10:03:15 +0000
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
X-Inumbo-ID: 6444d3cc-f600-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XEhR42riBUexEutGUilceK7kL8yI1U3qOBbbVEhgoQqeC1YNQXwORez0GOyuxfv01/5An3eu8JpPr6sxcehi28/B22iRyps8wZ+pacVXU+S0objIudl+1N3HaWIVtVUxuIt6OsEJyEcsKiJ9rU5dHvrp06V2vBtQUwmP354LhrAMqvKH4fvyCE3ydV9cE/LaGwtXZjL5YTNveG4uKPD+7vXA0OhuMVfUMVHpAIDLNag50QcIDSaQClyUv5urmMMIpSehOrO8VZd+qHFvvp2M/zDu/Wp/Re2rTerGiJr5X4UEYqoIrMgm1ne8v4kl66HHdMp3gB1HFh3BZY52npgOmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMFCQLaap/xgdts+uNUPkcoHzsu6uULHjfoESVJScLo=;
 b=A/VwiT+6GgbaCt8w71y4AXoHaN0buZBLui+OAQphr1FmPgngAQML7Tq1CWB0TCGjoaK2lsEn9lFJpOQDOn72rFQXU9kDL+4LjdzyGOSVJ2vkmKQf41SYHUOR+ipsiKiSfop6aXlwey/meGlLFAsWt5avVVy+SHV7T7UxDwEqqkiZR3u0lH7sXqqjLnxc9wD7G8S+2D0KSe8F/ESJs3wscnfUKS7VupLvkWDf0enmj/FcxNxPKymORN+xMocymJc+w22GSrSVmuVTZM8dR81GM+ekgZNEcBuYOZRxaLumarILGaubd2FUWKPbNEA09+F1nf0uLEy6wR3TBV9AmeDPbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMFCQLaap/xgdts+uNUPkcoHzsu6uULHjfoESVJScLo=;
 b=1i9S6R/9EdiEPg9oVPU23E6RHLCeWWJBBCMcuaE6RsZzSZpF+Gpv3Wemknk2sq/6YNXDJuH7qoPXACpML7IalK7zm34uVRmOz6jDhSmBH2gVhwqPY7MtVZCO1KG+u46BENmWFfYGZew/7WoQvR7qxr32oE1+o7pE2B1sQNNvJtM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZEBIqxpd3UXRIu15tn7rlGEwf1Q/9P+9U/0XrOtl1dBc6uvZjgwjfMoNWFcVSpEZ+sh7U2ajdHhn6Q5axyhECsapLqwXGPPLKX2kM5S9SoQ97lXKEybFw+KrYZmRvHWuRMKIWYrPIsRWmqw8ovxEBwN0ygLp7sUPQiJwQ21pvS1oIOqldJySsOX84HTrsnWAe4w7QRziqGDMjg4nMF/lS6poh3Shb6sF5f6ZC4KOQugxXsWmrD5SLChrRO9pP4iac0FsCFgCIjtpc5JF89iBeTgbfJdwOU78IWD4hwMChg9WaUCCEXUsz0UN3SHUFUdQBZFpW5UgR+vqobbYuqMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMFCQLaap/xgdts+uNUPkcoHzsu6uULHjfoESVJScLo=;
 b=MfSIWNOkA/Z95IeYBf8cgV+P2oDsCD+PxZSVrKDCxlP42mMY3bsBvDFyk1xl2yde27Zx/FOcP/eAUH7RvrTEFYrRMJ3pvM2ZlQQiAfg9I+/Dmt/xCbFjK9WKkS4bBfBIZQRuGplxBmezD2U7V212jytGzigsEQprLvpfUvRaGLY4U+aYS3DddhoZzHNm/Yt6AtmZwCNxmzNS8AFCp09JYtDfAFMN85iTq3qep/ZQdKuXfOV0u5G8zFaq09YKhJUycSWtrD2SfdBuBokkqBW5/jh4VxL5P5mLXqlA7IZNc+E6USH6vnboeP+2xOCEKaesDDZ5QkIOgx+70G5ApKf3ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMFCQLaap/xgdts+uNUPkcoHzsu6uULHjfoESVJScLo=;
 b=1i9S6R/9EdiEPg9oVPU23E6RHLCeWWJBBCMcuaE6RsZzSZpF+Gpv3Wemknk2sq/6YNXDJuH7qoPXACpML7IalK7zm34uVRmOz6jDhSmBH2gVhwqPY7MtVZCO1KG+u46BENmWFfYGZew/7WoQvR7qxr32oE1+o7pE2B1sQNNvJtM=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYhE/FRuoXPvvK9EWAAAtCUPIrtq1bKxqAgAfcEEA=
Date: Mon, 27 Jun 2022 10:03:14 +0000
Message-ID:
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
In-Reply-To: <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C42310B009F8A2448FD4C22A67678224.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e4031950-7f34-42a7-c753-08da58244795
x-ms-traffictypediagnostic:
	AM6PR08MB4833:EE_|AM5EUR03FT006:EE_|AM8PR08MB6436:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y/Y/LtlmV4Gmjd2r+k4C78/nvvdYxyIywVL61s5WDkV2bbX4AhCz/Lf/RUE1HwITzl31FpmGHB0kxNSNcLe+nmuSMkYTWXWBUTEUon6s04/0DHKirGbdnctt5NTO5cmauUlvPufv89ooEa705o20+pc5m6R6A/6YtpUR2QifmfiXDAjuNdNDChM4fM5Q6celBL18Tgo3ggZSNNz6+DswgCXTCit19ax9Wz0xmAIJBkRKyBoaCEaLAvRCcycPkrTNLImaNs18z5bkT7DXPut7Ksw05cxjgcswLaFhWHBHoqGnrqP/rgyVf0OKAqzCCw7a56Q5Rkwth6s+KoxbFhTcvyDFydPmgLEAbbe3u2JFxhoV2rj0N1qYczy8b2l9MAFkrIvSf0XAuErPv+FLYVWinIeLzD1RV8ArQ3f8Ot/qrVIiuVVfr9HyXrL6zsonTzs85m5srebSwEUxitPiZVAujgIc/s+bHj+vx5BfguvpGY1BnvewbCyDT3jwNCTGJSEJ6d5jvsieK+H4F8UgDAxX3NTwZJm4jC7NIMIQuMQhu+xFLYR5Psv3yY33ucqotEbnq13wEpahB88dfhQWmeMS3uMZD2IZ0Bmyg6SO1TaIw9/zTDPTQefWRQeTR4BE8kGadLCmCcaaJclirs/smsF36PAkfWEBvnHVIztzCSuftoXV7IAxwkgYzSEi85uIvDDzo2YOynofFvMu03SGxZYN0Gjvm9xwM/hX5gHgzdhBWaqI9/YfF4NxXaXhtjc/71Qz8AiwI+rD3aY03ETwfDDlnDLbXdHY6AT/hEklLKHZSoc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(33656002)(52536014)(4326008)(5660300002)(8936002)(66946007)(86362001)(66556008)(122000001)(66446008)(64756008)(316002)(76116006)(38100700002)(2906002)(55016003)(71200400001)(41300700001)(7696005)(54906003)(9686003)(6506007)(66476007)(478600001)(6916009)(186003)(53546011)(26005)(83380400001)(8676002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4833
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6adef53-9eb4-4915-1a5d-08da58244079
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hkz5VNSKEDVmiNYBYCZxU0ddJp0JOgEAGhSfY2XLWIjBhgNzjp2e4SB1+QrDIzUSZ3oOduBFH3Ht44AQSi8Za1t6dp1HPoIptxXtKqNk0mPGxZw8OtNSeyEpyU23Wx3PQkH2r1P4monFwdQvXG05A5OXla/akV6RcTzAF89uVH372D6MQ1KXQx3WJQ8UM0H6wn11bmFjiuP3jOV+a1AdIMp2L20xcLwBG7HZ8S8k/DXGGUhEyjd4ee4Knr08UrDptvupwnr8gX2KSb8ak9Zls2twbvn7PIZfXmD4+g++IiWbwyDSFIRZag1OLjMr9MYIYsEKcH+oWzFvN0wzQhPMt2djt+V8rlZ9KQXv990xfgIKvkHpW7Q9U8f4E1OYAOxSavjvu/wOzuPqATHhGTM2mTkgArlXtEAe+F9GkUJkhvzLCmI8BC4nFvaRv9/6w4pKdh8W2KHS9+/EtiqcrqfBPtIQrp/DdmU6UZLepz7jMFnamGxZMQ/4yu2+sOe7NwNSN+fnkBmaiEmY1XEdY7QrVhtb/tp2/XPVDtaZgfyiMn/k2L5hVLpcl9c4BtJ0YLJ5UBvjjaegrQMoso+2AZSIeVb6a0Bx4aRGGo58hDb5ZZauiP1ZbgP9vhAFZVt7A0ga3hYSrd9sP7ohD0aQTgiXZBBCGNktEp1pqarcNiXPvka66CBuEDYPOANeLFqN4vjvheNCrbMfYMJzBHF44jjkmPIQNJWm1EhA82/d2wY78YJS/WKt9RxuNe/ou96Ry06HYAUOF3JrKP4hhRx/LXnpaVLPBKzQCO80Gj8whI93CWsK217XRqdA5vxWGhRtZcVE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(40470700004)(46966006)(36840700001)(47076005)(336012)(70586007)(86362001)(33656002)(186003)(4326008)(6862004)(41300700001)(8936002)(70206006)(7696005)(5660300002)(8676002)(26005)(316002)(9686003)(40480700001)(478600001)(6506007)(53546011)(54906003)(52536014)(55016003)(82310400005)(81166007)(2906002)(83380400001)(356005)(82740400003)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 10:03:26.8772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4031950-7f34-42a7-c753-08da58244795
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6436

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjIsIDIwMjIg
NToyNCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBX
ZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
Ow0KPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gV2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDcvOV0geGVu
L2FybTogdW5wb3B1bGF0ZSBtZW1vcnkgd2hlbiBkb21haW4gaXMNCj4gc3RhdGljDQo+IA0KPiBP
biAyMC4wNi4yMDIyIDA0OjQ0LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4g
QEAgLTI0OTgsNiArMjQ5OCwxMCBAQCB2b2lkIGZyZWVfZG9taGVhcF9wYWdlcyhzdHJ1Y3QgcGFn
ZV9pbmZvICpwZywNCj4gdW5zaWduZWQgaW50IG9yZGVyKQ0KPiA+ICAgICAgICAgIH0NCj4gPg0K
PiA+ICAgICAgICAgIGZyZWVfaGVhcF9wYWdlcyhwZywgb3JkZXIsIHNjcnViKTsNCj4gPiArDQo+
ID4gKyAgICAgICAgLyogQWRkIHBhZ2Ugb24gdGhlIHJlc3ZfcGFnZV9saXN0ICphZnRlciogaXQg
aGFzIGJlZW4gZnJlZWQuICovDQo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2VseShwZy0+Y291bnRf
aW5mbyAmIFBHQ19zdGF0aWMpICkNCj4gPiArICAgICAgICAgICAgcHV0X3N0YXRpY19wYWdlcyhk
LCBwZywgb3JkZXIpOw0KPiANCj4gVW5sZXNzIEknbSBvdmVybG9va2luZyBzb21ldGhpbmcgdGhl
IGxpc3QgYWRkaXRpb24gZG9uZSB0aGVyZSAvIC4uLg0KPiANCj4gPiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vbW0uaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oDQo+ID4gQEAgLTkwLDYg
KzkwLDE1IEBAIHZvaWQgZnJlZV9zdGF0aWNtZW1fcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcs
DQo+IHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIG5lZWRfc2NydWIpOyAgaW50DQo+ID4gYWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoc3Ry
dWN0IGRvbWFpbiAqZCwgbWZuX3Qgc21mbiwgdW5zaWduZWQgaW50DQo+IG5yX21mbnMsDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpOw0KPiA+
ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPiArI2RlZmluZSBwdXRfc3RhdGljX3Bh
Z2VzKGQsIHBhZ2UsIG9yZGVyKSAoeyAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAgdW5zaWdu
ZWQgaW50IGk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4g
KyAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IChvcmRlcikpOyBpKysgKSAgICAgICAgICAgICAg
ICAgIFwNCj4gPiArICAgICAgICBwYWdlX2xpc3RfYWRkX3RhaWwoKHBnKSArIGksICYoZCktPnJl
c3ZfcGFnZV9saXN0KTsgXA0KPiA+ICt9KQ0KPiANCj4gLi4uIGhlcmUgaXNuJ3QgZ3VhcmRlZCBi
eSBhbnkgbG9jay4gRmVlbHMgbGlrZSB3ZSd2ZSBiZWVuIHRoZXJlIGJlZm9yZS4NCj4gSXQncyBu
b3QgcmVhbGx5IGNsZWFyIHRvIG1lIHdoeSB0aGUgZnJlZWluZyBvZiBzdGF0aWNtZW0gcGFnZXMg
bmVlZHMgdG8gYmUNCj4gc3BsaXQgbGlrZSB0aGlzIC0gaWYgaXQgd2Fzbid0IHNwbGl0LCB0aGUg
bGlzdCBhZGRpdGlvbiB3b3VsZCAibmF0dXJhbGx5IiBvY2N1ciB3aXRoDQo+IHRoZSBsb2NrIGhl
bGQsIEkgdGhpbmsuDQoNClJlbWluZGVkIGJ5IHlvdSBhbmQgSnVsaWVuLCBJIG5lZWQgdG8gYWRk
IGEgbG9jayBmb3Igb3BlcmF0aW9ucyhmcmVlL2FsbG9jYXRpb24pIG9uDQpyZXN2X3BhZ2VfbGlz
dCwgSSdsbCBndWFyZCB0aGUgcHV0X3N0YXRpY19wYWdlcyB3aXRoIGQtPnBhZ2VfYWxsb2NfbG9j
ay4gQW5kIGJyaW5nDQpiYWNrIHRoZSBsb2NrIGluIGFjcXVpcmVfcmVzZXJ2ZWRfcGFnZS4NCg0K
cHV0X3N0YXRpY19wYWdlcywgdGhhdCBpcywgYWRkaW5nIHBhZ2VzIHRvIHRoZSByZXNlcnZlZCBs
aXN0LCBpcyBvbmx5IGZvciBmcmVlaW5nIHN0YXRpYw0KcGFnZXMgb24gcnVudGltZS4gSW4gc3Rh
dGljIHBhZ2UgaW5pdGlhbGl6YXRpb24gc3RhZ2UsIEkgYWxzbyB1c2UgZnJlZV9zdGF0aW1lbV9w
YWdlcywNCmFuZCBpbiB3aGljaCBzdGFnZSwgSSB0aGluayB0aGUgZG9tYWluIGhhcyBub3QgYmVl
biBjb25zdHJ1Y3RlZCBhdCBhbGwuIFNvIEkgcHJlZmVyDQp0aGUgZnJlZWluZyBvZiBzdGF0aWNt
ZW0gcGFnZXMgaXMgc3BsaXQgaW50byB0d28gcGFydHM6IGZyZWVfc3RhdGljbWVtX3BhZ2VzIGFu
ZA0KcHV0X3N0YXRpY19wYWdlcyANCg0KPiANCj4gRnVydGhlcm1vcmUgY2FyZWZ1bCB3aXRoIHRo
ZSBsb2NhbCB2YXJpYWJsZSBuYW1lIHVzZWQgaGVyZS4gQ29uc2lkZXIgd2hhdA0KPiB3b3VsZCBo
YXBwZW4gd2l0aCBhbiBpbnZvY2F0aW9uIG9mDQo+IA0KPiAgICAgcHV0X3N0YXRpY19wYWdlcyhk
LCBwYWdlLCBpKTsNCj4gDQo+IFRvIGNvbW1vbiBhcHByb2FjaCBpcyB0byBzdWZmaXggYW4gdW5k
ZXJzY29yZSB0byB0aGUgdmFyaWFibGUgbmFtZS4NCj4gU3VjaCBuYW1lcyBhcmUgbm90IHN1cHBv
c2VkIHRvIGJlIHVzZWQgb3V0c2lkZSBvZiBtYWNyb3MgZGVmaW5pdGlvbnMsIGFuZA0KPiBoZW5j
ZSB0aGVyZSdzIHRoZW4gbm8gcG90ZW50aWFsIGZvciBzdWNoIGEgY29uZmxpY3QuDQo+IA0KDQpV
bmRlcnN0b29kISEgSSB3aWxsIGNoYW5nZSAidW5zaWduZWQgaW50IGkiIHRvICJ1bnNpZ25lZCBp
bnQgX2kiOw0KDQo+IEZpbmFsbHkgSSB0aGluayB5b3UgbWVhbiAoMXUgPDwgKG9yZGVyKSkgdG8g
YmUgb24gdGhlIHNhZmUgc2lkZSBhZ2FpbnN0IFVCIGlmDQo+IG9yZGVyIGNvdWxkIGV2ZXIgcmVh
Y2ggMzEuIFRoZW4gYWdhaW4gLSBpcyAib3JkZXIiIGFzIGEgcGFyYW1ldGVyIG5lZWRlZA0KPiBo
ZXJlIGluIHRoZSBmaXJzdCBwbGFjZT8gV2Fzbid0IGl0IHRoYXQgc3RhdGljbWVtIG9wZXJhdGlv
bnMgYXJlIGxpbWl0ZWQgdG8NCj4gb3JkZXItMCByZWdpb25zPw0KDQpZZXMsIHJpZ2h0IG5vdywg
dGhlIGFjdHVhbCB1c2FnZSBpcyBsaW1pdGVkIHRvIG9yZGVyLTAsIGhvdyBhYm91dCBJIGFkZCBh
c3NlcnRpb24gaGVyZQ0KYW5kIHJlbW92ZSBvcmRlciBwYXJhbWV0ZXI6DQoNCiAgICAgICAgLyog
QWRkIHBhZ2Ugb24gdGhlIHJlc3ZfcGFnZV9saXN0ICphZnRlciogaXQgaGFzIGJlZW4gZnJlZWQu
ICovDQogICAgICAgIGlmICggdW5saWtlbHkocGctPmNvdW50X2luZm8gJiBQR0Nfc3RhdGljKSAp
DQogICAgICAgIHsNCiAgICAgICAgICAgIEFTU0VSVCghb3JkZXIpOw0KICAgICAgICAgICAgcHV0
X3N0YXRpY19wYWdlcyhkLCBwZyk7DQogICAgICAgIH0NCg0KPiBKYW4NCg==

