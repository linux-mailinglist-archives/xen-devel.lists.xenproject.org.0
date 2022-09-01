Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBE5A9BF1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396818.637147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmNA-0000h1-Nw; Thu, 01 Sep 2022 15:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396818.637147; Thu, 01 Sep 2022 15:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmNA-0000et-Ki; Thu, 01 Sep 2022 15:44:52 +0000
Received: by outflank-mailman (input) for mailman id 396818;
 Thu, 01 Sep 2022 15:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzPc=ZE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oTmN8-0000en-Uy
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:44:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03682c99-2a0d-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 17:44:50 +0200 (CEST)
Received: from AM0PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:208:1::16)
 by DU0PR08MB7762.eurprd08.prod.outlook.com (2603:10a6:10:3ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 15:44:47 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:1:cafe::b0) by AM0PR04CA0039.outlook.office365.com
 (2603:10a6:208:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Thu, 1 Sep 2022 15:44:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 15:44:46 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 01 Sep 2022 15:44:46 +0000
Received: from 9f7076c55a13.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 812F3DED-5ED3-4AB0-863D-A3F1ED39A217.1; 
 Thu, 01 Sep 2022 15:44:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f7076c55a13.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 15:44:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6649.eurprd08.prod.outlook.com (2603:10a6:10:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 15:44:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 15:44:31 +0000
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
X-Inumbo-ID: 03682c99-2a0d-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QN8o/wMam1+5XXH76oSxCyDMkz9Prmtd0puBFCL5UpaMfjXWp20mgnEvRza2/530yWi7OLrurMa3P7KN1PwKcUVYdh3eJ0Z1CwzT8y6mWxKxYe9IQD4kAr1JU6rKs/uNuf2wmYAdyAzXI4yamrojOOikuiETQGRMDg5arD0nWypKt8XofzLAYHVOuNTC1LD/Mle7nZlBMZXn3Ki9UX/DkhHA6t9X+H8HkvDUPP5/N7DLc2EKSUfdhvPSUNuVZP5pFflN2hh3iQalQfWyiYaEqCXTiKDQz6b8piNPqGfs+5qjancQgWEg9mvHpGjK88H89jyDAY/hhO7bK+tw3jStlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr+GU2JynkP1mO1AW5MNNgmi2VPjckuL/jYHo82eAgY=;
 b=MSBkipyFvl6efopEdqoEghkIsykWQRaP2CFzjDlaQnALRZ/WBa6zRqdYxxu9UfL7LI9/+Chs4NuKOUz552wMLK46zaR590zL9pfDspFCLlI5FLc61c1M6hoPPbZLadpKQ4SM8ryuB/UHkhgUSg+B3yrtHjdQ4RYGEjSinzXkvWf8eSVQk8ga469WF8wunYJf/rx9N1yh07eUzmTibhy9yh24jzYQq6Y840HPp1dIodWOsVnM491pCtgzWQJoFKbH5BCwsowxWH6aQ3Co8X/2khggGRAlYuZyOx7CF5Aq/+WBos2y0p7p2k2mXtOgxIB7aBPJ3xUnv28cd8fiznCwfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr+GU2JynkP1mO1AW5MNNgmi2VPjckuL/jYHo82eAgY=;
 b=alEFnauJLA7TcI3+CRQGsea2IXBX3QZGO1vmkHGZS9sRq9UPu4Q3QeLXpcn4RPoXDjRL53rMHiDRPPDhi2W5xUNI4sfnt91Z+Yhfyj/JlkkDW5Mr9MxrWMDDTDOyxfU7Vr2JyZwAqVlupVsSZnRa4y8tmFh4yuRjpzs1EGEjUtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4b49849e15151c9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyUvF7zkgVMrMlIxJXUIBX0WhHes2URBx3m4nkR0fghBhqSEOGe36I1IC0x9o9lVfI52TlXaFh+tWszltGx+dz7KyQIXwb/8nuVLKpmxa3Oy7o3Gi/vCkI4Ddv+K2T09xljMlZ/ug7Do6sYcSzLDau70I3+cFVd6uaCEoLrmz0+uNn1c/ztvTXvtNFHIm8cL91ZDonF0PL+5/hoBuhLQZA2wRvSP0KjWRvUIGNreL/jf8braIo1Nr+WPlVfAbNHAj3bBk2/QIRfl7Rd3O+V45s5fdclDCFFq1VfUTK4zsbUmvibWFQ3LThKYOYOczjcVuWB6iCSVrgUPeaHZzDbhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr+GU2JynkP1mO1AW5MNNgmi2VPjckuL/jYHo82eAgY=;
 b=YhdmDWbBCRa3dDE2+/G52ig+6Q1nSpJl1Q7DFCcWMDqc2/snfKdkwKqzWOKN1bu99RuuKyMP7Oda5b8m7X5uf0wOCSSPa8UuUU9dzBZl5NcVkBX12W9Wuyg478W/95tjAYn2Ypmn9fOkb5Iwj9dEuk0JjpAdl3dUbhvZFW6CdPvoUCQ1lKLsFuNTx3VLLx1nENiialJN75TNw5S8dtpHIr5GkKzQsy6MRKKeqpWgqYOaN247ZllZ8MLY3D7I/2HzYPicR+iukJ/hEpLR9crYGIybyuATWClqIBIwHuMbRcSKKU3myM7E74uqPZ6eFGDyOlqlRQspfk3SbwP5bBEcQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr+GU2JynkP1mO1AW5MNNgmi2VPjckuL/jYHo82eAgY=;
 b=alEFnauJLA7TcI3+CRQGsea2IXBX3QZGO1vmkHGZS9sRq9UPu4Q3QeLXpcn4RPoXDjRL53rMHiDRPPDhi2W5xUNI4sfnt91Z+Yhfyj/JlkkDW5Mr9MxrWMDDTDOyxfU7Vr2JyZwAqVlupVsSZnRa4y8tmFh4yuRjpzs1EGEjUtc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 1/9] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v6 1/9] xen/arm: introduce static shared memory
