Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3035733B5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 12:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366434.597209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZDr-00029y-8J; Wed, 13 Jul 2022 10:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366434.597209; Wed, 13 Jul 2022 10:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZDr-00027S-5D; Wed, 13 Jul 2022 10:03:59 +0000
Received: by outflank-mailman (input) for mailman id 366434;
 Wed, 13 Jul 2022 10:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Gea=XS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBZDp-00027F-QT
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 10:03:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b9e0c18-0293-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 12:03:56 +0200 (CEST)
Received: from AS9PR06CA0468.eurprd06.prod.outlook.com (2603:10a6:20b:49a::23)
 by AS8PR08MB6598.eurprd08.prod.outlook.com (2603:10a6:20b:336::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 10:03:54 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::a1) by AS9PR06CA0468.outlook.office365.com
 (2603:10a6:20b:49a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13 via Frontend
 Transport; Wed, 13 Jul 2022 10:03:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 10:03:54 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Wed, 13 Jul 2022 10:03:54 +0000
Received: from 21041da937bd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C05CE81-8CDB-40E6-911D-67DC49393387.1; 
 Wed, 13 Jul 2022 10:03:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21041da937bd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 10:03:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 10:03:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 10:03:41 +0000
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
X-Inumbo-ID: 1b9e0c18-0293-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Jp7WffnW8spNSMOb0+r58s1lC+f7qIUyHx6lO1EqsTr5aFjqJFzprrwSKitMyce2mrFjDEPw1jDg0zuRnA9cJnR4hRMoPorz7L4hmw8bNXRse4uPw5w7lXUYPTdBQvt4Qc6+BGZXwcsfzey7K6NTNVWg+N0qSxyFmag/QgYJ7q/ZvvYV27EfbrKi3+Jx7jnkUJvNJ+V/ErzRtgjZ6csHIWPHOH3+NGETRFdrJAH0NWSU9hCJRtEViWH92cSOXulMJGc6JOOl1R4o8mbI4E+7st6QXmO20y4HSt6m2wP0geGARGRXAIXNfHOTTb8LxH9RQNVUaFTEy6v2h/e8VBtUZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaEAm9/BhIplZC6gvwJvKqYRRevFbyQ55OSYFu6Ak8E=;
 b=f8oawi4WPStXvlpKFecpFyo1Bsv2Wu/d8y4LmElO0eEjKXQaqXEzySmgOAUWMqohKzlOegeTqLwhUizymDSa51eBqM+HPPwVwqGHGKQ36pO5z8O5GUAGWJG9nu6poFQrRCv4FvjdloYX0uMq4SDHlGhd1JFNl8iZmSNdkk19OUKBetgNHkIDELyOy6YM+eHWLzNfgBV99+ytESbXE7b74IJzMrbEzrMt0KlJRbazB2WeZMLRbSQTJWp0e+fH7OnhBo27z7hnNUDY1r9/oKHXd9p3iDlVGco2n7kqYYdWHm2sjWZkGiRBmllEyqo1rpjoZqTxf23W2khVGoxYkb+3OQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaEAm9/BhIplZC6gvwJvKqYRRevFbyQ55OSYFu6Ak8E=;
 b=4lzc/1+U/J6bxwos66Ld4+iuvMDSlCXHdm5qEyOG+k08ridCplUeB1PDkYv3OF8S4FcUI/LNpsmNRef5vSCd93wmN9rwbKYuRskCP9lHkKtM5wrIjwO/rXZelvmXTWVEDtrBy9YG2m9yRnaKDUQAj7njPVIC68OBmn7fBL0CFXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59d9cd878643eda8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ix767EcqMKZy3Zy1qUS8z1YXcb/YYgdX5U0g4g16ZtSco1lMBb0VXuVaEr4Kb30c840fHlyOJPtHZJF5Qz2hCwnIO5bXbvL7fFNTIq/s5I4DPGSjyFnbesA9LfX9BEPZFf7Bzy7BsQKIBobQ+MzfmV9l3iBLN3QCGEcmxAYx9HK0i0A4w61ZD+KKQJ0awp1Lms606L0JzZGLCSgZCTEyrtSv4ThTJppe/TpvhnuPr6vHmOk29CkkrYdcu0Wcwvn5MM0+cq1TzZFgCUoFNv0+xuANo3aAf96inZk5/HwAs/I5nJr1E9pKaqdxMPxAf77z2SZL6zIo8liwijKMEADSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaEAm9/BhIplZC6gvwJvKqYRRevFbyQ55OSYFu6Ak8E=;
 b=IxnU60SJ3EBSAd44e9QgpItTbOLyBHIXNlZ0i+uw6Mx06RfqIVzoBkTSW4uJO83TXihqaX2GL/4kOLjhdKnMlJaj6EoioMhqulzs9TYGihZD/P+K6HmoEMYz9sDnBxfixQyzeKPSShljeB4KBHHI8FI6VFxVJ/I85+CfyuhKdZLsgdgiV2DsJYk+hmt/qBQeqK5AKdLlLpnXoveMRJLhbkPQRJF+dlkmCHuIZo7PITvIOIyqTW5vfXIvAT230Z0H4uQ+T6fWjNNsAQII2NYiem21dTpB70aWhXOAnjMB0C5zNuQjQuzlrWaaiQNqa2qfxqTJE2N33Ioc7xSdun4PRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaEAm9/BhIplZC6gvwJvKqYRRevFbyQ55OSYFu6Ak8E=;
 b=4lzc/1+U/J6bxwos66Ld4+iuvMDSlCXHdm5qEyOG+k08ridCplUeB1PDkYv3OF8S4FcUI/LNpsmNRef5vSCd93wmN9rwbKYuRskCP9lHkKtM5wrIjwO/rXZelvmXTWVEDtrBy9YG2m9yRnaKDUQAj7njPVIC68OBmn7fBL0CFXA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index:
 AQHYhkXakuWoh6IHqUaokStUp728i61bgqiAgB3xuACAAai8gIAA1/CAgAA2U4CAAAT8AIAAAr+A
Date: Wed, 13 Jul 2022 10:03:40 +0000
Message-ID: <11649A86-4CC2-4439-B64D-F1CA11B53B2B@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
In-Reply-To: <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 129a98d2-7f3d-46d4-4ca9-08da64b6feae
x-ms-traffictypediagnostic:
	AM7PR08MB5320:EE_|AM5EUR03FT031:EE_|AS8PR08MB6598:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QBgokeZOgyxClp73L6AZzOi0UnSrq0euY4LJ37yrf2mrUe2F9569vHTg+IkdXFjVDjKwT4oSWmh3dSg5zuXQZdFRMiMe5cW4xFtnlVlcQ0QdsUIIFZW58Jx6jidykBm7Urjn+yJ9laEvnypMAwgW/SJXXjLVQgF2T6QAWEt96HpwM4SUw5D8LEPWs09g+qQxRtrPDrA849OgCJkRC0fg3sR2Z4a8rCN0nGz9EZGJK6KTiZndtTNW29nP3nqREgDEDJI2tWDalJqyNg2+RssNRfKzGTRKnwMY61qDT9kfr0fQ0+rBulSBIZMWroJKTkjXpo3Cy7+hx8uo+USQCzwPqxIvK65fPqpXnxKJFGt6pw3MStHmPtI807YRMDwz8U2z+kmNFaXZswJOyh/j/zoSHue9rsyY7m8qcUM4vrtnbM3E9lgzFgxgxNNHhUfXlD2Y89Qqg7OK4M7hwfeZAScq5Cqvm9ZMYMy7jO/q4dR8vic6WOA5DP/IxkeRcJFsQ6OEMpAaURpu88sFwXualXw0bE8Qt7r1Q52iu0jZv2TKapSOSb+lZVmxfNxFwO79ZGzh4MrqgnAtV4ol5Yws9dC69mSB2fFpZQxS+jUAI0W0HdEhEC3+41N0wzh7xZHRiwV6bQvZZYanTg/HXItxgTqGeSJXoFfeYY3fKmqT31qg+f88wH5jHUnW+eteLJ6ubgkgOl0hu23GfFN0weNssbifbDJeocByEqPzonN7eDBkOW/o8iyWaxeDvDmX3KBIwU6+AXTTlkA4iMbzVgf449vSyyIc490oMFwxE8dcrth8gBd5JTTYcKoRsPMSTzC04nisUzutgtxAzIJRCqeEoJT+2KF2QGVR0avGvooLO/av2Yk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(26005)(186003)(6512007)(8936002)(33656002)(53546011)(2616005)(38100700002)(6506007)(38070700005)(86362001)(122000001)(2906002)(36756003)(316002)(8676002)(478600001)(83380400001)(4326008)(71200400001)(6916009)(54906003)(66446008)(66946007)(64756008)(66556008)(5660300002)(41300700001)(66476007)(76116006)(91956017)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <057CEF34DDEB00448C373C80498E47F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97aee0f2-e634-47f3-03ac-08da64b6f68b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KzOYC7bYFNIy0AxUX/+NpMdhhM73XbIYl9sbFJpFsLKKj016S4k+j93qyeIT+Tfl7BDay8JnHsWVhM4Os69R5/ucIe4QJfOkLNYfP13uUaHBlLFDhYD6F+/irbo3csbX8709y14ZNqge/a1D3QizLw6qu3BqPsDauC2yqVAVzKYGbkLg9mUkmLgY8qzXjO9QXaRgqWqlanC59BXALufAEqMVmgZR+Bq7CnFUA0sFipkpkBe8bzCdMgDSpCSM4XV/H7jtribj33kz970+QQ6Znr8sD0czToTV1jsR8O7QAtoN5R5tCNi5u9uJ6jmhuJJvyuoIKGyNQIOLF80w8mV5Tp6DJ7LeIJ2pSMIOFhTAmwSMUgKkMrwAFf3mve9KGgLZ/cGGBBXyqlw11jZsfwZRqM6mvlVvD1S1481BT5GhAW2rAFSOAAQA2SyBLtLQx9CXTDJNp2avoIZlmgIbdBvOPX0xDIqjV3KOjtMROUJkxrWmZ3ldyAeHJmV4RX002135GBCZstcZSiIz6IGYkjoWHLy9VgwSvhK41fThtFQXBFXH3gBmfPTN6mxQAARFG8ur3VyyJmH0ECxmRh+fsCg2GNG/XBR6COF295OEYwzqFHw8JQHWJKR938ltQn38N4C3RbICS4k8rga9a99clsfxVZEw9A3QAc9VBK1xDQHbR0hGSXA5lUe+0uxFUHknFTdrQ3oKvUT381SfLM/Wk134mTlYLxSasj8DBRw36nH9ZpUc0JGUYFoJyAvcqLS41KjHJ7nyDrb2cdev4AezGQNpFxQQMkCLQfF+Tov6SSBbz6WklwQJsz7OmA/yOA81gdeq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(47076005)(40460700003)(8936002)(2616005)(82310400005)(81166007)(478600001)(6486002)(36756003)(356005)(336012)(70206006)(70586007)(4326008)(8676002)(186003)(41300700001)(6862004)(82740400003)(83380400001)(36860700001)(6512007)(26005)(6506007)(5660300002)(2906002)(53546011)(86362001)(316002)(40480700001)(33656002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 10:03:54.5368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 129a98d2-7f3d-46d4-4ca9-08da64b6feae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6598

DQoNCj4gT24gMTMgSnVsIDIwMjIsIGF0IDEwOjUzLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMDcuMjAyMiAxMTozNSwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4gSGksDQo+PiANCj4+IE9uIDEzLzA3LzIwMjIgMDc6MjEsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+Pj4gRm9yIHRoZSBGSUZPIGlzc3VlLCB3ZSBjYW4gaW50cm9kdWNlIHRoZSBuZXcg
Y29uZmlnIG9wdGlvbiB0byByZXN0cmljdCB0aGUgbWF4aW11bSBudW1iZXIgb2Ygc3RhdGljDQo+
Pj4+PiBwb3J0IHN1cHBvcnRlZCBpbiBYZW4uIFdlIGNhbiBjaGVjayB0aGUgdXNlci1kZWZpbmVk
IHN0YXRpYyBwb3J0IHdoZW4gd2UgcGFyc2UgdGhlIGRldmljZSB0cmVlIGFuZCBpZg0KPj4+Pj4g
YSB1c2VyLWRlZmluZWQgc3RhdGljIHBvcnQgaXMgZ3JlYXRlciB0aGFuIHRoZSBtYXhpbXVtIGFs
bG93ZWQgc3RhdGljIHBvcnQgd2lsbCByZXR1cm4gYW4gZXJyb3IgdG8gdGhlIHVzZXIuDQo+Pj4+
PiBJbiB0aGlzIHdheSwgd2UgY2FuIGF2b2lkIGFsbG9jYXRpbmcgYSBsb3Qgb2YgbWVtb3J5IHRv
IGZpbGwgdGhlIGhvbGUuDQo+Pj4+PiANCj4+Pj4+IExldCBtZSBrbm93IHlvdXIgdmlldyBvbiB0
aGlzLg0KPj4+Pj4gDQo+Pj4+PiBjb25maWcgTUFYX1NUQVRJQ19QT1JUDQo+Pj4+PiBpbnQgIk1h
eGltdW0gbnVtYmVyIG9mIHN0YXRpYyBwb3J0c+KAnQ0KPj4+Pj4gcmFuZ2UgMSA0MDk1DQo+Pj4+
PiBoZWxwDQo+Pj4+PiBDb250cm9scyB0aGUgYnVpbGQtdGltZSBtYXhpbXVtIG51bWJlciBvZiBz
dGF0aWMgcG9ydCBzdXBwb3J0ZWQNCj4+Pj4gDQo+Pj4+IFRoZSBwcm9ibGVtIGlzIG5vdCBleGNs
dXNpdmUgdG8gdGhlIHN0YXRpYyBldmVudCBjaGFubmVsLiBTbyBJIGRvbid0DQo+Pj4+IHRoaW5r
IHRoaXMgaXMgcmlnaHQgdG8gaW50cm9kdWNlIE1BWF9TVEFUSUNfUE9SVCB0byBtaXRpZ2F0ZSB0
aGUgaXNzdWUNCj4+Pj4gKGV2ZW4gdGhvdWdoIHRoaXMgaXMgdGhlIG9ubHkgdXNlciB0b2RheSku
DQo+Pj4+IA0KPj4+PiBBIGZldyBvZiBhbHRlcm5hdGl2ZSBzb2x1dGlvbnM6DQo+Pj4+IDEpIEhh
bmRsZSBwcmVlbXB0aW9uIGluIGFsbG9jX2V2dGNobl9idWNrZXQoKQ0KPj4+PiAyKSBBbGxvY2F0
ZSBhbGwgdGhlIGJ1Y2tldHMgd2hlbiB0aGUgZG9tYWluIGlzIGNyZWF0ZWQgKHRoZSBtYXgNCj4+
Pj4gbnVtYmVycyBldmVudCBjaGFubmVsIGlzIGtub3duKS4gV2UgbWF5IG5lZWQgdG8gdGhpbmsg
YWJvdXQgcHJlZW1wdGlvbg0KPj4+PiAzKSBUd2VhayBpc19wb3J0X3ZhbGlkKCkgdG8gY2hlY2sg
aWYgdGhlIGJ1Y2tldCBpcyB2YWxpZC4gVGhpcyB3b3VsZA0KPj4+PiBpbnRyb2R1Y2UgYSBjb3Vw
bGUgb2YgZXh0cmEgbWVtb3J5IGFjY2VzcyAobWlnaHQgYmUgT0sgYXMgdGhlIGJ1Y2tldA0KPj4+
PiB3b3VsZCBiZSBhY2Nlc3NlZCBhZnRlcndhcmRzKSBhbmQgd2Ugd291bGQgbmVlZCB0byB1cGRh
dGUgc29tZSB1c2Vycy4NCj4+Pj4gDQo+Pj4+IEF0IHRoZSBtb21lbnQsIDMpIGlzIGFwcGVhbGlu
ZyBtZSB0aGUgbW9zdC4gSSB3b3VsZCBiZSBpbnRlcmVzdGVkIHRvDQo+Pj4+IGhhdmUgYW4gb3Bp
b25pb25zIGZyb20gdGhlIG90aGVyIG1haW50YWluZXJzLg0KPj4+IA0KPj4+IEZ3aXcgb2YgdGhl
IG5hbWVkIGFsdGVybmF0aXZlcyBJIHdvdWxkIGFsc28gcHJlZmVyIDMuIFdoZXRoZXIgdGhpbmdz
DQo+Pj4gcmVhbGx5IG5lZWQgZ2VuZXJhbGl6aW5nIGF0IHRoaXMgcG9pbnQgSSdtIG5vdCBzdXJl
LCB0aG91Z2guDQo+PiBJIGFtIHdvcnJ5IHRoYXQgd2UgbWF5IGVuZCB1cCB0byBmb3JnZXQgdGhh
dCB3ZSBoYWQgbm9uLWdlbmVyYWljIHdheSANCj4+IChlLmcuIE1BWF9TVEFUSUNfUE9SVCkgdG8g
cHJldmVudCB0cmlnZ2VyIHRoZSBpc3N1ZS4gU28gd2UgY291bGQgZW5kIHVwIA0KPj4gdG8gbWlz
dGFrZW5seSBpbnRyb2R1Y2UgYSBzZWN1cml0eSBpc3N1ZS4NCj4+IA0KPj4gSG93ZXZlciwgbXkg
cG9pbnQgd2FzIGxlc3MgYWJvdXQgZ2VuZXJhbGl6YXRpb24gYnV0IG1vcmUgYWJvdXQgDQo+PiBp
bnRyb2R1Y2luZyBDT05GSUdfTUFYX1NUQVRJQ19QT1JULg0KPj4gDQo+PiBJdCBzZWVtcyBzdHJh
bmdlIHRvIGxldCB0aGUgYWRtaW4gdG8gZGVjaWRlIHRoZSBtYXhpbXVtIG51bWJlciBvZiBzdGF0
aWMgDQo+PiBwb3J0IHN1cHBvcnRlZC4NCj4gDQo+IFdoeSAoYXNzdW1pbmcgcy9hZG1pbi9idWls
ZCBhZG1pbi8pPyBJIHZpZXcgYm90aCBhIGJ1aWxkIHRpbWUgdXBwZXIgYm91bmQNCj4gYXMgd2Vs
bCBhcyAoYWx0ZXJuYXRpdmVseSkgYSBjb21tYW5kIGxpbmUgZHJpdmVuIHVwcGVyIGJvdW5kIGFz
IHJlYXNvbmFibGUNCj4gKGluIHRoZSBsYXR0ZXIgY2FzZSB0aGVyZSBvZiBjb3Vyc2Ugc3RpbGwg
d291bGQgd2FudC9uZWVkIHRvIGJlIGFuIHVwcGVyDQo+IGJvdW5kIG9uIHdoYXQgaXMgbGVnaXRp
bWF0ZSB0byBzcGVjaWZ5IGZyb20gdGhlIGNvbW1hbmQgbGluZSkuIFVzaW5nDQo+IHN0YXRpYyBw
b3J0cyBhZnRlciBhbGwgbWVhbnMgdGhlcmUncyBhIHN0YXRpYyBsYXJnZXN0IHBvcnQgbnVtYmVy
Lg0KPiBEZXRlcm1pbmVkIGFjcm9zcyBhbGwgaW50ZW5kZWQgdXNlcyBvZiBhIGJ1aWxkIHN1Y2gg
YW4gdXBwZXIgYm91bmQgY2FuIGJlDQo+IGEgZmVhc2libGUgbWVjaGFuaXNtLg0KDQpJIGFncmVl
IHdpdGggdGhpcy4gUmlnaHQgbm93IGFsbCBzdGF0aWMgcG9ydCBtdXN0IGJlIGRlZmluZWQgb24g
Ym9vdCBzbyB0aGlzIGlzIGZ1bGx5DQpvayB0byBoYXZlIGEgbWF4aW11bSBjb21waWxhdGlvbiB2
YWx1ZSBvciBzb21ldGhpbmcgdGhhdCBjYW4gYmUgY3VzdG9taXNlZA0Kb24gY29tbWFuZCBsaW5l
Lg0KSW4gdGhpcyBjYXNlIHRoZSBhZG1pbiBtdXN0IGJlIGZ1bGx5IGF3YXJlIG9mIHdoYXQgaGUg
ZG9lcyBmcm9tIHRoZSBzdGFydC4NCg0KQWxzbyB3aGF0ZXZlciB2YWx1ZSB3ZSBkZWZpbmUgYXMg
ZGVmYXVsdCB3aWxsIHByb2JhYmx5IGJlIGZhciBiaWdnZXIgdGhhbiBhbnkNCnJlYWwgdXNlIGNh
c2UgSSB0aGluay4NCg0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQoNCg==

