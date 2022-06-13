Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06E547E24
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 05:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347691.574026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0akU-0007Vp-I0; Mon, 13 Jun 2022 03:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347691.574026; Mon, 13 Jun 2022 03:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0akU-0007TG-Eb; Mon, 13 Jun 2022 03:28:18 +0000
Received: by outflank-mailman (input) for mailman id 347691;
 Mon, 13 Jun 2022 03:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5ko=WU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o0akT-0007Rd-0r
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 03:28:17 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db2ba1c5-eac8-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 05:28:14 +0200 (CEST)
Received: from AS8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:310::6)
 by VI1PR08MB2927.eurprd08.prod.outlook.com (2603:10a6:802:21::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Mon, 13 Jun
 2022 03:28:08 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::17) by AS8PR04CA0001.outlook.office365.com
 (2603:10a6:20b:310::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20 via Frontend
 Transport; Mon, 13 Jun 2022 03:28:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 03:28:07 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Mon, 13 Jun 2022 03:28:07 +0000
Received: from 616c64f372da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5F8E906-9A1F-4D38-B081-8557E32F28C6.1; 
 Mon, 13 Jun 2022 03:28:00 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 616c64f372da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Jun 2022 03:28:00 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AS8PR08MB6887.eurprd08.prod.outlook.com (2603:10a6:20b:38e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Mon, 13 Jun
 2022 03:27:57 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 03:27:57 +0000
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
X-Inumbo-ID: db2ba1c5-eac8-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=M7arhBqeI2hOebPQZZuHAQNO28/O78dmIetscEJFYSr0YcianbCkvd07a6kQC8uMO/xYVzKo+kdXq4TWfWlGJVDjUwkiPrUC95onh8eU7T1nCptKUkm1h9muqaFbmyzdXCRdNUC54zmRYTfREN6Kais56DNQEOWsz/L2kiP9IXCKeAsX7GHuR0sNnD696DeNV/TjTNKigkhopCfeWJcZyslvEZ/0IWJ5F4IRRWT7JiXI5/lP5qYCs382qCXbFpIKXHCgDR7rZu8F4DTlXARNoHTdN+LQwkEMUpxMlXSQamWcvVUsxPam0MFT02S23yeVUk6cLm4gpmhFD+5Wz0bhdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfKWvJ0OYjmx4LqA7vYDLNLOfUmHgMZfQzfCSQzUGHQ=;
 b=EnH9mu6gCVt0IY9PopWguCyBdlsaMSJOzz8aijiTAI7IcZipmFjFlyeZgUxAvFBnBrB0yym4wZ4YFbaFKLHo++BA1cIWcC0HbfYP9DNI74pllt2VDRgpGJGdq3Qibct1IesKXV7SaoQCjxY6uxZsNkFXriAslLpoRBwxXDHkrEjeidGF9NvFpkWR1Zb8qlVlRFza6R4JzK//C4qwGvyBHsH9YyYlvvhQgUSWro/0+0rqSVsKLq5vLT1az3Y9WfqdejzpYtzWJ74rSgc0/uJ+UeGqWAC/hxdTZSJeN4r0DfHZJUioNCsUr48GOdEjr0mLQLbn3KPtPUfQoMDfF2JW+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfKWvJ0OYjmx4LqA7vYDLNLOfUmHgMZfQzfCSQzUGHQ=;
 b=4Na4MS+/MdB7wizw9glMzpaU+Mo3GBpV11U0u0gbZDCLA0BuhXy4H61rFNfk9IqGRX4usyp+ok+Y5jN2Yisadb5XoMW+PCMbhgooBSeWLnx2TJUB0a3S73v9FeKFztIad9tPM8yancd35G9/8wpiYEOYuj/JqLI/Xe8QifMAUQ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIuKUulgzn/k6srSXYG8VqAHyOW3zxnWsxZXsWeluuKgwFIkzlw/DPYqvLB/Ht/IiObJopSF8u/W2rHmpZUl1esmBc4p4d8mXibhdd8W3nclsMEmhsEpftnwinobYy1Efim84xrmYmKswdrFGPCQh30Fv2pRV5zxog32GQxgMsDmFpJGzczYDIbUarhHb/OHzStVqszWsnVfOomeOrRBToLdMtJ3oQMSQOny/5D+ElpMoROSvJjYo4jBDR6sYjF3oQ7HHukVSJtY2TKqfgJRZ/Y1G+qLCkyllv8oqjCysH9a6MQv864RN+osDJiDaR/TA70rmT4PMaaDsuJgchQ7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfKWvJ0OYjmx4LqA7vYDLNLOfUmHgMZfQzfCSQzUGHQ=;
 b=FgRR1Mm8prYS09aAaKFYnl5MlJw9sDpTw99rhZli/9gp6LWFhag+Nx1of7aJ+SqGt+xupQVEl+YBGolW0Fx1mJvYCcQBl6okE7SeqK1+Lnm3FKr4HhlWCJzRbHJzX9i554otCPiQPfsif7fATeptVjyjBcLb2AKwRwmYaSXAU/QPnIdOVlce3M7+abQxghHPXx6BsrBVXO4EWNs/G0Vg1R5YYe5B5/brGjwKi9FMAc+cv/Re9AkEnUCu3yhDaMOZybW70cQNJvDNxek7WF1Y6wRQsY+72ZEE9NkO2enFn09+AZPpbVhXR0G/x3oEMkx8iUvmW3q/K/QBxdlXNGWOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfKWvJ0OYjmx4LqA7vYDLNLOfUmHgMZfQzfCSQzUGHQ=;
 b=4Na4MS+/MdB7wizw9glMzpaU+Mo3GBpV11U0u0gbZDCLA0BuhXy4H61rFNfk9IqGRX4usyp+ok+Y5jN2Yisadb5XoMW+PCMbhgooBSeWLnx2TJUB0a3S73v9FeKFztIad9tPM8yancd35G9/8wpiYEOYuj/JqLI/Xe8QifMAUQ8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: RE: [PATCH v6 2/9] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v6 2/9] xen: do not free reserved memory into heap
Thread-Index: AQHYekCLapi6TfhNLECKo4lt4smsBq1DqSgAgALDbhCAAGOJgIAAFrZg
Date: Mon, 13 Jun 2022 03:27:56 +0000
Message-ID:
 <DU2PR08MB7325ABFF156C8AB1C8F76BC0F7AB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-3-Penny.Zheng@arm.com>
 <d43d2dbd-6b0e-fb0c-5e0a-d409db4e18e9@xen.org>
 <DU2PR08MB7325B2A677FCF2FBF905D588F7A79@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <dd9f8a18-23ce-d5f6-45ff-82376aaefaba@xen.org>
In-Reply-To: <dd9f8a18-23ce-d5f6-45ff-82376aaefaba@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BCD83B6BCF2D7340BA75DD5ECF96EAA7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 97d4741f-1297-4ef8-dab7-08da4cecbbd2
x-ms-traffictypediagnostic:
	AS8PR08MB6887:EE_|AM5EUR03FT034:EE_|VI1PR08MB2927:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2927AA344588B07A629807B7F7AB9@VI1PR08MB2927.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N9H/YlBN7/WUWvbKsn4nqKbZN3rPyO4SAKenijYd/xMu6+xo3j08jKqXoqtrwkplYb/LYEPsTTMLZX+qroZV85tEgub+0yLFSI4tpjs0v7VAiXsm7kMr8+GgRQcYrRZPQC0Z94DYjOcvevokCEkmxKJfYKa+ZH+TUTNDRdmLh4xGamf4CJJePDcjp1vCQ3MiYnJ8tJxjG6xF+3SsAwRfEkmro5MGJglJLNZiRR2AkWnIH6xc17a1s1lT7WyA08mtJo4NLyHeX584zie7TQXWBju8ICJeFsi6uyeza4oGEerSMsrwdOr8LyhSDlOBo/DPkVNl1+MJbcL07qTotinHPapqTvLeD/BUWWeOjlaOqVPcmJ3TL7l6C22nQ9Ta3Cez8M1mg+C4dfedO4uWWe6PcZonPma5igWMJd6KJGBxIzbWZMW5c18YFb5L+H8ugEJxHQQQC5bvSiblhMs9GhOg0BET0SEd/mGhDbxhdV3sLkcUsqvriDF7i/xrCCw3t1wEmGOoNRLyudyXYtowKH14GlXqBB+/QkEByNblhQMu+PCkuP4F+wgMKJQy7rD1X+xdfYBCeJAN6FRyPiNkBaalPOhPq6INW803WgGVIstiIO93eRN2Jj/gPQCKIQ2uh0nhnj0h6mrPax1xLtMoZcGenaYj5JYPn62laGzUUahHfSpTcFrkpyNtWGX4uz1uPt5PQxQoUwsMkbajYx7bRvlDub0Cq4aw6lj841ytAAkkFHI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(64756008)(55016003)(66446008)(508600001)(33656002)(122000001)(316002)(110136005)(66556008)(186003)(66476007)(66946007)(38070700005)(2906002)(7696005)(71200400001)(5660300002)(6506007)(86362001)(53546011)(26005)(9686003)(52536014)(8676002)(38100700002)(4326008)(76116006)(83380400001)(54906003)(8936002)(156664002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6887
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f4b2b7d-2026-44ab-2cf4-08da4cecb5b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IPCYJDFv7pjcMUR7hzc4SLYyk30g3E+cH46v8cL+nKDlsISpFYN2BCfvfGRwr06ssewQBuxWXvvQIs0GXg2KXzLxUHIESl8bi4jQol2K6KLsJLsWax+pCdd/NWHRAYzYFlcAFyFyazvArwmSgz3Ue7obWiEGYz4iTWAp43dEIKBpurEAQbBaPjUeTyhhv4de4sOF3qh1SyhGm58ShP7G4RkjSlmsnfGdLpsNlC2c6rtEJD8JnKj+TlED5kwwf4r+I3X+Iyz/9YQf5ULdegEClkKGDdDY2hZB1mq36ryR/T2x6nN2mPy49cSblb+pm9lx8hSMKeINzdgldUJQ2AwoHzZDAAETNPT992JZ1PyYJTI41Xj+fVX1l4yL3gXF3d42POPs74+YWP/P2vJGkMmT1T8jPNL1sm+ciPnYCC5WxXy469ZYtYcwfvpEGocopMHM1cgeg1mzbLIRW/wXF7weZpgSGUX/RGO8+bA2uQdbXlSJxdHyHUL4wr624dOHpw8EYAA8Cjz4GUHZezNIq2/WVuzKkfkBsfmNgQxpAqccQnGOYCNnMqb4+W2nc6qdkxWhecEEf5X9g4Xxieh5aFJ1yMGMZfe3lKkT/hgp2jTFau2a3VGNGxJ3S4aHvFrABXdgkeu5C336nmTlKFiNCz199iveGnkX0FXjRPgGF0woPsV/Uod59H6ZY7uSqXn2OD0A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(46966006)(6506007)(7696005)(53546011)(47076005)(9686003)(186003)(26005)(81166007)(356005)(83380400001)(336012)(52536014)(5660300002)(36860700001)(86362001)(33656002)(82310400005)(8676002)(4326008)(55016003)(8936002)(2906002)(316002)(110136005)(70206006)(54906003)(508600001)(70586007)(156664002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 03:28:07.2716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d4741f-1297-4ef8-dab7-08da4cecbbd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2927

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUgOSwgMjAyMiA1
OjIyIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFu
ZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1
ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPjsNCj4gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2xAeGVu
Lm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAyLzldIHhlbjogZG8gbm90IGZyZWUgcmVz
ZXJ2ZWQgbWVtb3J5IGludG8gaGVhcA0KPiANCj4gSGksDQo+IA0KPiBPbiAwOS8wNi8yMDIyIDA2
OjU0LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+
IFNlbnQ6IFR1ZXNkYXksIEp1bmUgNywgMjAyMiA1OjEzIFBNDQo+ID4+IFRvOiBQZW5ueSBaaGVu
ZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0K
PiA+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkN
Cj4gPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4+IDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA+PiA8Vm9sb2R5
bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+ID4+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0KPiA+PiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdQ0KPiA+PiA8d2xA
eGVuLm9yZz4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAyLzldIHhlbjogZG8gbm90IGZy
ZWUgcmVzZXJ2ZWQgbWVtb3J5IGludG8NCj4gPj4gaGVhcA0KPiA+Pg0KPiA+PiBIaSBQZW5ueSwN
Cj4gPj4NCj4gPg0KPiA+IEhpIEp1bGllbg0KPiA+DQo+ID4+IE9uIDA3LzA2LzIwMjIgMDg6MzAs
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gUGFnZXMgdXNlZCBhcyBndWVzdCBSQU0gZm9yIHN0
YXRpYyBkb21haW4sIHNoYWxsIGJlIHJlc2VydmVkIHRvIHRoaXMNCj4gPj4+IGRvbWFpbiBvbmx5
Lg0KPiA+Pj4gU28gaW4gY2FzZSByZXNlcnZlZCBwYWdlcyBiZWluZyB1c2VkIGZvciBvdGhlciBw
dXJwb3NlLCB1c2VycyBzaGFsbA0KPiA+Pj4gbm90IGZyZWUgdGhlbSBiYWNrIHRvIGhlYXAsIGV2
ZW4gd2hlbiBsYXN0IHJlZiBnZXRzIGRyb3BwZWQuDQo+ID4+Pg0KPiA+Pj4gZnJlZV9zdGF0aWNt
ZW1fcGFnZXMgd2lsbCBiZSBjYWxsZWQgYnkgZnJlZV9oZWFwX3BhZ2VzIGluIHJ1bnRpbWUNCj4g
Pj4+IGZvciBzdGF0aWMgZG9tYWluIGZyZWVpbmcgbWVtb3J5IHJlc291cmNlLCBzbyBsZXQncyBk
cm9wIHRoZSBfX2luaXQgZmxhZy4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gdjYgY2hhbmdlczoN
Cj4gPj4+IC0gYWRhcHQgdG8gUEdDX3N0YXRpYw0KPiA+Pj4gLSByZW1vdmUgI2lmZGVmIGFyb3Vk
IGZ1bmN0aW9uIGRlY2xhcmF0aW9uDQo+ID4+PiAtLS0NCj4gPj4+IHY1IGNoYW5nZXM6DQo+ID4+
PiAtIEluIG9yZGVyIHRvIGF2b2lkIHN0dWIgZnVuY3Rpb25zLCB3ZSAjZGVmaW5lIFBHQ19zdGF0
aWNtZW0gdG8NCj4gPj4+IG5vbi16ZXJvIG9ubHkgd2hlbiBDT05GSUdfU1RBVElDX01FTU9SWQ0K
PiA+Pj4gLSB1c2UgInVubGlrZWx5KCkiIGFyb3VuZCBwZy0+Y291bnRfaW5mbyAmIFBHQ19zdGF0
aWNtZW0NCj4gPj4+IC0gcmVtb3ZlIHBvaW50bGVzcyAiaWYiLCBzaW5jZSBtYXJrX3BhZ2VfZnJl
ZSgpIGlzIGdvaW5nIHRvIHNldA0KPiA+Pj4gY291bnRfaW5mbyB0byBQR0Nfc3RhdGVfZnJlZSBh
bmQgYnkgY29uc2VxdWVuY2UgY2xlYXIgUEdDX3N0YXRpY21lbQ0KPiA+Pj4gLSBtb3ZlICNkZWZp
bmUgUEdDX3N0YXRpY21lbSAwIHRvIG1tLmgNCj4gPj4+IC0tLQ0KPiA+Pj4gdjQgY2hhbmdlczoN
Cj4gPj4+IC0gbm8gY2hhbmdlcw0KPiA+Pj4gLS0tDQo+ID4+PiB2MyBjaGFuZ2VzOg0KPiA+Pj4g
LSBmaXggcG9zc2libGUgcmFjeSBpc3N1ZSBpbiBmcmVlX3N0YXRpY21lbV9wYWdlcygpDQo+ID4+
PiAtIGludHJvZHVjZSBhIHN0dWIgZnJlZV9zdGF0aWNtZW1fcGFnZXMoKSBmb3IgdGhlDQo+ID4+
PiAhQ09ORklHX1NUQVRJQ19NRU1PUlkgY2FzZQ0KPiA+Pj4gLSBtb3ZlIHRoZSBjaGFuZ2UgdG8g
ZnJlZV9oZWFwX3BhZ2VzKCkgdG8gY292ZXIgb3RoZXIgcG90ZW50aWFsIGNhbGwNCj4gPj4+IHNp
dGVzDQo+ID4+PiAtIGZpeCB0aGUgaW5kZW50YXRpb24NCj4gPj4+IC0tLQ0KPiA+Pj4gdjIgY2hh
bmdlczoNCj4gPj4+IC0gbmV3IGNvbW1pdA0KPiA+Pj4gLS0tDQo+ID4+PiAgICB4ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vbW0uaCB8ICA0ICsrKy0NCj4gPj4+ICAgIHhlbi9jb21tb24vcGFnZV9h
bGxvYy5jICAgICAgIHwgMTIgKysrKysrKysrLS0tDQo+ID4+PiAgICB4ZW4vaW5jbHVkZS94ZW4v
bW0uaCAgICAgICAgICB8ICAyIC0tDQo+ID4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+ID4+PiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9tbS5oIGluZGV4IGZiZmYxMWM0NjguLjc0NDI4OTNlNzcgMTAwNjQ0DQo+ID4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL21tLmgNCj4gPj4+IEBAIC0xMDgsOSArMTA4LDExIEBAIHN0cnVjdCBwYWdlX2lu
Zm8NCj4gPj4+ICAgICAgLyogUGFnZSBpcyBYZW4gaGVhcD8gKi8NCj4gPj4+ICAgICNkZWZpbmUg
X1BHQ194ZW5faGVhcCAgICAgUEdfc2hpZnQoMikNCj4gPj4+ICAgICNkZWZpbmUgUEdDX3hlbl9o
ZWFwICAgICAgUEdfbWFzaygxLCAyKQ0KPiA+Pj4gLSAgLyogUGFnZSBpcyBzdGF0aWMgbWVtb3J5
ICovDQo+ID4+DQo+ID4+IE5JVHBpY2tpbmc6IFlvdSBhZGRlZCB0aGlzIGNvbW1lbnQgaW4gcGF0
Y2ggIzEgYW5kIG5vdyByZW1vdmluZyB0aGUNCj4gc3BhY2UuDQo+ID4+IEFueSByZWFzb24gdG8g
ZHJvcCB0aGUgc3BhY2U/DQo+ID4+DQo+ID4+PiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZ
DQo+ID4+DQo+ID4+IEkgdGhpbmsgdGhpcyBjaGFuZ2Ugb3VnaHQgdG8gYmUgZXhwbGFpbmVkIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4NCj4gPj4gQUZBSVUsIHRoaXMgaXMgbmVjZXNzYXJ5IHRvIGFs
bG93IHRoZSBjb21waWxlciB0byByZW1vdmUgY29kZSBhbmQNCj4gPj4gYXZvaWQgbGlua2luZyBp
c3N1ZXMuIElzIHRoYXQgY29ycmVjdD8NCj4gPj4NCj4gPj4+ICsvKiBQYWdlIGlzIHN0YXRpYyBt
ZW1vcnkgKi8NCj4gPj4+ICAgICNkZWZpbmUgX1BHQ19zdGF0aWMgICAgUEdfc2hpZnQoMykNCj4g
Pj4+ICAgICNkZWZpbmUgUEdDX3N0YXRpYyAgICAgUEdfbWFzaygxLCAzKQ0KPiA+Pj4gKyNlbmRp
Zg0KPiA+Pj4gICAgLyogLi4uICovDQo+ID4+PiAgICAvKiBQYWdlIGlzIGJyb2tlbj8gKi8NCj4g
Pj4+ICAgICNkZWZpbmUgX1BHQ19icm9rZW4gICAgICAgUEdfc2hpZnQoNykNCj4gPj4+IGRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
IGluZGV4DQo+ID4+PiA5ZTVjNzU3ODQ3Li42ODc2ODY5ZmE2IDEwMDY0NA0KPiA+Pj4gLS0tIGEv
eGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxv
Yy5jDQo+ID4+PiBAQCAtMTQ0Myw2ICsxNDQzLDEzIEBAIHN0YXRpYyB2b2lkIGZyZWVfaGVhcF9w
YWdlcygNCj4gPj4+DQo+ID4+PiAgICAgICAgQVNTRVJUKG9yZGVyIDw9IE1BWF9PUkRFUik7DQo+
ID4+Pg0KPiA+Pj4gKyAgICBpZiAoIHVubGlrZWx5KHBnLT5jb3VudF9pbmZvICYgUEdDX3N0YXRp
YykgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICAvKiBQYWdlcyBvZiBzdGF0aWMgbWVt
b3J5IHNoYWxsIG5vdCBnbyBiYWNrIHRvIHRoZSBoZWFwLiAqLw0KPiA+Pj4gKyAgICAgICAgZnJl
ZV9zdGF0aWNtZW1fcGFnZXMocGcsIDFVTCA8PCBvcmRlciwgbmVlZF9zY3J1Yik7DQo+ID4+IEkg
Y2FuJ3QgcmVtZW1iZXIgd2hldGhlciBJIGFza2VkIHRoaXMgYmVmb3JlIChJIGNvdWxkbid0IGZp
bmQgYSB0aHJlYWQpLg0KPiA+Pg0KPiA+PiBmcmVlX3N0YXRpY21lbV9wYWdlcygpIGRvZXNuJ3Qg
c2VlbSB0byBiZSBwcm90ZWN0ZWQgYnkgYW55IGxvY2suIFNvDQo+ID4+IGhvdyBkbyB5b3UgcHJl
dmVudCB0aGUgY29uY3VycmVudCBhY2Nlc3MgdG8gdGhlIHBhZ2UgaW5mbyB3aXRoIHRoZSBhY3F1
aXJlDQo+IHBhcnQ/DQo+ID4NCj4gPiBUcnVlLCBsYXN0IHRpbWUgeW91IHN1Z2dlc3RlZCB0aGF0
IHJzdl9wYWdlX2xpc3QgbmVlZHMgdG8gYmUgcHJvdGVjdGVkDQo+ID4gd2l0aCBhIHNwaW5sb2Nr
IChtb3N0bHkgbGlrZSBkLT5wYWdlX2FsbG9jX2xvY2spLiBJIGhhdmVuJ3QgdGhvdWdodCBpdA0K
PiA+IHRob3JvdWdobHksIHNvcnJ5IGFib3V0IHRoYXQuDQo+ID4gU28gZm9yIGZyZWVpbmcgcGFy
dCwgSSBzaGFsbCBnZXQgdGhlIGxvY2sgYXQgYXJjaF9mcmVlX2hlYXBfcGFnZSgpLA0KPiA+IHdo
ZXJlIHdlIGluc2VydCB0aGUgcGFnZSB0byB0aGUgcnN2X3BhZ2VfbGlzdCwgYW5kIHJlbGVhc2Ug
dGhlIGxvY2sgYXQgdGhlDQo+IGVuZCBvZiB0aGUgZnJlZV9zdGF0aWNtZW1fcGFnZS4NCj4gDQo+
IEluIGdlbmVyYWwsIGEgbG9jayBpcyBiZXR0ZXIgdG8gYmUgbG9jay91bmxvY2sgaW4gdGhlIHNh
bWUgZnVuY3Rpb24gYmVjYXVzZSBpdCBpcw0KPiBlYXNpZXIgdG8gdmVyaWZ5LiBIb3dldmVyLCBJ
IGFtIG5vdCBzdXJlIHRoYXQgZXh0ZW5kaW5nIHRoZSBsb2NraW5nIGZyb20gZC0NCj4gPnBhZ2Vf
YWxsb2NfbG9jayB1cCBhZnRlciBmcmVlX2hlYXBfcGFnZXMoKSBpcyByaWdodC4NCj4gDQo+IFRo
ZSBmaXJzdCByZWFzb24gYmVpbmcgdGhhdCB0aGV5IGFyZSBvdGhlciBjYWxsZXJzIG9mIGZyZWVf
aGVhcF9wYWdlcygpLg0KPiBTbyBub3cgYWxsIHRoZSBjYWxsZXJzIG9mIHRoZSBoZWxwZXJzIHdv
dWxkIG5lZWQgdG8ga25vdyB3aGV0aGVyIHRoZXkgbmVlZCB0bw0KPiBoZWxwIGQtPnBhZ2VfYWxs
b2NfbG9jay4NCj4gDQo+IFNlY29uZGx5LCBmcmVlX3N0YXRpY21lbV9wYWdlcygpIGlzIG1lYW50
IHRvIGJlIHRoZSByZXZlcnNlIG9mDQo+IHByZXBhcmVfc3RhdGljbWVtX3BhZ2VzKCkuIFdlIHNo
b3VsZCBwcmV2ZW50IGJvdGggb2YgdGhlbSB0byBiZSBjYWxsZWQNCj4gY29uY3VycmVudGx5LiBJ
dCBzb3VuZHMgc3RyYW5nZSB0byB1c2UgdGhlIGQtPnBhZ2VfYWxsb2NfbG9jayB0byBwcm90ZWN0
IGl0IChhDQo+IHBhZ2UgaXMgdGVjaG5pY2FsbHkgbm90IGJlbG9uZ2luZyB0byBhIGRvbWFpbiBh
dCB0aGlzIHBvaW50KS4NCj4gDQo+IFRvIG1lIGl0IGxvb2tzIGxpa2Ugd2Ugd2FudCB0byBhZGQg
dGhlIHBhZ2VzIG9uIHRoZSByc3ZfcGFnZV9saXN0DQo+ICphZnRlciogdGhlIHBhZ2VzIGhhdmUg
YmVlbiBmcmVlZC4gU28gd2Uga25vdyB0aGF0IGFsbCB0aGUgcGFnZXMgb24gdGhhdCBsaXN0DQo+
IGhhdmUgYmVlbiBtYXJrZWQgYXMgZnJlZWQgKGkuZS4gZnJlZV9zdGF0aWNtZW1fcGFnZXMoKSBj
b21wbGV0ZWQpLg0KPiANCg0KWWVzISBUaGF0IGZpeGVzIGV2ZXJ5dGhpbmchDQpJZiB3ZSBhZGQg
dGhlIHBhZ2VzIG9uIHRoZSByc3ZfcGFnZV9saXN0ICphZnRlciogdGhlIHBhZ2VzIGhhdmUgYmVl
biBmcmVlZCwgd2UNCmNvdWxkIG1ha2Ugc3VyZSB0aGF0IHBhZ2UgYWNxdWlyZWQgZnJvbSByc3Zf
cGFnZV9saXN0IGhhcyBiZWVuIHRvdGFsbHkgZnJlZWQuDQpIbW1tLCBzbyBpbiBzdWNoIGNhc2Us
IGRvIHdlIHN0aWxsIG5lZWQgdG8gYWRkIGxvY2sgaGVyZT8gDQpXZSBhbHJlYWR5IGNvdWxkIG1h
a2Ugc3VyZSB0aGF0IHBhZ2UgYWNxdWlyZWQgZnJvbSByc3ZfcGFnZV9saXN0IG11c3QgYmUgdG90
YWxseQ0KZnJlZWQsIHdpdGhvdXQgdGhlIGxvY2suDQpPciBpbiBmYWN0cywgd2UgdXNlIHRoZSBs
b2NrIHRvIGxldCBwcmVwYXJlX3N0YXRpY21lbV9wYWdlcygpIG5vdCBmYWlsIGlmIGZyZWVfc3Rh
dGljbWVtX3BhZ2VzDQpoYXBwZW4gY29uY3VycmVudGx5Pw0KVHJ5aW5nIHRvIHVuZGVyc3RhbmQg
dGhlIGludGVudHMgb2YgdGhlIGxvY2sgaGVyZSBtb3JlIGNsZWFybHksIGhvcGUgaXQncyBub3Qg
YSBkdW1iIHF1ZXN0aW9ufg0KDQpgPiBJbiBhZGRpdGlvbiB0byB0aGF0LCB3ZSB3b3VsZCBuZWVk
IHRoZSBjb2RlIGluIGZyZWVfc3RhdGljbWVtX3BhZ2VzKCkgdG8gYmUNCj4gcHJvdGVjdGVkIGJ5
IHRoZSBoZWFwX2xvY2sgKGF0IGxlYXN0IHNvIGl0IGlzIG1hdGNoDQo+IHByZXBhcmVfc3RhdGlj
bWVtX3BhZ2VzKCkpLg0KPiANCj4gQW55IHRob3VnaHRzPw0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
LS0NCj4gSnVsaWVuIEdyYWxsDQo=