Thread-Index: AQHYnQTSz9lI9i8180Oxe885mt1wV63BYj8AgARM6wCABUkEAIAAAToA
Date: Thu, 1 Sep 2022 15:44:30 +0000
Message-ID: <9B6588DA-6314-4048-9AF8-C46EA7C2AE6C@arm.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-2-Penny.Zheng@arm.com>
 <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org>
 <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3b58faef-d87d-3381-f54d-8ccdc0ea105f@xen.org>
In-Reply-To: <3b58faef-d87d-3381-f54d-8ccdc0ea105f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b34fbfb0-bbbb-48c7-1af7-08da8c30e5f3
x-ms-traffictypediagnostic:
	DB9PR08MB6649:EE_|VE1EUR03FT064:EE_|DU0PR08MB7762:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 axMOJLKlpIRPNCX8RIP8FZVXPod2dJFJVXXgUv6xFkBEekeRwn4SXPOlAGPwN+ANRG9jfR/PclmUm748lDhgwsTP0bDQlSwKtWvfdLCOg4GG0kQCqrgWRsq1vrpq3Uxg+t5II4omTXMY2IUji9Xj8tpgxuOCiZrygBlvjhTRxNMVgNq7wzw2exR+dLHP0c9YNGV3YuNi77X4wjjk8mqMmRebyjX8Ou7Y80a5en/B4keboqAw8766+QbAL6u+Zc0eXoIaDnE/rc8MbemXWSxpr7mC4LJL68RsflVwX8Ifu5AzOFUpERF8+FWYOIdoQLCfbItLerWIPbmtb5X5JCOEJNxuiUd/IQJW6tNjj0cdVOxirD80wYTG4KSmujfdcLi4lCI95GR/LcUxozvSIs92HkVgyrnN55gDBDO8vVMYu8c4AtzLEyfuyGqIazNm2p738E76ySLe0+a01Emxt7WneR19KEHyZYls49offiB0R3PM60kQ3DtLci8vh7+63vC5JgSLxMmjDX6RaLfW17aSJ1CEsfNfY/0Ce4RYFGvXJ+SZU5+rTso3RUqebFYEO/7CbvADDf5k3G4A0+rWZFQgWslVN23lh86ACub4soqPxPq1BpcN6ISC7m/kXZV4ce7qCWA2Oc64xh3A+M2yk9Q/3MwpHhc7hucl6nw775QRExkuIxAO+4cK0nBBxVbMXEMeTK7MZ9cF0yP82ANdjWnNrFZ4er/gMfb7Qe4vxrXxZC1FwTs6bhnt+DmsareLXbNzxTqSXy1NkbVeMWqVfxBGuyAiVbrRqJQ2x0LChFoBKyE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(8936002)(5660300002)(91956017)(66556008)(64756008)(76116006)(66446008)(6916009)(66476007)(8676002)(2906002)(36756003)(4326008)(66946007)(33656002)(316002)(54906003)(478600001)(6486002)(71200400001)(53546011)(41300700001)(6506007)(6512007)(26005)(83380400001)(86362001)(186003)(2616005)(38070700005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BBC0EDC0401A574CB111B832730F0432@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6649
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d290648-55a2-44dc-d7fc-08da8c30dc65
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f+Z1dRTFCP74iKlsMcU+5B8JNrxLKnnFQ0bNM3ymM/n2UqsHoBv25T2z2pZ25cmx2Iv+kuHYcZ4QEccp0LnHcf5nISixuXOKxkoT/GZ7ASCnX5ARZkCMGMtvNU3NWleU7mTSAdyknHWPhqOc8lTbpjRttdzhoNEsV5LDbBWMIsaxfW6TSDakKZ8En8SidSWWPbpW2ZIfRgxGnQY5nbIhJDxqoJZWmV+n58ehm3/OLbmYUvVYxLVjLNso+RePSrxP4qVy4GoXxg6AWrVsqdbia9Op9Ipk4Tp+Co8ipIR39FvJ2pzA722X17ci8LvUXUkW9giHw248j3FS1Dd9gvvOLi50kkUJbU/VRyr5lDCbvFGPNaq+jTq2w+siXZxHQN9llDR/wsikr3vtTY1DQRMQSXCyISpbq8eW2FDIVvcjmdexo7YxcK1MEiCoJTvDQSOG5zNJfSkB7LNEREEnZptgEKn9WwryQmyeOel4bUyT9vtRLgTA1K8j7QT5up1WDcQ/f2vkxa9L8TZqU5u7b0XHDhV3skaMjsA1HOmzhdlGVPy2BsSsNAwIBnfZelLd6zgQNwD+0+MxVMaF19n6DejsikQYfKN+oOGVX99uUzqL7WRlZ96yX0m+vYtde3mJedTOjvjzj8V5OiLze1LXGyqVi1fBVGeZ+xzyewLZBExTKkoHIw6b/jbhLRFjG0B6Yo4zxzg/aJutm1kC87mNzJ5pZWRKHlbhI6B6XSNXasXMfuJrZbCTkaj+r/c/Lfov8GrR2SHtTRZWTSi+s+tBQkRVsQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(40470700004)(36840700001)(5660300002)(82740400003)(53546011)(83380400001)(2616005)(36860700001)(36756003)(2906002)(6512007)(82310400005)(6506007)(26005)(6862004)(33656002)(54906003)(70206006)(70586007)(107886003)(4326008)(8936002)(316002)(6486002)(336012)(478600001)(86362001)(40460700003)(356005)(47076005)(8676002)(186003)(81166007)(41300700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 15:44:46.9173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34fbfb0-bbbb-48c7-1af7-08da8c30e5f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7762

Hi,

> On 1 Sep 2022, at 16:40, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Penny,
>=20
> On 29/08/2022 07:57, Penny Zheng wrote:
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Sent: Friday, August 26, 2022 9:17 PM
>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>; Bertrand Marquis
>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>> <Volodymyr_Babchuk@epam.com>
>>> Subject: Re: [PATCH v6 1/9] xen/arm: introduce static shared memory
>>>=20
>>> Hi Penny,
>>>=20
>> Hi Julien
>> =20
>>> On 21/07/2022 14:21, Penny Zheng wrote:
>>>> From: Penny Zheng <penny.zheng@arm.com>
>>>>=20
>>>> This patch series introduces a new feature: setting up static shared
>>>> memory on a dom0less system, through device tree configuration.
>>>>=20
>>>> This commit parses shared memory node at boot-time, and reserve it in
>>>> bootinfo.reserved_mem to avoid other use.
>>>>=20
>>>> This commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
>>>> static-shm-related codes, and this option depends on static memory(
>>>> CONFIG_STATIC_MEMORY). That's because that later we want to reuse a
>>>> few helpers, guarded with CONFIG_STATIC_MEMORY, like
>>>> acquire_staticmem_pages, etc, on static shared memory.
>>>>=20
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> ---
>>>> v6 change:
>>>> - when host physical address is ommited, output the error message
>>>> since xen doesn't support it at the moment
>>>> - add the following check: 1) The shm ID matches and the region
>>>> exactly match
>>>> 2) The shm ID doesn't match and the region doesn't overlap
>>>> - change it to "unsigned int" to be aligned with nr_banks
>>>> - check the len of the property to confirm is it big enough to contain
>>>> "paddr", "size", and "gaddr"
>>>> - shm_id defined before nr_shm_domain, so we could re-use the existing
>>>> hole and avoid increasing the size of the structure.
>>>> - change "nr_shm_domain" to "nr_shm_borrowers", to not increment if
>>>> the role is owner in parsing code
>>>> - make "xen,shm_id" property as arbitrary string, with a strict limit
>>>> on the number of characters, MAX_SHM_ID_LENGTH
>>>> ---
>>>> v5 change:
>>>> - no change
>>>> ---
>>>> v4 change:
>>>> - nit fix on doc
>>>> ---
>>>> v3 change:
>>>> - make nr_shm_domain unsigned int
>>>> ---
>>>> v2 change:
>>>> - document refinement
>>>> - remove bitmap and use the iteration to check
>>>> - add a new field nr_shm_domain to keep the number of shared domain
>>>> ---
>>>>   docs/misc/arm/device-tree/booting.txt | 124 ++++++++++++++++++++
>>>>   xen/arch/arm/Kconfig                  |   6 +
>>>>   xen/arch/arm/bootfdt.c                | 157 ++++++++++++++++++++++++=
++
>>>>   xen/arch/arm/include/asm/setup.h      |   9 ++
>>>>   4 files changed, 296 insertions(+)
>>>>=20
>>>> diff --git a/docs/misc/arm/device-tree/booting.txt
>>>> b/docs/misc/arm/device-tree/booting.txt
>>>> index 98253414b8..8013fb98fe 100644
>>>> --- a/docs/misc/arm/device-tree/booting.txt
>>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>>> @@ -378,3 +378,127 @@ device-tree:
>>>>=20
>>>>   This will reserve a 512MB region starting at the host physical addre=
ss
>>>>   0x30000000 to be exclusively used by DomU1.
>>>> +
>>>> +Static Shared Memory
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +The static shared memory device tree nodes allow users to statically
>>>> +set up shared memory on dom0less system, enabling domains to do
>>>> +shm-based communication.
>>>> +
>>>> +- compatible
>>>> +
>>>> +    "xen,domain-shared-memory-v1"
>>>> +
>>>> +- xen,shm-id
>>>> +
>>>> +    An arbitrary string that represents the unique identifier of the =
shared
>>>> +    memory region, with a strict limit on the number of characters(\0
>>> included),
>>>> +    `MAX_SHM_ID_LENGTH(16)`. e.g. "xen,shm-id =3D "my-shared-mem-1"".
>>>> +
>>>> +- xen,shared-mem
>>>> +
>>>> +    An array takes a physical address, which is the base address of t=
he
>>>> +    shared memory region in host physical address space, a size, and =
a
>>> guest
>>>> +    physical address, as the target address of the mapping.
>>>> +    e.g. xen,shared-mem =3D < [host physical address] [size] [guest
>>>> + address] >
>>>=20
>>> Your implementation below is checking for overlap and also have some
>>> restriction. Can they be documented in the binding?
>>>=20
>>>> +
>>>> +    The number of cells for the host address (and size) is the same a=
s the
>>>> +    guest pseudo-physical address and they are inherited from the par=
ent
>>> node.
>>>=20
>>> In v5, we discussed to have the host address optional. However, the bin=
ding
>>> has not been updated to reflect that. Note that I am not asking to impl=
ement,
>>> but instead request that the binding can be used for such setup.
>>>=20
>> How about:
>> "
>> Host physical address could be omitted by users, and let Xen decide wher=
e it locates.
>> "
>=20
> I am fine with that.
>=20
>> Do you think I shall further point out that right now, this part feature=
 is not implemented
