Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0E1590E7F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 11:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385497.621168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRMg-0004cg-4x; Fri, 12 Aug 2022 09:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385497.621168; Fri, 12 Aug 2022 09:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRMg-0004Zk-0r; Fri, 12 Aug 2022 09:54:02 +0000
Received: by outflank-mailman (input) for mailman id 385497;
 Fri, 12 Aug 2022 09:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hRCN=YQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oMRMe-0004Yd-7Y
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 09:54:00 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2084.outbound.protection.outlook.com [40.107.105.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af327e73-1a24-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 11:53:58 +0200 (CEST)
Received: from FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::7) by
 AM6PR08MB3077.eurprd08.prod.outlook.com (2603:10a6:209:48::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Fri, 12 Aug 2022 09:53:55 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::f1) by FR3P281CA0110.outlook.office365.com
 (2603:10a6:d10:a3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.14 via Frontend
 Transport; Fri, 12 Aug 2022 09:53:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 09:53:54 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Fri, 12 Aug 2022 09:53:54 +0000
Received: from a5abcf7fdd2d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75DD2988-DB91-477A-8C0C-C95F38641211.1; 
 Fri, 12 Aug 2022 09:53:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5abcf7fdd2d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Aug 2022 09:53:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB4025.eurprd08.prod.outlook.com (2603:10a6:10:a9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 09:53:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 09:53:45 +0000
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
X-Inumbo-ID: af327e73-1a24-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nWSGukNcaEzhJSLuEmYpaDU03THtuCJLjjlvahc6F/l01sCIMh0StMzPGVfuC1JVWCMDZ1Ncp8sSGWOy7eZyqGJBVmZdTUaSm5N2IqlIogAJFJimbHKtqL7mJT+4rjX+7MVoJtsgPF4smlTFV6GcLkNau+PFElz8ohJAr4GDh77hlkD/DJEwq545K6TCfyDHkIpXflCKHyvjlFqsPGh6k1gspqKCXf968Kw0AQz8MNpXp1+nh6shFWTwwnGB7dF84k3fgnJxXn7KvlqhdlxVu00fvoEMtp+ZsqeW75T8F4rT6q1RYWPSYD74jBRAmlvTMzxqs8AnOdKkWML2uOy5fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScySF2g035rfwO4S5ctcc09VTH5urQlDE4LKqsdQo3w=;
 b=E09alhbrW9G5xWo/+1loWNefEudZCT8g4zD/3ExFDhmNHKtsSXX20Z7VA6nDqPTkIpMBvnTxeA0/V567mJa3HIbjkUZuhETVbidfDkZV0sDfpZ3nKb48uzd0njpAWw3cY16Hu9aJykoVRLTmFC/sG1XfCtfPV7Ygo1TpH/xQ53FyijqFQLwF/5O4Bxzu4g3z9+DdfK52e4Rcz1jfIu290D1vONHa4P3nJ3rDX7PtK3ctsth1EMJRjNsks/wfyVR8EEw/7dITS6NN0bDhaFbLW1uUaR29mObQTLM5dvgdxqcthvnguFhDUl3MSGS5XsuYOASmjMk0kZR8iUizg6f6kQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScySF2g035rfwO4S5ctcc09VTH5urQlDE4LKqsdQo3w=;
 b=5H4kN5G7nNqrllf2J9++clp4h56SzfpJmeKO9v7oljiBXYjcedn1l/Z5lzhc0tuRBYyZLMFksuLA6vOHSC2H5vBs0/PSafACi8Ej/XkCg/YfxqQ040h/aCQur/IZlQKxrXZUxJxBSY52VFJXoArdKqg5dJ4JIvtfF/WRPmpcYa4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa1b63b397117095
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdFzmUZvLhBsCe4R6CpYBswF3jMqsq6QI0RI2oMFXL1jiLWlmTRZFQ2jK4HLH/MUstYum7sp4x/Yhl1hvQIrFQV0/hZkPorsPXhUa8cmOV6Ra42KR5hpXHg3b7egNEXp6V0xdMCLmryL/dLSexaM3vfsS4Ix6alUq0s0GvoQSoQ3sH9hAM+3OvATJyzUzh/09nNxTaDUodruXwWFx8rcFKdVS2IlavpoBbInQ4GwydA/ohex4CvzA/2dRAlU3szGooWXkxmNV/wCGKDZhz0JjVhejjo5Am/fxHCw6PQWfNLC1hhz6R2ewqxNUQSy06H0XgjVIL7BidZPafgGPbY/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScySF2g035rfwO4S5ctcc09VTH5urQlDE4LKqsdQo3w=;
 b=fWo8EvxDxFgU/ZQ5LfIULxZqaRwCQd96/uh5sK1CuXilHKHjkL4f4zHEb/wHakOdZXNEbqGfQS33jq3ojEqQJicCL6CDopOYZy55NTucWWI0BtgXVNi1vkCGcoIih/WMFkWHj85wKAFUQmz65NMbTZvArDibeJGiBdQWEAgtEuIJlTdSq6tJBww4QVNBXrotQM9XluNlvfa4O3P3yH6DFa1x2xt/V1FrIJvZXbQl8XgRM6FDeuJ4aSjuTzg4UVDhjScqyxhhuWWjpC3Wk9cEAzgQ/tSWIbRDBiQjkV7osRm2PDEu54nfwHmlIbfWltGHK8xYrqT+Vv/g+/DWB2Ixmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScySF2g035rfwO4S5ctcc09VTH5urQlDE4LKqsdQo3w=;
 b=5H4kN5G7nNqrllf2J9++clp4h56SzfpJmeKO9v7oljiBXYjcedn1l/Z5lzhc0tuRBYyZLMFksuLA6vOHSC2H5vBs0/PSafACi8Ej/XkCg/YfxqQ040h/aCQur/IZlQKxrXZUxJxBSY52VFJXoArdKqg5dJ4JIvtfF/WRPmpcYa4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Penny Zheng <Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Index:
 AQHYm/wrUfogDGShnkmhOgXs9i6E7a2PQtqAgBcPXACAAAGYAIAAAoCAgAAFWYCAAAiigIAExo8A
Date: Fri, 12 Aug 2022 09:53:45 +0000
Message-ID: <21CCFB81-D43F-48D9-8EC0-A8CD08835261@arm.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
 <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
 <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <99e65678-c394-01f1-9f49-827388f2fff6@suse.com>
 <DU2PR08MB7325A733C5B374ED899A2007F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <14ce6b41-c422-abac-4b59-541511d75cae@suse.com>
 <DU2PR08MB732531F03BB6F436FCC79673F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
In-Reply-To:
 <DU2PR08MB732531F03BB6F436FCC79673F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 28fe0530-7edb-4710-1287-08da7c48916d
x-ms-traffictypediagnostic:
	DB8PR08MB4025:EE_|VE1EUR03FT056:EE_|AM6PR08MB3077:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bdRb5O4axi/Hpcbjnq99o6Yx13/o9c3Te7nXTl0XMT22g1dUIc498JoYBdnpjjdtMK6/jkgBw8UkKsvWyDC5tBoStzrBWq0Ofq3PW99tZKO4NXyens70COWq9E52WkMe8KdZfVr3CEJ8QAdCiLkMEjTHPigyKra0WlXKuxjLQ3J0a7pZ6LvNGM6AzCIBdf5hu37uTn4CpwKy3Dkw4eRD5eDnnUQzblZO+g4rDqWdPawSlNu1sBu5ycGEFIDkO6nnIRZ7mrAGw7Eh5y8GxXA9UR3zeO74t1gtS2LaAE5IKbimU+qjNxb2YBAGT82Nn9zSWgVCmwF5OCMbd18DPIpTCSenjalD+A8B1HRUDoSvlbKx7u/oPW5TqmbSISH6/2QPpDgtFtq+mt2lyNL7ulcAk0jluRhl1xDbmworw5sVEVo6ivCc2xtGLhwaAsUJHkG+PJelOav1885VT2LAOWNbujLidJGGx/fj0y/TXQzdYXy8kS5w1DELTXuls66BOgEDoGO6M0s2iLUuySW7SfCuyHUqvlE5v4rMWQ2Eyo0RdAyARX7iigWShY6omOhPk+0un6k4W+G7GprUSXvr4DKzOLB5NcSIEnaq6aZuvSHAcdWIsWDi4TJN9CQTTLTlV4Q1+iUATApUywVJPa61WUNTlEM8af4EyJQIUWt0vHh6HwnlGWxZTGaE7BnjcIEVEKDmPEJrCIAzYykzTPv/W1HUISGV7RTO8aE+099bcULIKMfrKevZ3/OKvxNa9+prm4lXpbN+k4/sOx6NUY3YZnwKXxPxFtHDK+3avdbPBot9P5+RO/8RC8F/Qax8AjxSeXpAG+lQAkby7kcu/l4f1amuvg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(110136005)(54906003)(66556008)(66446008)(66476007)(64756008)(8676002)(4326008)(91956017)(76116006)(66946007)(8936002)(41300700001)(5660300002)(36756003)(6506007)(53546011)(6512007)(26005)(186003)(2906002)(2616005)(38070700005)(86362001)(33656002)(83380400001)(71200400001)(478600001)(6486002)(316002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28954ABC3811FB438BF529F7E028FB46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4025
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	100e22a0-800c-4947-5dd8-08da7c488c01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8+AxkhyI8MyV6xe0yQxnHNKRVOvIjKZ1x06MDD3/P1aHPCSZJfBwg6uQVtDiceoNdYJIPOkUiClTySElMepzFaZZus8DDH+YLUx3kqTZ/XbKDla0dWrUPeqEPn+hpPYD+vqKRFe/XRWkFhmsq9zUz3Gvi6EQAUAuN5Zu2b6xfPFKZjahXtFrd/P+hVG/8tajpJWKizQsZTAi6vg8/tYShYziI+TOxU62zKUjwSO9U9hgaG5RFYsBJRbIT9/9o2xoK0+cFwU8Akqua8tdihlMwlC8oYj5NsdMBMPuu1WnU+zjt8GgYGqjJy/bQ5GbegC4U1WABRGEmQlBB2ZYk4FU9UYwI297n8dZ99kaLCqQ4pkzPqH9Vtu4PDk0bugVgkBkn49GjzpHoK+gtVV+41OkbDX+R7xIEts8KsVd8LAqD0ADnbGh1MyKSHQDKfMUS/DYNzKDKUehEN1xWCXyrJDEjOYzhWFcZg8pRD1vM8E4tkctwe1I6O4u4Bg821JmE96slmO4qAISMzV/3QZP1XCpwaqoHFSgGIetMGvRn+5rS9FvAsbk9k1gZuA7k6spd4s+HwLTOeL5h7Ynji3wW31q7NtKBtAiMEWgrN7uylOX4dUKZzcC+kPufWYOaGjI+em8wwsb5FezTbfVpXPzQ+0RTWliCeB9FNTOWIkP0fMMo+0Hfr4+IZA/tJeEOblzhYoRCe6Pig8MTNRqYJ+8zF2fu+KoxEwHMPvQJbKGS87YO5IOaqpKbnI/YRLAopwTPA2d93c6w8A+hrSuP9xo9wYnteXoPj5TTWgw+r6riIVV6PrTsb1RhpEeFede/JSuqqgu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(40470700004)(46966006)(36840700001)(26005)(356005)(6512007)(81166007)(82310400005)(82740400003)(53546011)(6486002)(40460700003)(8936002)(86362001)(478600001)(5660300002)(6506007)(33656002)(83380400001)(41300700001)(4326008)(8676002)(70206006)(2906002)(70586007)(40480700001)(36756003)(110136005)(54906003)(2616005)(186003)(336012)(47076005)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 09:53:54.4274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fe0530-7edb-4710-1287-08da7c48916d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3077

SGkgUGVubnksDQoNCj4gT24gOSBBdWcgMjAyMiwgYXQgMDk6NTgsIFBlbm55IFpoZW5nIDxQZW5u
eS5aaGVuZ0Bhcm0uY29tPiB3cm90ZToNCj4gDQo+IEhpIGphbg0KPiANCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+PiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgOSwgMjAyMiA0OjI3IFBNDQo+PiBUbzogUGVubnkg
WmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFy
bS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47DQo+PiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsNCj4+IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkgOC84XSB4ZW46IHJldHJpZXZlIHJlc2Vy
dmVkIHBhZ2VzIG9uDQo+PiBwb3B1bGF0ZV9waHlzbWFwDQo+PiANCj4+IE9uIDA5LjA4LjIwMjIg
MTA6MDcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4+IFNlbnQ6
IFR1ZXNkYXksIEF1Z3VzdCA5LCAyMDIyIDM6NTkgUE0NCj4+Pj4gDQo+Pj4+IE9uIDA5LjA4LjIw
MjIgMDk6NTMsIFBlbm55IFpoZW5nIHdyb3RlOg0KPj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+Pj4+Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+Pj4+Pj4gT2YgSmFuIEJldWxpY2gNCj4+Pj4+PiBT
ZW50OiBNb25kYXksIEp1bHkgMjUsIDIwMjIgMTE6NDQgUE0NCj4+Pj4+PiANCj4+Pj4+PiBPbiAy
MC4wNy4yMDIyIDA3OjQ2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4+Pj4+Pj4gV2hlbiBhIHN0YXRp
YyBkb21haW4gcG9wdWxhdGVzIG1lbW9yeSB0aHJvdWdoIHBvcHVsYXRlX3BoeXNtYXANCj4+IGF0
DQo+Pj4+Pj4+IHJ1bnRpbWUsIGl0IHNoYWxsIHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIGZyb20g
cmVzdl9wYWdlX2xpc3QgdG8NCj4+Pj4+Pj4gbWFrZSBzdXJlIHRoYXQgZ3Vlc3QgUkFNIGlzIHN0
aWxsIHJlc3RyaWN0ZWQgaW4gc3RhdGljYWxseQ0KPj4+Pj4+PiBjb25maWd1cmVkIG1lbW9yeQ0K
Pj4+Pj4+IHJlZ2lvbnMuDQo+Pj4+Pj4+IFRoaXMgY29tbWl0IGFsc28gaW50cm9kdWNlcyBhIG5l
dyBoZWxwZXIgYWNxdWlyZV9yZXNlcnZlZF9wYWdlIHRvDQo+Pj4+Pj4+IG1ha2UNCj4+Pj4+PiBp
dCB3b3JrLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBl
bm55LnpoZW5nQGFybS5jb20+DQo+Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiB2OSBjaGFuZ2VzOg0KPj4+
Pj4+PiAtIFVzZSBBU1NFUlRfQUxMT0NfQ09OVEVYVCgpIGluIGFjcXVpcmVfcmVzZXJ2ZWRfcGFn
ZQ0KPj4+Pj4+PiAtIEFkZCBmcmVlX3N0YXRpY21lbV9wYWdlcyB0byB1bmRvIHByZXBhcmVfc3Rh
dGljbWVtX3BhZ2VzIHdoZW4NCj4+Pj4+Pj4gYXNzaWduX2RvbXN0YXRpY19wYWdlcyBmYWlscw0K
Pj4+Pj4+IA0KPj4+Pj4+IE1heSBJIHN1Z2dlc3QgdG8gcmUtY29uc2lkZXIgbmFtaW5nIG9mIHRo
ZSB2YXJpb3VzIGZ1bmN0aW9ucz8NCj4+Pj4+PiBVbmRvaW5nIHdoYXQgInByZXBhcmUiIGRpZCBi
eSAiZnJlZSIgaXMsIHdlbGwsIGNvdW50ZXJpbnR1aXRpdmUuDQo+Pj4+Pj4gDQo+Pj4+PiANCj4+
Pj4+IEhvdyBhYm91dCBjaGFuZ2UgdGhlIG5hbWUgInByZXBhcmVfc3RhdGljbWVtX3BhZ2VzIiB0
bw0KPj4+PiAiYWxsb2NhdGVfc3RhdGljbWVtX3BhZ2VzIj8NCj4+Pj4gDQo+Pj4+IFBlcmhhcHMg
LSBpZiB3aGF0IHRoZSBmdW5jdGlvbiBkb2VzIHJlYWxseSByZXNlbWJsZXMgYWxsb2NhdGlvbiBp
biBzb21lDQo+PiB3YXkuDQo+Pj4+IFNvIGZhciBJIHdhc24ndCByZWFsbHkgY2VydGFpbiBpbiB0
aGF0IHJlZ2FyZCwgYW5kIGhlbmNlIEkgd2FzDQo+Pj4+IHdvbmRlcmluZyB3aGV0aGVyICJwcmVw
YXJlIiBkb2Vzbid0IGJldHRlciBkZXNjcmliZSB3aGF0IGl0IGRvZXMsIGJ1dA0KPj4+PiB0aGVu
IGl0cyBpbnZlcnNlIGFsc28gZG9lc24ndCByZWFsbHkgImZyZWUiIGFueXRoaW5nLg0KPj4+PiAN
Cj4+PiANCj4+PiBIbW1tbSwg4oCccHJlcGFyZeKAnSB3aXRoIOKAnGRlc3Ryb3nigJ0gaW4gaXRz
IGludmVyc2U/IERvIHlvdSBoYXZlIGFueQ0KPj4gc3VnZ2VzdGlvbiBpbiBtaW5kPw0KPj4gDQo+
PiBUbyBiZSBob25lc3QgSSB3YXMgaG9waW5nIHlvdSB3b3VsZCBtYWtlIGFuIGF0dGVtcHQgYXQg
ZmluZGluZyBhIHN1aXRhYmxlDQo+PiBwYWlyIG9mIHZlcmJzLiBUbyBtZSAiZGVzdHJveSIgaXMg
bW9yZSB0aGUgb3Bwb3NpdGUgb2YgImNyZWF0ZSIsIGFuZCBJJ20NCj4+IHVuYWJsZSB0byB0aGlu
ayBvZiBhIGdvb2Qgb3Bwb3NpdGUgb2YgInByZXBhcmUiIChzaG9ydCBvZiByZXNvcnRpbmcgdG8N
Cj4+ICJ1bnByZXBhcmUiKTsgaWYgSSByZWFsbHkgbmVlZGVkIHRvIGNvbWUgdXAgd2l0aCBzb21l
dGhpbmcgdGhlbiBpdCB3b3VsZA0KPj4gbGlrZWx5IGJlICJjbGVhbnVwIiwgYWxiZWl0IEknZCBu
b3QgYmUgb3Zlcmx5IGhhcHB5IHdpdGggdGhhdCBlaXRoZXIuDQo+PiANCj4gDQo+IE1heWJlIHVu
cHJlcGFyZSBpcyBiZXR0ZXIgaGVyZSwgSSB3YXMgc2VhcmNoaW5nIGxpbnV4IGNvZGUgZm9yIHRo
ZSBoZWxwLCBhbmQNCj4gdGhleSBhcmUgdXNpbmcgcHJlcGFyZS91bnByZXBhcmUgYXMgYSBwYWly
IG9mIHZlcmJzIGEgbG90IGluIGRyaXZlcnMgY29kZXMuDQo+IA0KPiBGb3IgdGhlIHJlbmFtaW5n
IGhlcmUsIEkgc3VnZ2VzdCB0byBmaXggaXQgd2l0aCBhIG5ldyBjb21taXQsIHNpbmNlIGZyZWVf
c3RhdGljbWVtX3BhZ2VzDQo+IGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2VkLg0KDQpJIHRoaW5rIHRo
YXQgdW5wcmVwYXJlIGlzIG9rIGFuZCBpdCBtYWtlIHNlbnNlIHRvIGRvIHRoaXMgaW4gYW4gaW5k
ZXBlbmRlbnQgcGF0Y2guDQoNCkBqYW46IGNhbiB5b3UgY29uZmlybSB0aGF0IHlvdSBhZ3JlZSB3
aXRoIHRoaXMgd2F5IHRvIGdvID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

