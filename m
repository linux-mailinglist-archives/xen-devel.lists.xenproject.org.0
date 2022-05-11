Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD4523592
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326975.549664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonOI-0006Vl-AS; Wed, 11 May 2022 14:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326975.549664; Wed, 11 May 2022 14:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonOI-0006SJ-7O; Wed, 11 May 2022 14:32:38 +0000
Received: by outflank-mailman (input) for mailman id 326975;
 Wed, 11 May 2022 14:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KGj=VT=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nonOG-0006S0-1M
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:32:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 322f3bc3-d137-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 16:32:34 +0200 (CEST)
Received: from DB6PR0402CA0023.eurprd04.prod.outlook.com (2603:10a6:4:91::33)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 14:32:21 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::b0) by DB6PR0402CA0023.outlook.office365.com
 (2603:10a6:4:91::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 14:32:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 14:32:21 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Wed, 11 May 2022 14:32:21 +0000
Received: from f7ac67b3825a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CB356FF-6A02-4D43-8EE1-4F60662E25DF.1; 
 Wed, 11 May 2022 14:32:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7ac67b3825a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 14:32:14 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 VI1PR08MB3024.eurprd08.prod.outlook.com (2603:10a6:803:45::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Wed, 11 May 2022 14:32:12 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:32:12 +0000
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
X-Inumbo-ID: 322f3bc3-d137-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WbWI1uv/ITPu28AT9OlxO+Q6op1geG+a1BU1q2wU8AjhFwd+s7SOLd5XH9MJljZY7VSny4+yyZo61KLGOyNOUQ/vRscT+9cZZQa//XhOzCtlDhAP/Wt1XymIsCZ+YucnLm+0oTT8Bh9nN9S4NwQijcfEPKqTXLA8k4dIUc22bFMaRafon6YIi5hh1oUemN2xGGI3AglcGW7RArBorRKZ8CMCBpMghlGiZ9x+vVoQ4r8BfN1137EGMev2O8Yeuo4wxo4+g/IFhOKJGGmj68YNyOI8S9YVBD8QvmBcNXJTqRo923M6PUS0EsVWhjkuVpc+/koDcvyrOA4up/WY4F5I6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enBMQK0dPx4KY+Ea7ZkAJcVaM7PbJR8pO6XB8EeJtmo=;
 b=SE76akA3B0N8nxzyMBDe4/aDOyLgZ1iDeDfvI+4Aa5aB3HYc77K02atomKvzmm2oFbqzdaZoAUVerDEW9JohsFobAURvMWnqiZSKqFDPZuT4dRQfpQsltoAjRMlM7HgD4uQ/mhiGLPPQsIE0kOtdphjpDRe2THbk5XXbW2FSltYZWBScI27WXbmdbIHrq1t31zpbEnUN0/2WH7FKHi51ZMRgcbBVcK/u1zU5/srF9IU1oL2BrZTWx8c92LqNhnNwpEniJUuTnh7n/wAyMQMWwyDBfIiWafCDmrhU8gMDuN5Rg+UetFcmwiyB4M/f3t2e3U0vUJqxm4mAzf2yY4bTXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enBMQK0dPx4KY+Ea7ZkAJcVaM7PbJR8pO6XB8EeJtmo=;
 b=9VTKfoeQcMPX63QprBQBBLfjL14HeQHTIgXoVk67CiN1e4ySvVCTdsH7n2huRG0I96KlDT1IFXUuTQRG3s//px5sJOQjvbS35492JofZIkzstrwFbd+7RVqVN0yf27RXW0tvTfiKtFqbNkyTBAZv3+KeTXvWk/HmuKBPfztoYzc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e302cca1c95d8f3e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1DTzPk8gZ7o5nsrod4PZw1V81CGZ+nBfbxEiHrd1qYUz0zIZmjOABzA6v+LCPfr9L/gr6mENc6pHT8WpkmJzXrPSwiL05dIJUV+5DEswHf1VnUTQnzYgko99J6D6uTtkeYntxAPNqLAvHk+VBKu9sykex0r9Q/6EQ9HXg4YjGwwq+a+Uu69D4RWBL5IWidE7nGe1d8egxD66daSeVzWDz5lnxpt/exxiIow4pZcvgc3IC+ripmKPuIxmEwkkNlq0PwVs8LU+zGd13Cq592Y53+yNNQxwd62OqOTTb3q56DpOwSAdZvzWk0Ag7ouUk3f+BYiGXUbMhAazEw8X3FCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enBMQK0dPx4KY+Ea7ZkAJcVaM7PbJR8pO6XB8EeJtmo=;
 b=iAKuf31r0rOffH3zCVtV9pg2YfSiHS4DqGNtudz9RI9ekD1utYS2BvSIr4BvRAECjoOiOkR1O3mfrfznN3Ggk+mFuPZQHQgZL/kLBRPuh2cTQfJOAnbZ0Ys4stV+chEnhw0EJGabOgq4HaLClECNaEkvqn0Gxed5c0+iXGvElsFXR0VgQGsskNH/+FNnnHcHFoy1mSWKlU+6HoeLYm5W5BE8H62siUGhdhkfuxF+6CLtsJeqVraVHIgbAGs9XD3yYjMtwugSvdXc3/SmOSpZwwL149Xc7mNJPo1z0l/1U+fOEnVnBQdEH2WeAGrTL6lfczKA+jlnX2yr9haNS61YnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enBMQK0dPx4KY+Ea7ZkAJcVaM7PbJR8pO6XB8EeJtmo=;
 b=9VTKfoeQcMPX63QprBQBBLfjL14HeQHTIgXoVk67CiN1e4ySvVCTdsH7n2huRG0I96KlDT1IFXUuTQRG3s//px5sJOQjvbS35492JofZIkzstrwFbd+7RVqVN0yf27RXW0tvTfiKtFqbNkyTBAZv3+KeTXvWk/HmuKBPfztoYzc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
Thread-Topic: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
Thread-Index: AQHYX91LOZcKc9ovCE+M72ipF+LMFK0YFGsAgAGzp4A=
Date: Wed, 11 May 2022 14:32:12 +0000
Message-ID: <A06FC2FB-56CF-4DB6-BF59-7F2CECA0C9D9@arm.com>
References:
 <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
 <cd402709-619f-7189-3d95-fea4ad6bf637@xen.org>
In-Reply-To: <cd402709-619f-7189-3d95-fea4ad6bf637@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b29ff9e5-18fd-4184-c1b5-08da335b0ee2
x-ms-traffictypediagnostic:
	VI1PR08MB3024:EE_|DBAEUR03FT057:EE_|AM8PR08MB6514:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6514D5FFEBFD674295DC9067FCC89@AM8PR08MB6514.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kA0axndYz37e5byyRAvhRYrQY9AULLoJRaVjgk+LELSRYtkOrQV4rBDpqjKPiVzYi4FK+6EMpRAoiJ15LD7KHYPr0aeRDG9IKw4cIYWluX9m53EJN46JuIsiKs9ok6+RbzSAuEgYFL9z6JPOnuHOQkjN9rKJW4o1WkqhOzbI+Ued+gyIQk25E9IqmdV2yTfz6UbCelFxpGMxE0d6J9VC3MJFbYf0Z+gqKw75wbcoHcuiYL7vswf0mmwDSketAaVdg8to3PNbkNu6Enn/EGHCC8hKFjFmIu+MQxLTQ9GMonFx2OSMdPd8UHp4ADVnAQZMEbYAb6AcdB+BPbKdp15srwoRHpmHFp8whShJROOj2U9TIFRxDlBgk/DJR5KyWUSFESNI8ElhqFJiBjPNncYntE9jEdiOZjsYC9QDkydCpX8PEozRJDMlK5wileAcxXIVnDLuqgd8jA/ycJbYnR/eJPFvwlVutL4puqomqucHK0M8/4NeusR+FqW4MkdtvnFxZ37k6FlZGT1eqCln991jtTzMUy7QjoT3lk73VUwasfOmq3JqM+wH6RMgOwS5cQ/nPxJ5NIwn28WwdEo8pEQiT5Dl2XfTvCEeji5jUd2xMSCcdjS6eRSSY0WmNY740jEwySykHMS3WoIVeX9odz5RPEG1TXbyqOyQtOr/m6i1bSCmi0J0S4F7w6N1w2IroyORqEDtfmlQJOF2WM6W+i36MqOcvMC/w4dwjCVZzl48SDhJlg1uCerw3H4zZJiHBMQ0/qxSlr0xhaaz28Rgorgv3v7bPN60h3hPp0Bv/fX5BezTPD+vkt8ZSUEBX0j1sXRdFtmnZd0CDO47bg3pBcL5ng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6512007)(26005)(2616005)(186003)(76116006)(66556008)(66446008)(66476007)(64756008)(66946007)(8676002)(4326008)(33656002)(5660300002)(36756003)(54906003)(316002)(6916009)(2906002)(8936002)(91956017)(38100700002)(38070700005)(6486002)(508600001)(6506007)(71200400001)(86362001)(53546011)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <41362E96463BA64E84CFE7150E809966@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3024
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0015b032-d96f-4623-2126-08da335b097d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TLEUYl9q95N8Fd4rgxMLJkWfjlxmjeRZgHJhwfNq5k0IBdU/MTYfBBMRfOFe7Q/rm4Xk+1VDjP19ul08ltRzlI1705EUo7KMfjQmmEZKaaoYzWOCya4E6U63Ag5ERTI9DBeipOWiXjKFITzFAlM317dMQRrMTrz3RtLtBlLg8dL6qZZfDvFSQv/PcIuwdvjHzfFUg4Z5bFTcpaeNZxv9zBZ//qva/CARUxFKzlAF3tvQNOz3lbJtPdByXv/4tBmhgqd1SAwUjGP7Y4M3GIk+BlbGkZa5Qh5zsrwxGlARGus3vxZIcoo9/CqyuA5dWiAmIrBOYLWBxgdOqt63aIHcNVfv7hLs54ox/jDxtUYdshztcPS3ywWyUhIfU7kJ0XOrh8N9Z3JF2AV7QiYTQ8gAik0WDjGmk7BVUGDAq7b/SADayeeYo3x9DD1A0vzD/0Ow2SOcEhCeCPF3/3mfThyddjrVFZXOgkSneVPgvE8K9oS9JnHEqYKEaCIKcfR4WyU2FGY7vJ921sVQZWcw+g+g3mAa4YDihT7cx9dIIa9isJM6jwhTI6vO3eB3izl2dAWXmcmqNPk3DzEfN8wpZmiIqPdJey7q7V8tQBu5gz0cT7NxC+Q9us01rqQAB1P5zbwglb1laqBBNuy4qnztAMuEpShcgX9IcO3mjzMYTTepwIDKT1n/a/utAYkymWdK0KNLHDzshTWYeurmZM6q8SwngVDYrIIzH0sY14X4o6b+s2sQO7PP/WCURTyE6ZzGKMuzKnyfCS9LUHXEFC36C26xuA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(6512007)(26005)(70586007)(316002)(70206006)(6486002)(47076005)(2906002)(81166007)(40460700003)(36860700001)(186003)(6862004)(4326008)(54906003)(8676002)(336012)(356005)(82310400005)(33656002)(86362001)(2616005)(6506007)(83380400001)(8936002)(5660300002)(53546011)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:32:21.1128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b29ff9e5-18fd-4184-c1b5-08da335b0ee2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514

SGkgSnVsaWVuDQoNCj4gT24gMTAgTWF5IDIwMjIsIGF0IDE6MzIgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiBPbiAwNC8wNS8y
MDIyIDE4OjM0LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBh
IG5ldyBmZWF0dXJlIHRvIHN1cHBvcnQgdGhlIHNpZ25hbGluZyBiZXR3ZWVuDQo+PiB0d28gZG9t
YWlucyBpbiBkb20wbGVzcyBzeXN0ZW0uDQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8
cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gdjIgY2hhbmdlczoNCj4+IC0gc3dpdGNo
IHRvIHRoZSBvbmUtc3Vibm9kZS1wZXItZXZ0Y2huIHVuZGVyIHhlbixkb21haW4iIGNvbXBhdGli
bGUgbm9kZS4NCj4+IC0gQWRkIG1vcmUgZGV0YWlsIGFib3V0IGV2ZW50LWNoYW5uZWwNCj4+IC0t
LQ0KPj4gZG9jcy9kZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5tZCB8IDEyNiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiANCj4gQW5zd2VyaW5nIGhlcmUgdG8gYWxzbyBrZWVwIHRo
ZSBoaXN0b3J5LiBPbiBJUkMsIEJlcnRyYW5kIHdhcyBhc2tpbmcgd2hldGhlciB3ZSBtZXJnZSBk
ZXNpZ24gcHJvcG9zYWwuDQo+IA0KPiBXZSBoYXZlIG1lcmdlZCBwcm9wb3NhbCBpbiB0aGUgcGFz
dCAoZS5nLiBub24tY29vcGVyYXRpdmUgbWlncmF0aW9uKSBhbmQgSSB3b3VsZCBiZSByZWFkeSB0
byBkbyBpdCBhZ2FpbiBhcyBpdCBpcyBlYXNpZXIgdG8gZmluZCB0aGVtIGFmdGVyd2FyZHMuDQo+
IA0KPiBIb3dldmVyLCBJIHdvbmRlciB3aGV0aGVyIGl0IHdvdWxkIGJlIGJldHRlciB0byB0dXJu
IHRoaXMgcHJvcG9zYWwgdG8gYSBiaW5kaW5nIGNoYW5nZSBpbiBtaXNjL2FybS9kZXZpY2UtdHJl
ZS8uIEFueSB0aG91Z2h0cz8NCg0KSSBhbSBva2F5IHdpdGggdGhhdC4gSSB0aGluayBhcmUgeW91
IHJlZmVycmluZyB0byAiZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS8g4oCcIA0KPiANCj4+IDEg
ZmlsZSBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygrKQ0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRv
Y3MvZGVzaWducy9kb20wbGVzcy1ldnRjaG4ubWQNCj4+IGRpZmYgLS1naXQgYS9kb2NzL2Rlc2ln
bnMvZG9tMGxlc3MtZXZ0Y2huLm1kIGIvZG9jcy9kZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5tZA0K
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLjYyZWM4YTQwMDkN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2RvY3MvZGVzaWducy9kb20wbGVzcy1ldnRjaG4u
bWQNCj4+IEBAIC0wLDAgKzEsMTI2IEBADQo+PiArIyBTaWduYWxpbmcgc3VwcG9ydCBiZXR3ZWVu
IHR3byBkb21VcyBvbiBkb20wbGVzcyBzeXN0ZW0NCj4+ICsNCj4+ICsjIyBDdXJyZW50IHN0YXRl
OuKAr0RyYWZ0IHZlcnNpb24NCj4+ICsNCj4+ICsjIyBQcm9wb3NlcihzKTogUmFodWwgU2luZ2gs
IEJlcnRyYW5kIE1hcnF1aXMNCj4+ICsNCj4+ICsjIyBQcm9ibGVtIFN0YXRlbWVudDoNCj4+ICsN
Cj4+ICtEb20wbGVzcyBndWVzdHMgd291bGQgYmVuZWZpdCBmcm9tIGEgc3RhdGljYWxseS1kZWZp
bmVkIG1lbW9yeSBzaGFyaW5nIGFuZA0KPj4gK3NpZ25hbGx5IHN5c3RlbSBmb3IgY29tbXVuaWNh
dGlvbi4gT25lIHRoYXQgd291bGQgYmUgaW1tZWRpYXRlbHkgYXZhaWxhYmxlIGF0DQo+PiArYm9v
dCB3aXRob3V0IGFueSBuZWVkIGZvciBkeW5hbWljIGNvbmZpZ3VyYXRpb25zLg0KPj4gKw0KPj4g
K0luIGVtYmVkZGVkIGEgZ3JlYXQgdmFyaWV0eSBvZiBndWVzdCBvcGVyYXRpbmcgc3lzdGVtIGtl
cm5lbHMgZXhpc3QsIG1hbnkgb2YNCj4+ICt3aGljaCBkb24ndCBoYXZlIHN1cHBvcnQgZm9yIHhl
bnN0b3JlLCBncmFudCB0YWJsZSwgb3Igb3RoZXIgY29tcGxleCBkcml2ZXJzLg0KPiANCj4gSSBh
bSBub3Qgc3VyZSBJIHdvdWxkIGNvbnNpZGVyIGV2ZW50IGNoYW5uZWwgRklGTyBhICJ0cml2YWwi
IGRyaXZlcnMgOikuDQo+IA0KPj4gK1NvbWUgb2YgdGhlbSBhcmUgc21hbGwga2VybmVsLXNwYWNl
IGFwcGxpY2F0aW9ucyAob2Z0ZW4gY2FsbGVkICJiYXJlbWV0YWwiLA0KPj4gK25vdCB0byBiZSBj
b25mdXNlZCB3aXRoIHRoZSB0ZXJtICJiYXJlbWV0YWwiIHVzZWQgaW4gdGhlIGRhdGEgY2VudGVy
IHdoaWNoDQo+PiArbWVhbnMgIndpdGhvdXQgaHlwZXJ2aXNvcnMiKSBvciBSVE9TZXMuIEFkZGl0
aW9uYWxseSwgZm9yIHNhZmV0eSByZWFzb25zLCB1c2Vycw0KPj4gK29mdGVuIG5lZWQgdG8gYmUg
YWJsZSB0byBjb25maWd1cmUgdGhlIGZ1bGwgc3lzdGVtIHN0YXRpY2FsbHkgc28gdGhhdCBpdCBj
YW4NCj4+ICtiZSB2ZXJpZmllZCBzdGF0aWNhbGx5Lg0KPj4gKw0KPj4gK0V2ZW50IGNoYW5uZWxz
IGFyZSB2ZXJ5IHNpbXBsZSBhbmQgY2FuIGJlIGFkZGVkIGV2ZW4gdG8gYmFyZW1ldGFsIGFwcGxp
Y2F0aW9ucy4NCj4+ICtUaGlzIHByb3Bvc2FsIGludHJvZHVjZXMgYSB3YXkgdG8gZGVmaW5lIHRo
ZW0gc3RhdGljYWxseSB0byBtYWtlIHRoZW0gc3VpdGFibGUNCj4+ICtmb3IgZG9tMGxlc3MgZW1i
ZWRkZWQgZGVwbG95bWVudHMuDQo+PiArDQo+PiArIyMgUHJvcG9zYWw6DQo+PiArDQo+PiArRXZl
bnQgY2hhbm5lbHMgYXJlIHRoZSBiYXNpYyBwcmltaXRpdmUgcHJvdmlkZWQgYnkgWGVuIGZvciBl
dmVudCBub3RpZmljYXRpb25zLg0KPj4gK0FuIGV2ZW50IGNoYW5uZWwgaXMgYSBsb2dpY2FsIGNv
bm5lY3Rpb24gYmV0d2VlbiAyIGRvbWFpbnMgKG1vcmUgc3BlY2lmaWNhbGx5DQo+PiArYmV0d2Vl
biBkb20xLHBvcnQxLCBhbmQgZG9tMixwb3J0MikuIEVhY2ggZXZlbnQgaGFzIGEgcGVuZGluZyBh
bmQgYSBtYXNrZWQgYml0Lg0KPj4gK1RoZSBwZW5kaW5nIGJpdCBpbmRpY2F0ZXMgdGhlIGV2ZW50
IGhhcyBiZWVuIHJhaXNlZC4gVGhlIG1hc2tlZCBiaXQgaXMgdXNlZCBieQ0KPj4gK3RoZSBkb21h
aW4gdG8gcHJldmVudCB0aGUgZGVsaXZlcnkgb2YgdGhhdCBzcGVjaWZpYyBldmVudC4gWGVuIG9u
bHkgcGVyZm9ybXMgYQ0KPj4gKzAg4oaSIDEgdHJhbnNpdGlvbiBvbiB0aGUgcGVuZGluZyBiaXRz
IGFuZCBkb2VzIG5vdCB0b3VjaCB0aGUgbWFzayBiaXQuIFRoZQ0KPiANCj4gTklUOiBJIHRoaW5r
IOKGkiBpcyBub3QgYW4gYXNjaWkgY2hhcmFjdGVyLiBDYW4geW91IHVzZSAiLT7igJ0/DQpBY2su
IA0KPiANCj4+ICtkb21haW4gbWF5IHRvZ2dsZSBtYXNrZWQgYml0cyBpbiB0aGUgbWFza2VkIGJp
dCBmaWVsZCBhbmQgc2hvdWxkIGNsZWFyIHRoZQ0KPj4gK3BlbmRpbmcgYml0IHdoZW4gYW4gZXZl
bnQgaGFzIGJlZW4gcHJvY2Vzc2VkDQo+PiArDQo+PiArRXZlbnRzIGFyZSByZWNlaXZlZCBieSBh
IGRvbWFpbiB2aWEgYW4gaW50ZXJydXB0IGZyb20gWGVuIHRvIHRoZSBkb21haW4sDQo+PiAraW5k
aWNhdGluZyB3aGVuIGFuIGV2ZW50IGFycml2ZXMgKHNldHRpbmcgdGhlIGJpdCkuIEZ1cnRoZXIg
bm90aWZpY2F0aW9ucyBhcmUNCj4+ICtibG9ja2VkIHVudGlsIHRoZSBiaXQgaXMgY2xlYXJlZCBh
Z2Fpbi4gRXZlbnRzIGFyZSBkZWxpdmVyZWQgYXN5bmNocm9ub3VzbHkgdG8NCj4+ICthIGRvbWFp
biBhbmQgYXJlIGVucXVldWVkIHdoZW4gdGhlIGRvbWFpbiBpcyBub3QgcnVubmluZy4NCj4+ICtN
b3JlIGluZm9ybWF0aW9uIGFib3V0IEZJRk8gYmFzZWQgZXZlbnQgY2hhbm5lbCBjYW4gYmUgZm91
bmQgYXQ6DQo+IA0KPiBJIHRoaW5rIHRoZSBleHBsYW5hdGlvbiBpcyBmaW5lIGZvciBhIGRlc2ln
biBwcm9wb3NhbC4gSWYgeW91IHdhbnQgdG8gdXNlIGl0IGFzIGRvY3VtZW50YXRpb24sIHRoZW4g
SSB3b3VsZCBzdWdnZXN0IHRvIGNsYXJpZnkgdGhlcmUgYXJlIHR3byBkaWZmZXJlbnQgQUJJIGZv
ciBldmVudCBjaGFubmVsOiBGSUZPIGFuZCAyTC4NCj4gDQo+IDJMIGlzIHRoZSBlYXNpZXN0IG9u
ZSB0byBpbXBsZW1lbnQgYW5kIGZvciBlbWJlZGRlZCB3ZSBtYXkgd2FudCB0byBzdGVlciB0aGUg
dXNlcnMgdG93YXJkcyBpdC4NCg0KSSB3aWxsIHJlcGhyYXNlIHRoZSBzZW50ZW5jZSBhcyBiZWxv
dzoNCg0KWGVuIHN1cHBvcnRzIHR3byBkaWZmZXJlbnQgQUJJIGZvciBldmVudCBjaGFubmVsIEZJ
Rk8gYW5kIDJMLiBNb3JlIGluZm9ybWF0aW9uIGFib3V0IEZJRk8gYmFzZWQgZXZlbnQgY2hhbm5l
bCBjYW4gYmUgZm91bmQgYXQ6DQoNCj4gDQo+PiAraHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvcGVv
cGxlL2R2cmFiZWwvZXZlbnQtY2hhbm5lbHMtSC5wZGYNCj4gDQo+IEl0IGlzIHF1aXRlIHVuZm9y
dHVuYXRlIHRoYXQgdGhpcyB3YXNuJ3QgbWVyZ2VkIGluIGRvY3MvLiBPaCB3ZWxsLCBubyBhY3Rp
b24gZm9yIHlvdSBoZXJlLg0KPiANCj4+ICsNCj4+ICtUaGUgZXZlbnQgY2hhbm5lbCBjb21tdW5p
Y2F0aW9uIHdpbGwgYmUgZXN0YWJsaXNoZWQgc3RhdGljYWxseSBiZXR3ZWVuIHR3bw0KPj4gK2Rv
bWFpbnMgKGRvbTAgYW5kIGRvbVUgYWxzbykgYmVmb3JlIHVucGF1c2luZyB0aGUgZG9tYWlucyBh
ZnRlciBkb21haW4gY3JlYXRpb24uDQo+PiArRXZlbnQgY2hhbm5lbCBjb25uZWN0aW9uIGluZm9y
bWF0aW9uIGJldHdlZW4gZG9tYWlucyB3aWxsIGJlIHBhc3NlZCB0byBYRU4gdmlhDQo+IA0KPiBO
SVQ6IGFib3ZlIHlvdSBhcmUgdXNpbmcgIlhlbiIuIFNvIHMvWEVOL1hlbi8gZm9yIGNvbnNpc3Rl
bmN5Lg0KDQpBY2suIA0KPiANCj4+ICt0aGUgZGV2aWNlIHRyZWUgbm9kZS4gVGhlIGV2ZW50IGNo
YW5uZWwgd2lsbCBiZSBjcmVhdGVkIGFuZCBlc3RhYmxpc2hlZA0KPj4gK2JlZm9yZWhhbmQgaW4g
WEVOIGJlZm9yZSB0aGUgZG9tYWluIHN0YXJ0ZWQuIFRoZSBkb21haW4gZG9lc27igJl0IG5lZWQg
dG8gZG8gYW55DQo+IA0KPiBTYW1lIGhlcmUuDQo+IA0KPiBOSVQ6IEkgdGhpbmsgImJlZm9yZWhh
bmQiIGFuZCAiYmVmb3JlIiBpcyByZWR1bmRhbnQuDQoNCkFjay4gDQo+IA0KPj4gK29wZXJhdGlv
biB0byBlc3RhYmxpc2ggYSBjb25uZWN0aW9uLiBEb21haW4gb25seSBuZWVkcyBoeXBlcmNhbGwN
Cj4+ICtFVlRDSE5PUF9zZW5kKGxvY2FsIHBvcnQpIHRvIHNlbmQgbm90aWZpY2F0aW9ucyB0byB0
aGUgcmVtb3RlIGd1ZXN0Lg0KPj4gKw0KPj4gK1RoZXJlIGlzIG5vIG5lZWQgdG8gZGVzY3JpYmUg
dGhlIHN0YXRpYyBldmVudCBjaGFubmVsIGluZm8gaW4gdGhlIGRvbVUgZGV2aWNlDQo+PiArdHJl
ZS4gU3RhdGljIGV2ZW50IGNoYW5uZWxzIGFyZSBvbmx5IHVzZWZ1bCBpbiBmdWxseSBzdGF0aWMg
Y29uZmlndXJhdGlvbnMsDQo+PiArYW5kIGluIHRob3NlIGNvbmZpZ3VyYXRpb25zIHRoZSBkb21V
IGRldmljZSB0cmVlIGR5bmFtaWNhbGx5IGdlbmVyYXRlZCBieSBYZW4NCj4+ICtpcyBub3QgbmVl
ZGVkLg0KPj4gKw0KPj4gK1VuZGVyIHRoZSAieGVuLGRvbWFpbiIgY29tcGF0aWJsZSBub2RlLCB0
aGVyZSBuZWVkIHRvIGJlIHN1Yi1ub2RlcyB3aXRoDQo+PiArY29tcGF0aWJsZSAieGVuLGV2dGNo
biIgdGhhdCBkZXNjcmliZSB0aGUgZXZlbnQgY2hhbm5lbCBjb25uZWN0aW9uIGJldHdlZW4gdHdv
DQo+PiArZG9tYWlucyhkb20wIGFuZCBkb21VIGFsc28pLg0KPiANCj4gQmVsb3cgeW91IHByb3Zp
ZGVkIGFuIGV4YW1wbGUgYmV0d2VlbiB0d28gZG9tVXMuIENhbiB5b3UgcHJvdmlkZSBvbmUgYmV0
d2VlbiBkb20wIGFuZCBhIGRvbVU/DQpZZXMgSSB3aWxsIHByb3ZpZGUgYW4gZXhhbXBsZSBiL3cg
ZG9tMCBhbmQgZG9tVSBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPj4gKw0KPj4gK1RoZSBldmVudCBj
aGFubmVsIHN1Yi1ub2RlIGhhcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6DQo+PiArDQo+PiAr
LSBjb21wYXRpYmxlDQo+PiArDQo+PiArICJ4ZW4sZXZ0Y2huIg0KPj4gKw0KPj4gKy0geGVuLGV2
dGNobg0KPj4gKw0KPj4gKyBUaGUgcHJvcGVydHkgaXMgdHVwbGVzIG9mIHR3byBudW1iZXJzDQo+
PiArIChsb2NhbC1ldnRjaG4gbGluay10by1mb3JlaWduLWV2dGNobikgd2hlcmU6DQo+PiArDQo+
PiArIGxvY2FsLWV2dGNobiBpcyBhbiBpbnRlZ2VyIHZhbHVlIHRoYXQgd2lsbCBiZSB1c2VkIHRv
IGFsbG9jYXRlIGxvY2FsIHBvcnQNCj4+ICsgZm9yIGEgZG9tYWluIHRvIHNlbmQgYW5kIHJlY2Vp
dmUgZXZlbnQgbm90aWZpY2F0aW9ucyB0by9mcm9tIHRoZSByZW1vdGUNCj4+ICsgZG9tYWluLg0K
PiBQb3J0IDAgaXMgcmVzZXJ2ZWQgYW5kIGJvdGggRklGTy8yTCBoYXZlIGxpbWl0IG9uIHRoZSBw
b3J0IG51bWJlcnMuDQo+IA0KPiBJIHRoaW5rIHdlIHNob3VsZCBsZXQga25vdyB0aGUgdXNlcnMg
YWJvdXQgdGhvc2UgbGltaXRhdGlvbnMgYnV0IEkgYW0gbm90IHN1cmUgd2hldGhlciB0aGUgYmlu
ZGluZyBpcyB0aGUgcmlnaHQgcGxhY2UgZm9yIHRoYXQuDQoNCklmIHlvdSBhcmUgb2theSBJIGNh
biBhZGQgdGhpcyBsaW1pdGF0aW9uIGluIHRoaXMgZGVzaWduIGRvYy4NCg0KPj4gKw0KPj4gKyBs
aW5rLXRvLWZvcmVpZ24tZXZ0Y2huIGlzIGEgc2luZ2xlIHBoYW5kbGUgdG8gYSByZW1vdGUgZXZ0
Y2huIHRvIHdoaWNoDQo+PiArIGxvY2FsLWV2dGNobiB3aWxsIGJlIGNvbm5lY3RlZC4NCj4gDQo+
IEkgd291bGQgY29uc2lkZXIgdG8gcmVsYXggdGhlIHdvcmRpbmcgc28gYSB1c2VyIGNhbiBjcmVh
dGUgYW4gZXZlbnQgY2hhbm5lbCB3aXRoIHRoZSBib3RoIGVuZCBpbiB0aGUgc2FtZSBkb21haW4u
DQo+IA0KPiBJbXBsZW1lbnRhdGlvbiB3aXNlLCBpdCBzaG91bGQgbWFrZSBubyBkaWZmZXJlbmNl
IGFzIHlvdSBzdGlsbCBuZWVkIHRvIGxvb2t1cCB0aGUgZG9tYWluLg0KDQpJIHdpbGwgcmVwaHJh
c2UgYXM6DQpsaW5rLXRvLWZvcmVpZ24tZXZ0Y2huIGlzIGEgc2luZ2xlIHBoYW5kbGUgdG8gYSBm
b3JlaWduIGV2dGNobiB0byB3aGljaA0KICAgICAgIGxvY2FsLWV2dGNobiB3aWxsIGJlIGNvbm5l
Y3RlZC4NCg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

