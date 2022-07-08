Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17B56BCFB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 17:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363557.594153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9q4c-0004Wc-9z; Fri, 08 Jul 2022 15:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363557.594153; Fri, 08 Jul 2022 15:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9q4c-0004UQ-6a; Fri, 08 Jul 2022 15:39:18 +0000
Received: by outflank-mailman (input) for mailman id 363557;
 Fri, 08 Jul 2022 15:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LzHR=XN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o9q4Z-0004UI-MB
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 15:39:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e144222-fed4-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 17:39:13 +0200 (CEST)
Received: from AS9PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:20b:50e::26)
 by DB8PR08MB5353.eurprd08.prod.outlook.com (2603:10a6:10:112::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 15:39:11 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::e7) by AS9PR04CA0096.outlook.office365.com
 (2603:10a6:20b:50e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 15:39:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 15:39:09 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Fri, 08 Jul 2022 15:39:09 +0000
Received: from 714279917464.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F8CAC37-E1AD-4F2C-9CCB-16B2DB80A2B0.1; 
 Fri, 08 Jul 2022 15:39:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 714279917464.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 15:39:02 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB4264.eurprd08.prod.outlook.com (2603:10a6:20b:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 15:39:00 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.018; Fri, 8 Jul 2022
 15:39:00 +0000
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
X-Inumbo-ID: 1e144222-fed4-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=k+ivsmD+6Jjv+xJLizYR0BYTYgR7A7VrfUkWL3FWqJl4kNsfAG00bjgWjMfOWHFoqOEScLlOEXVsbYtvRvDBKkFlD6KfjOmX09YIPlIMQDHfadwvhXMn491yUafkiMuQW3LZxoT43/jci67l4YAolejpCJrVh5MzIPdluvFxtE7+UXSFlp56xWTVKpQd8EiKK3SAQYV92TmAftEZmsnEG5UcI82xEdM8ArvYDNxUuSQjJ7cj4gLY+VvMlRyOR5JQAVVHDl0eduRIwB7/ALPdIGNEtxq+HubStoXlNSuiTCzNigjVvgU5L1OXtV1RzuPI8o0pxtumRdMbSsALbnOhig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG4PfVFd5kpukvJPYaICv9heKExCAk04Gug1qemmM24=;
 b=AJFEzSfowf5NCRiZpmdood4zii22h8F3Wm/iHMvxebRKgqUIL/V6KY4ds/vWyvH3QJ/Psrvrbo51sS6y0hiujWD7gda7i+RWjSUzi/eaJvvncjCvrxEn7C0OUdIf3MlnFDxGoOezIVsbnL6oMdhYX1de3jh6oIR5KypXouOHy3fIr621fRIp3PuMUGCyuMq4GdeIWxdQwe4mOeD9gw9OlG5FiCAY3Ii8iryLrY62sReWwhoP6F8FyG5gCvfaZrhGSKBqAl/ez7Hjab8Y+lHLm+sJ36nfJfXPghJ0w1mWFmGOvh414Dzv+Q2ylkcCcRGy0VVe0uK8XKIv7BDmh4cX+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG4PfVFd5kpukvJPYaICv9heKExCAk04Gug1qemmM24=;
 b=DnejgJCrFtUQDK3Js1YmEId8wN/gUxcBeOlzjXXTWnAkj08V97t/LAAuCTmBR1uJstL2DY9hO79uNbWQR0vZsL1LydtXf1kBnvvF06rC9Wr+Fc/tAG61CEuOjTOOJJWFp1jb6MskMqBid7XAAgNvZaT5irrLYFB83vHgfcZUFrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f908982e0e550806
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiVeqKB+QvhGTq8cHrWDIfsVlzBjL0U1Nhjce4QzOh96uYV9eMGcqmD+IWUsH3xOFkEZsaftCNu5+tp+dFW1YGXlHodSExONS4SoPBtVWQmQxcv0cDmL+f4xK9g8c9sRVIahWSeU9BiZ23jXMwA6KIezoX7A9UuIUQ7V80MY2FmvfD0gUjhI1sXo5heLT093aPmh07YDH3STsN9Cdn5Zqp60Lnurus3qx/7ymo2PItpz3E6FyfaK4hMbD4SU9VbTYExIYtcOjTUQ7gzsE+qVfhWV1SvZnV4RMHTuQEu7GxEYJEyY+d48+Xx5rrUlLo7VIVMGYXodidtZbs4byO1PLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG4PfVFd5kpukvJPYaICv9heKExCAk04Gug1qemmM24=;
 b=i4tUtiQtcwTS1wiYe0F3NGjmixN79R6kzevb8M2Iqevi7+dZqln4CizMuXb2+5Et+F+LLEx6NziR0M0R8lRfzO0ODv+MTAnc83JA1Z+XoU3r26G0PxX3oxHD+mE0s4rsb2qmur1+HXIP92Wy0CgJw6GegZAb/BwgR7WzEapBSKdTKvJlJBvLjPWt8eoqDy5xK+ZByPH9fnO04AXFXbXeT3kwuQWH//DlLvqea+oPv5X98aiF97ScmRprTJUdPvGfWR5Kd8z/bGjK85QY17DWYF3wLkj+Tb+wCjkD+CxekWxy35ZgNf5TN1CBMh1DvizE0tKqUTlUm4gCcL497x1+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG4PfVFd5kpukvJPYaICv9heKExCAk04Gug1qemmM24=;
 b=DnejgJCrFtUQDK3Js1YmEId8wN/gUxcBeOlzjXXTWnAkj08V97t/LAAuCTmBR1uJstL2DY9hO79uNbWQR0vZsL1LydtXf1kBnvvF06rC9Wr+Fc/tAG61CEuOjTOOJJWFp1jb6MskMqBid7XAAgNvZaT5irrLYFB83vHgfcZUFrw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Thread-Topic: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Thread-Index: AQHYh+Qt/49JLdoEv0uAADgNQkPLF610seaA
Date: Fri, 8 Jul 2022 15:39:00 +0000
Message-ID: <35DF552D-E8EE-4478-891F-792F67D690D2@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-5-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-5-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4cb6ed2d-0258-4ff6-b1fb-08da60f8003a
x-ms-traffictypediagnostic:
	AM6PR08MB4264:EE_|VE1EUR03FT010:EE_|DB8PR08MB5353:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IURZZQMUi/uJ953P0yqHJSmwesYaB9HfTciBwEZXz//lX8Ecjb1fJk1KaB9Y7RT4U+bs8DnHFTKxi08nkrNbAJ/URdnSn6LDgnfg7BvdIacqqb2MQKL3O0ZWR4B6oDbxOriW3jKSORmZ8N/0Fn5FvfmsuI2zsZSJKQzUVCjU1lztGOOorOlBwhX0BKyDSZzIsru3CbNCHuYs+UqcvL57UxDdgeyvraIGlNwTUazXvMHrBDzZTh8qj0TNJa1V9tKs8PynTxe6rbLd5MQsUoY1XuObUx/BcA0aqu1bQ2yvJiRlONR5HmKvuO2rKHc05FBDL/P8m4vNnRwqbp8vdkU36CXlDpgI7gVR5LXbzWCf1hT9aV+tMVfkNNbDjLljO1nAKefCNu8gv+IM2n8sUi6cXqqL5ewwrRaBpF7KgzmSKQx1Mn1IgX2P25e79akOzU1PgCFyRJiu++za88eDC8m38pz1VclgF8AFuM+n4ZBts4f7UqqzQV51I4DyFOs9Cw5x8Pj0J6UcnKtu4Dze1HQFKJyXBYTdfM6wb8pJn4JTc0+8I68iQiTOmvT9HXchAq6RmK1+a5/wh/MV6z22550GeLEKlYFfzrI+MGMCQE5Adb/CIpS0U432mTkWqzd6kxfUbRf5XqLJbNzgHpud62Rss6hOWgHZh7HTu2DjGal3XaLr9QicqXORS584f7PvbYvZrEYQa9QPg4rwKmHLZoLE7uL+YQt5FYeW5C1ggQItffIO0cWRRQMciubwuUkhSAyeg0Nb4XYv5jwXurVNqFmgOFxXedJRbPMIhgpCQrDHNAVov8h4YbCRMT2HGZz1GMXYUUf+GlBBe6/JSovpdo2oV3ea6Eo5RYeDN7s9p9RaW8E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(33656002)(36756003)(478600001)(41300700001)(6486002)(53546011)(2906002)(316002)(86362001)(71200400001)(54906003)(38100700002)(6506007)(6916009)(122000001)(8676002)(64756008)(66556008)(6512007)(66946007)(91956017)(26005)(66476007)(5660300002)(2616005)(66446008)(4326008)(186003)(38070700005)(76116006)(83380400001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07EE36EEC82911448BE50038197F7180@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4264
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bcacd94b-af52-4927-0386-08da60f7fa8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TyB7wdKtq2ofvtV0v0IGVB8Hut6VkI5DA+Il+bGIU09MwQbGhN7vSS/XCkB/8cxL1LQKs0pHA1kuJVA+j9w2whwAvrTTCCDgEkyr84b4XoznWIFN7NhY5ewVI+0MU65UH14w2jkhDyFULtgym20m6L/mTDGOafTEceY7lHqPcCnfBjD43EUuCe2C45PnPAcq60vJkMK3K//sGKged99EqoMJZGO2NPtpUoyGpaBaq9OYqdCN6bZUt+SA4t+agQCcGXY00yNO0pImAD23bIOTN8gv46UxPXHJf/vPgznXEfX5iY2YLLthpFsfa/Wi4ct7gDLRwUSd3UUrjGoBBy8JDuH286hiOj0pmkmsHtjC9moyPkVmtYZuZZeR/m4y7QlL4cdOpOha7W+77jvSC5yFFXJbiuvDHJMHjn3A99E2rz1Syol4PJJYME1E+4OFaTjURxe4TDjgkgSGOg3k7HjzhTE/dpYng3sd7g+kIa3ZjR4iSdwhqMIhh3MNmt9jVXPk4Pj562cWPRWBUIErJdTH+QihkxhilB1Z5+X1qXXszXWmOezfn13GvH7GtI+KdrbqJNw1SlsHlstrcBqZdbRUsTKhUlKe9vEwgyNMcDTRq+ZrVISUfPLRnUSYVm1u/xmyfCEeKPUYbSnGNmVcOV7se/vcr33PTCMcscefr1l/Pvr4yxSn+QhV5bIl5aX6uN3W2bcJCB7xSyGHXLWxXJ/6soic9bS7dBJ+VqXPCEUdQnLiiOanJJTXMwcvcOkVbxs0RtEfEaF0YUd8EbVO10lYJ+LvYjFRgxlBn6rMpvMP7vzPA6D11cVWS6b2t4NOuvs8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(36840700001)(46966006)(2906002)(478600001)(6486002)(53546011)(82310400005)(316002)(40480700001)(86362001)(54906003)(36756003)(33656002)(6512007)(41300700001)(70586007)(26005)(40460700003)(6506007)(70206006)(4326008)(8676002)(336012)(83380400001)(356005)(47076005)(186003)(82740400003)(36860700001)(8936002)(5660300002)(6862004)(81166007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 15:39:09.7255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb6ed2d-0258-4ff6-b1fb-08da60f8003a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5353

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE3OjA0LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBTZXR1cCBwcm9wZXIgZGVwZW5kZW5jaWVz
IHdpdGggbGliYWNwaSBzbyB3ZSBkb24ndCBuZWVkIHRvIHJ1biAibWFrZQ0KPiBodm1sb2FkZXIi
IGluIHRoZSAiYWxsIiB0YXJnZXQuICgiYnVpbGQubyIgbmV3IHByZXJlcXVpc2l0ZSBpc24ndA0K
PiBleGFjdGx5IHByb3BlciBidXQgYSBzaWRlIGVmZmVjdCBvZiBidWlsZGluZyB0aGUgJChEU0RU
X0ZJTEVTKSBpcyB0bw0KPiBnZW5lcmF0ZSB0aGUgInNzZHRfKi5oIiBuZWVkZWQgYnkgImJ1aWxk
Lm8iLikNCj4gDQo+IE1ha2UgdXNlIGlmICItaXF1b3RlIiBpbnN0ZWFkIG9mIGEgcGxhaW4gIi1J
Ii4NCj4gDQo+IEZvciAicm9tcy5pbmMiIHRhcmdldCwgdXNlICIkKFNIRUxMKSIgaW5zdGVhZCBv
ZiBwbGFpbiAic2giLiBBbmQgdXNlDQo+IGZ1bGwgcGF0aCB0byAibWtoZXgiIGluc3RlYWQgb2Yg
YSByZWxhdGl2ZSBvbmUuIExhc3RseSwgYWRkICItZiIgZmxhZw0KPiB0byAibXYiLCBpbiBjYXNl
IHRoZSB0YXJnZXQgYWxyZWFkeSBleGlzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiAtLS0NCj4gdG9vbHMvZmlybXdh
cmUvaHZtbG9hZGVyL01ha2VmaWxlIHwgMTYgKysrKysrKysrLS0tLS0tLQ0KPiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxv
YWRlci9NYWtlZmlsZQ0KPiBpbmRleCBiNzU0MjIwODM5Li5mYzIwOTMyMTEwIDEwMDY0NA0KPiAt
LS0gYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvTWFrZWZpbGUNCj4gKysrIGIvdG9vbHMvZmly
bXdhcmUvaHZtbG9hZGVyL01ha2VmaWxlDQo+IEBAIC02MCw4ICs2MCw3IEBAIFJPTVMgKz0gJChS
T01CSU9TX1JPTSkgJChTVERWR0FfUk9NKSAkKENJUlJVU1ZHQV9ST00pDQo+IGVuZGlmDQo+IA0K
PiAuUEhPTlk6IGFsbA0KPiAtYWxsOiBhY3BpDQo+IC0JJChNQUtFKSBodm1sb2FkZXINCj4gK2Fs
bDogaHZtbG9hZGVyDQo+IA0KPiAuUEhPTlk6IGFjcGkNCj4gYWNwaToNCj4gQEAgLTczLDEyICs3
MiwxNSBAQCBzbWJpb3MubzogQ0ZMQUdTICs9IC1EX19TTUJJT1NfREFURV9fPSJcIiQoU01CSU9T
X1JFTF9EQVRFKVwiIg0KPiBBQ1BJX1BBVEggPSAuLi8uLi9saWJhY3BpDQo+IERTRFRfRklMRVMg
PSBkc2R0X2FueWNwdS5jIGRzZHRfMTVjcHUuYyBkc2R0X2FueWNwdV9xZW11X3hlbi5jDQo+IEFD
UElfT0JKUyA9ICQocGF0c3Vic3QgJS5jLCUubywkKERTRFRfRklMRVMpKSBidWlsZC5vIHN0YXRp
Y190YWJsZXMubw0KPiAtJChBQ1BJX09CSlMpOiBDRkxBR1MgKz0gLUkuIC1ETElCQUNQSV9TVERV
VElMUz1cIiQoQ1VSRElSKS91dGlsLmhcIg0KPiArJChBQ1BJX09CSlMpOiBDRkxBR1MgKz0gLWlx
dW90ZSAuIC1ETElCQUNQSV9TVERVVElMUz1cIiQoQ1VSRElSKS91dGlsLmhcIg0KPiBDRkxBR1Mg
Kz0gLUkkKEFDUElfUEFUSCkNCj4gdnBhdGggYnVpbGQuYyAkKEFDUElfUEFUSCkNCj4gdnBhdGgg
c3RhdGljX3RhYmxlcy5jICQoQUNQSV9QQVRIKQ0KPiBPQkpTICs9ICQoQUNQSV9PQkpTKQ0KPiAN
Cj4gKyQoRFNEVF9GSUxFUyk6IGFjcGkNCj4gK2J1aWxkLm86ICQoRFNEVF9GSUxFUykNCj4gKw0K
PiBodm1sb2FkZXI6ICQoT0JKUykgaHZtbG9hZGVyLmxkcw0KPiAJJChMRCkgJChMREZMQUdTX0RJ
UkVDVCkgLU4gLVQgaHZtbG9hZGVyLmxkcyAtbyAkQCAkKE9CSlMpDQo+IA0KPiBAQCAtODcsMjEg
Kzg5LDIxIEBAIHJvbXMuaW5jOiAkKFJPTVMpDQo+IA0KPiBpZm5lcSAoJChST01CSU9TX1JPTSks
KQ0KPiAJZWNobyAiI2lmZGVmIFJPTV9JTkNMVURFX1JPTUJJT1MiID4+ICRALm5ldw0KPiAtCXNo
IC4uLy4uL21pc2MvbWtoZXggcm9tYmlvcyAkKFJPTUJJT1NfUk9NKSA+PiAkQC5uZXcNCj4gKwkk
KFNIRUxMKSAkKFhFTl9ST09UKS90b29scy9taXNjL21raGV4IHJvbWJpb3MgJChST01CSU9TX1JP
TSkgPj4gJEAubmV3DQo+IAllY2hvICIjZW5kaWYiID4+ICRALm5ldw0KPiBlbmRpZg0KPiANCj4g
aWZuZXEgKCQoU1REVkdBX1JPTSksKQ0KPiAJZWNobyAiI2lmZGVmIFJPTV9JTkNMVURFX1ZHQUJJ
T1MiID4+ICRALm5ldw0KPiAtCXNoIC4uLy4uL21pc2MvbWtoZXggdmdhYmlvc19zdGR2Z2EgJChT
VERWR0FfUk9NKSA+PiAkQC5uZXcNCj4gKwkkKFNIRUxMKSAkKFhFTl9ST09UKS90b29scy9taXNj
L21raGV4IHZnYWJpb3Nfc3RkdmdhICQoU1REVkdBX1JPTSkgPj4gJEAubmV3DQo+IAllY2hvICIj
ZW5kaWYiID4+ICRALm5ldw0KPiBlbmRpZg0KPiBpZm5lcSAoJChDSVJSVVNWR0FfUk9NKSwpDQo+
IAllY2hvICIjaWZkZWYgUk9NX0lOQ0xVREVfVkdBQklPUyIgPj4gJEAubmV3DQo+IC0Jc2ggLi4v
Li4vbWlzYy9ta2hleCB2Z2FiaW9zX2NpcnJ1c3ZnYSAkKENJUlJVU1ZHQV9ST00pID4+ICRALm5l
dw0KPiArCSQoU0hFTEwpICQoWEVOX1JPT1QpL3Rvb2xzL21pc2MvbWtoZXggdmdhYmlvc19jaXJy
dXN2Z2EgJChDSVJSVVNWR0FfUk9NKSA+PiAkQC5uZXcNCj4gCWVjaG8gIiNlbmRpZiIgPj4gJEAu
bmV3DQo+IGVuZGlmDQo+IC0JbXYgJEAubmV3ICRADQo+ICsJbXYgLWYgJEAubmV3ICRADQoNCkhl
cmUsIGluc3RlYWQgb2YgLWYsIGlzIGl0IHNhZmVyIC11PyBXaGF04oCZcyB5b3VyIG9waW5pb24g
b24gdGhhdD8gVGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQoNCj4gDQo+IC5QSE9OWTogY2xl
YW4NCj4gY2xlYW46DQo+IC0tIA0KPiBBbnRob255IFBFUkFSRA0KPiANCj4gDQoNCg==

