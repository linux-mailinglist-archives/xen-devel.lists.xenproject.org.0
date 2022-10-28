Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C20610960
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 06:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431399.684273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooHEg-0005dZ-Bc; Fri, 28 Oct 2022 04:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431399.684273; Fri, 28 Oct 2022 04:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooHEg-0005b6-8w; Fri, 28 Oct 2022 04:44:50 +0000
Received: by outflank-mailman (input) for mailman id 431399;
 Fri, 28 Oct 2022 04:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/aT=25=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ooHEe-0005b0-J9
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 04:44:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fc1942c-567b-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 06:44:47 +0200 (CEST)
Received: from AM5PR0701CA0059.eurprd07.prod.outlook.com (2603:10a6:203:2::21)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 04:44:31 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::bb) by AM5PR0701CA0059.outlook.office365.com
 (2603:10a6:203:2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14 via Frontend
 Transport; Fri, 28 Oct 2022 04:44:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 04:44:29 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 28 Oct 2022 04:44:29 +0000
Received: from fce0fe867e8d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A561CBB-D959-47F2-A5DA-3624458618F4.1; 
 Fri, 28 Oct 2022 04:43:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fce0fe867e8d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 04:43:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 04:43:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 04:43:33 +0000
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
X-Inumbo-ID: 3fc1942c-567b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dXSSSKPwLLe/A11e90exfg7E7SVS3or+XYv6PfrLRJgKmemdGMVehViRHIqAonWl5LOdezwsjiQHJ9ZAp7dbczSMxpwRnAH1FmqcPTx3Euv082pJGa7t9r3k3Fw5T/CcZtd2QfV8Ez0im4ZrXyushGfsW2vJi1dx27Ub/4PxTJAJXwL1ZSB0HDIMDQmycMAbrsJYV1IqGhuAjHTyQIPCYiIqzmRdtoq3th02KWLRza7gcJOJisuoplj+Mn4yPLxBYw6C4bBVhbHhm3EE/FVI6UvOnxQqbDKr8BA/+QCNLw0FUD2dVlqeGWJlGBCyGpfeoqU0sBYS5GM/0MXwMYKNrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDTXL0vWjxx0ZpH5GwKEm5jF0HBp/iReKAR0LSi3f7o=;
 b=G9RcGTzx7xDktn8Y4U8+hueWYytZOiR1KK1RhDT5sGWIR+IQEuIbch+3X1DJhM6+KzXbhjH9m0iCaDDm8fJvRYrhaxjOLMhpV1r91bvUpK7qUdZs8OVlQm9uV7XvIoquojswPaGVXhRVY8Vr/QiGTyY9JXOlPriZdkwb2rDL1CO7pW0f4sC2zjitAa1vM3zLYdQqTL2uBlp+/dUx12/dp15I326BnkvNpdFD5g8MGj9uhvvvl2N200xDPbOqxT7PebrbQo61ua6mHUMh0F8WllmSkz/4VuoW5xjzBknjmaV0XRhtLw3D3Nz4fNFP7Y0NK5rksdL3GHPfkIFG48QdEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDTXL0vWjxx0ZpH5GwKEm5jF0HBp/iReKAR0LSi3f7o=;
 b=Se5cb12kCd2p9KFn7DFN1W8KukEilIjAkFHbyTyGVcswNGeSswRxtVkVj9PKTlSaNn8R6gLrtni3kGiz7TzqIZmocoOMOQAheVH80QwM/pVOO41FNqXv4DHgL4JW9D5vFY26AVPn3ajBIMEWLxn/jAu2E8Ou4tpjdnxYXaKAXKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cd2310d058e8748
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2muTnQzUHZuINRdPFwwokUm9olkkdrYvaZRqwy2uodgSXPItqHZ6idaV2aD8rxcjKOCLVEWNQm+4ynYiLQhKDGCx5FoGKLjRSw89s0SkBC+j1H1NmPWqrKbHe7A86ekOm9viVxRvRusZj7WYJTjzwGdtIPofkwj0FIlNWigH3/sE0/spCyub+oo3LpayKoyzhzlh7okc0D5+wLr25zaRRQrjsDqv9THLKccCqgZzj6OP8rEYdAFq/XSBOQmcVqoPjAaBx86yzYmStl+Znh0Towseovp8a+Az9hI3gRUFvJS6frLlk6n96FB5EctunX3orcHjaYFhyn2HI1h9rSVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDTXL0vWjxx0ZpH5GwKEm5jF0HBp/iReKAR0LSi3f7o=;
 b=ioqcm9LAtlMNVlhTRarPSIBaRtV8rePQERZvJlQhhdwlVOBc04NAIqEB15qVXtop3xHQNnFIZbGMzduax7G56eS8ktjhnagG56SCqONGvhsDwhVo37q7GfgBMFU51xPHavix2Y97vsngn9YyL6tc/hZbE6UMRAjDwlczs4jELVaVbqY1uaLIfyBvBaagJiCVwOWm1UdVsHzMHPgUTiq8j+qlC5bkkEdcbWEUXq0fj7q/C9Pfm6etXggL3jCERnby4qEROz9b/Um5BDStvDWIRqKBBuJj5muxmvCpfjNDB+k8mTFixFYwxoNuZ5t/ONG7b4iHFPSeEPPOX5eE0Dr0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDTXL0vWjxx0ZpH5GwKEm5jF0HBp/iReKAR0LSi3f7o=;
 b=Se5cb12kCd2p9KFn7DFN1W8KukEilIjAkFHbyTyGVcswNGeSswRxtVkVj9PKTlSaNn8R6gLrtni3kGiz7TzqIZmocoOMOQAheVH80QwM/pVOO41FNqXv4DHgL4JW9D5vFY26AVPn3ajBIMEWLxn/jAu2E8Ou4tpjdnxYXaKAXKU=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: Feedback for postponing the 4.17 release to a week later
Thread-Topic: Feedback for postponing the 4.17 release to a week later
Thread-Index: Adjqh6nb7bpyTo+8QPKuDS/Y5NDKqw==
Date: Fri, 28 Oct 2022 04:43:33 +0000
Message-ID:
 <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EEED2DDA949674468255770FF13229F8.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6514:EE_|AM7EUR03FT009:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: edd2719b-caf5-47ed-0de0-08dab89f19cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FjamBxIuTVuMrlMh++YdnFioVT8ha+EMAxZSYw3m2VJ5MR9gbsqWKsN6v1b++NhpCN8ZVEL7aCkT2az6DpnBxoNT+DrqTGyJJDAfQ6XCq09skvkOrJa7pYBhNHL5bb+OBPk3JDBlRdSRmE+no5nQzol5JCqLcTieSv82SkSY8IxBw/UlJx2sSYoniheq9qm04EZCESPJOmdLpjGT9d3OhWqN9VFLDIjX/IVMJibgohOW8XeG2AXIsSV2aPsaQYvFOYaL8Iq3Nzpg23m2qBhZoRgCmQCY59D6VJlX6sQ1+LrN/JIKgMqv2bS/o4SRgF/l1amtUO2BSLkhUAOmbGceYtt4KpglYAId+DXAYYYGCpuM1cPEh6ttQsserQ0Bw6mVV/UqUjyKdiAjsdx8SDzwWgbZjNsS++FnCq/JAiEIoy8nWzzD757wH/NN+Nhudnrec7L+gQ1bVxGYMOEK4EmGlfFplIgv3WLRBkb9xubojIZMfu+utN2eMgj4JcrD2mE6T8C0jxdXNm7UWV2cNAVzycS6j0cFTCvSspgUg5mVB+5GaZoMIU4Lm3oIYZrb8Z/iVSiTXAuWl/SboHFVo3xxVHM82TQt/l3iFA8vqUWI37FXkY+5FX0y5WR0x49tSjHhBennVl78e+DvFA4vs8ErKxPIR3sAYqGNVktXeuZaVLiyqnVgNC2MQd7bQbqle61ob1elpWwDEtp2B5pb4VJEexrTiKOSYHk4mQ8SyccjYbfSl9P70dwOFrChA9seTBtBT6sXYOO+1sAD1r2vU15qeHORc6a255sUFmwzrW0pHRU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(86362001)(33656002)(38070700005)(38100700002)(122000001)(8936002)(2906002)(83380400001)(55016003)(6506007)(26005)(7696005)(478600001)(9686003)(186003)(71200400001)(966005)(4744005)(54906003)(6916009)(316002)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(5660300002)(41300700001)(7416002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9902745c-acdf-4292-2ebc-08dab89ef815
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NAA01Rj/x5FgEJ+AqmF4euWvdITEzhODNkREqzD2/aSGtMkfos35eg0BxPuUAT7zIOO7SkbH3bprefz5wSKzwPIRa+1WzZtoIHMB2a6yz2Cb/UYCYzyVrfdwV1qsb1pgCBcvQlW1/MDFykX6Vfm+HmBmZALH/WfZpBzMq0PFGCGQU2KEvLaLREaCTWDI6j0uPD1TkNeVV84Guj8FUDIZ7eHTR9cTkuGXz/1eyksSfEMSBjpCgfv65Mx8SdmPiumX4HyqLlaJGqcUBb9NO8snbYfLHWudbVo05/uPiSpqQTWc2SCjEr9tIZTC+K9TjOGznnklHIUVeN09mq+be/JqF2oByqeCwa/866tF9NLC27Kmd+n0xLYNK9CJjCrWe9GVOHJAK5R0KacLi3gkLJCGKAyPOAVUhxZMnQvO02CcOkyN8zpW3KKE4177x5PR8uzgzsoO3Ebsx3psVvCyBOz6ncTkoSZilyNqUddwOri3jwYh8yDBAYUasFu+19qxkxtSLvQKjqAhNz5de1vKVdg+hCvLx0jWTdLegQtLmoSqbudSXTu6vKTL3l1Nf9dY6m3Hz6i42+lHzb7XmXmmgiuQ9/1qFBuQ+q4zruviRL19zuL6KkL5mb+jZGQ0UfMj/KHTD7lQD/BVgIjW+mKzwfAcfZ14xHMZq2381eQSbeVlgUrxdpB+J2+KN2tIUZ5F2Qc3U3h2jQhbGsrpdvTYtG8eHZBX2faKESxZ8GvScFc7xS4M1aHZ8NzYlocie1tsRBR4ZsL5Lanj+MmQ1eMo+T4iHTeFosaiWMbbs4uxGQnQQw0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(40460700003)(478600001)(966005)(82310400005)(33656002)(81166007)(356005)(54906003)(6916009)(52536014)(4744005)(82740400003)(36860700001)(47076005)(107886003)(8676002)(4326008)(316002)(40480700001)(70586007)(70206006)(6506007)(9686003)(2906002)(55016003)(8936002)(7696005)(26005)(5660300002)(41300700001)(336012)(186003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:44:29.7835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edd2719b-caf5-47ed-0de0-08dab89f19cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

Hi all,

Since there will be a batch of XSAs released on Nov. 1 [1] and the original=
 date for
the 4.17 release was supposed to be Nov. 2, I am thinking to postpone the 4=
.17
release to a week later (Nov. 11) to give a little bit longer time so that:

- The security team won't do anything in rush.
- We can have more feedback after merging these XSAs.
- Include more release-relevant bugfixes.

May I please have some feedback on this proposal? Thanks very much!

[1] https://xenbits.xen.org/xsa/

Kind regards,
Henry