>> in codes?
>=20
> I have made a couple of suggestion for the code. But I think the binding =
would look a bit odd without the host physical address. We would now have:
>=20
> < [size] [guest address]>
>=20
> I think it would be more natural if we had
>=20
> <[guest address] [size]>
>=20
> And
>=20
> <[guest address] [size] [host physical address]>
>=20
>>>> a/xen/arch/arm/include/asm/setup.h
>>> b/xen/arch/arm/include/asm/setup.h
>>>> index 2bb01ecfa8..39d4e93b8b 100644
>>>> --- a/xen/arch/arm/include/asm/setup.h
>>>> +++ b/xen/arch/arm/include/asm/setup.h
>>>> @@ -23,10 +23,19 @@ typedef enum {
>>>>   }  bootmodule_kind;
>>>>=20
>>>>=20
>>>> +#ifdef CONFIG_STATIC_SHM
>>>> +/* Indicates the maximum number of characters(\0 included) for shm_id
>>>> +*/ #define MAX_SHM_ID_LENGTH 16 #endif
>>>=20
>>> Is the #ifdef really needed?
>>>=20
>>>> +
>>>>   struct membank {
>>>>       paddr_t start;
>>>>       paddr_t size;
>>>>       bool xen_domain; /* whether the memory bank is bound to a Xen
>>>> domain. */
>>>> +#ifdef CONFIG_STATIC_SHM
>>>> +    char shm_id[MAX_SHM_ID_LENGTH];
>>>> +    unsigned int nr_shm_borrowers;
>>>> +#endif
>>>>   };
>>>=20
>>> If I calculated right, the structure will grow from 24 to 40 bytes. At =
the
>>> moment, this is protected with CONFIG_STATIC_SHM which is unsupported.
>>> However, I think we will need to do something as we can't continue to g=
row
>>> 'membank' like that.
>>>=20
>>> I don't have a quick suggestion for 4.17 (the feature freeze is in a we=
ek). Long
>>> term, I think we will want to consider to move the shm ID in a separate=
 array
>>> that could be referenced here.
>>>=20
>>> The other solution would be to have the shared memory regions in a
>>> separate array. They would have their own structure which would either
>>> embedded "membank" or contain a pointer/index to the bank.
>>>=20
>> Ok, so other than this fixing, others will be addressed in the next seri=
e. And this
>> part fixing will be introduced in a new follow-up patch serie after 4.17=
 release.
>> I'm in favor of introducing a new structure to contain shm-related data =
and let
>> 'membank' contains a pointer to it, like
>> ```
>>  +struct shm_membank {
>> +    char shm_id[MAX_SHM_ID_LENGTH];
>> +    unsigned int nr_shm_borrowers;
>> +}
>> +
>>  struct membank {
>>      paddr_t start;
>>      paddr_t size;
>>      bool xen_domain; /* whether the memory bank is bound to a Xen domai=
n. */
>> +    struct shm_membank *shm;
>>  };
>> ```
>> Then every time we introduce a new feature here, following this strategy=
, 'membank' will
>> at most grow 8 bytes for the reference.
>=20
> Be aware that we are very early in Xen and therefore dynamically allocati=
ng memory is not possible. Therefore 'shm_membank' would most likely need t=
o be static.
>=20
> At which point, this could be an index.
>=20
>> I'm open to the discussion and will let it decide what it finally will b=
e. ;)
>=20
> My original idea was to have 'shm_membank' pointing to the 'membank' rath=
er than the other way around. But I don't have a strong argument either way=
.
>=20
> So I would need to see the resulting code. Anyway, that's for post-4.17.

Following ongoing gitlab discussion, it might be a good example of a case w=
here creating a new gitlab ticket would make sense :-)

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


