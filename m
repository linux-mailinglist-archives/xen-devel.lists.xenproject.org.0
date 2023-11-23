Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA377F5B9D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 10:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639485.996912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66Is-0002XJ-Ji; Thu, 23 Nov 2023 09:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639485.996912; Thu, 23 Nov 2023 09:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66Is-0002V1-H9; Thu, 23 Nov 2023 09:47:22 +0000
Received: by outflank-mailman (input) for mailman id 639485;
 Thu, 23 Nov 2023 09:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ez7b=HE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r66Iq-0002Td-Pe
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 09:47:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49749a19-89e5-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 10:47:17 +0100 (CET)
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by DU0PR08MB9437.eurprd08.prod.outlook.com (2603:10a6:10:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 09:46:35 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::41) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 09:46:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.42) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023 09:46:35 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Thu, 23 Nov 2023 09:46:35 +0000
Received: from 128257856a1f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 533B44A1-2710-4DF6-A7A0-E7E6958867E5.1; 
 Thu, 23 Nov 2023 09:46:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 128257856a1f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Nov 2023 09:46:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9382.eurprd08.prod.outlook.com (2603:10a6:10:3f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.31; Thu, 23 Nov
 2023 09:46:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 09:46:21 +0000
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
X-Inumbo-ID: 49749a19-89e5-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZsFPFiMXrhddn+FsRr5j42iNuhm/Zcb6CfKzQWpUHBQWuhmATgxPb0tD4ICrTMXG486owAYdGXU3SwsSnpzHa7Aq17tWoVZjC1X3cZZxr94F/xzNp0bbD3hWHTqibeEEDudCa3GUuXNjCpB3vKYSDk9GlYCF6l2jFyDecZioCahpyLwRlIaLm3MQRBnINaGYtofaJxIh5hwKVg7n9n2zHn6VaxFgfbPxr1/9myLKm1+6vZIQQmXqVxZbclBr6hF7Zki4AtUQQbm/FV9m+sRCwO8zD4IhE/pCB8pef4TZVM4lLN6D+90N2cGJFriWVhDhpgvKHUNclVatZaXnp2wNXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbf0AfxFApnp8wTmzCnkGOSjBQ1ylYdJlW2MA9a0Vuc=;
 b=Ffpo+d53dUJKMO8fiSBby3gyhG1zxHknFJ6IlxHMjEY8bwETg6dUTAH7D4sFbGOmTJDVnmzeTPNvRVm12wyDL9XMbDPG4TEYwSRIo5dK5UvtUSSdrBKWwR/CLsVcVs3EUcIr5JpUvCBAogxarqx++0pO2QtCVzlkdwJ+nx0LTAR6zRWLFJod/pvVzMcPcWbXfizw19dkyEGnjtskIlStgQ9ONYL24LEP6noVN0mleyTypHsHE9s6LdqlJVt1of9Gdp7BTQY6Oy/maVz81m3D3n82Kci96MYmejU1Ra+wgsvWkyp9TbzEgZV2ZGVNnTZstpULbjaXebYL0ttID57BVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbf0AfxFApnp8wTmzCnkGOSjBQ1ylYdJlW2MA9a0Vuc=;
 b=qLuLqgIOPx1LfVGRUxIw3x6vlIJ4J4AZ31YY279v5jCFwgh/UU1GaUFnKHD9OtSJI2IX5MZogz4TKcYFinlV80c4jv3B7CSweYHmIQAYzFckLXC6OxZifHU931INtr/j3ffqIQNOtVAAOxx2imtvIHtcO/2u8H6Ji+UQbVfogl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5b6f45c63f9bd20
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPOdVMqXglUpVbrWpQY1VKGsLew/lpnGyUs4pRnTOJ8hIBSuGfdSKJ8UQfrqY1WM3flSirUAyPumEEvXYXdERpQfBA3w9qyu6VsgSk9AecLeXflr4ydqCvFe9LOZRxhFDl58Cq654r0DF85IHMrRo9iNcz7JtL1y8+dcickhucpAateLGwnpWOnZFrOlTWAy6oRqMJ+tuiTPlJuU3QJ8S2rsGGYtRTnw2UOGyYS/yp2U8NUT8N0Eatj4Cln0lW6Oo2OgVmUiOkjT2KMXaucAORNXcMlKzP17WOeMiXtG45NzarUJ4YOg+nwbtx49BxT2Yn2yOAAYeG2DQDe6xaR7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbf0AfxFApnp8wTmzCnkGOSjBQ1ylYdJlW2MA9a0Vuc=;
 b=OmtWcato3sWuBaPUD6jRnv7D86U2k7Dujx0th8FvcskPwE3oJd3MtQlKpzk605GCWTnKM4FJmgwrN4mNoKmL03GSiH4kdeCA+PMov27jXNcSS/yKCLdGI1JmifXHyZKJU3tG+qcQ6rsP6uOlx5G4a1ScF1eCOoKsmxccaKvv1+400AOqayFK0c5gFCGBfn2OlvAdp+GCTYxRG35r2nBh4CY2PAswS0ZFQTRqySAcP1Hh2MY76a6SmKiuowQnno+GpDTIFU8lqWCaKc2Er2mXBRk4p7IJavTGAddJUlagIaO5ZWrzF58tlxGOK0LFaQihXOFn2RlxrXv4IAA4jEvLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbf0AfxFApnp8wTmzCnkGOSjBQ1ylYdJlW2MA9a0Vuc=;
 b=qLuLqgIOPx1LfVGRUxIw3x6vlIJ4J4AZ31YY279v5jCFwgh/UU1GaUFnKHD9OtSJI2IX5MZogz4TKcYFinlV80c4jv3B7CSweYHmIQAYzFckLXC6OxZifHU931INtr/j3ffqIQNOtVAAOxx2imtvIHtcO/2u8H6Ji+UQbVfogl8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Topic: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Index: AQHaHLkYgzDzOjzraUK+7wQZW0TenrCFOoGAgAACTgCAAUCpgIAAJV8AgAEHfQA=
Date: Thu, 23 Nov 2023 09:46:20 +0000
Message-ID: <364FAA71-A00A-4D47-8210-DFE4EC590F79@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
 <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
 <3222AE09-B511-490E-8298-8808261DEFAE@arm.com>
 <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
In-Reply-To: <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9382:EE_|DU6PEPF0000A7E0:EE_|DU0PR08MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 2211a822-95b9-4e3a-cfe9-08dbec09151d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Bm3AyG3DP4xL8iS2oCjvTrD0w0rFAEL3UuUQoaZnbHkx5O9g1sPjrL1Aqz/7MpyXFVM+Ih/bXyhOuzG00xnbEDmw3uhaHO4YDXSeAAZK1iwLiJ28C1mjSZ3Xw9ytEmKOQd2xX88Wvqotvc4G65AWpRBO5KYlah2SEeAge53P5RKn2fezkU83y4AqZzdvwP5q2dRMD/3FCMiZSbFza99PfHMxWp8B0rKr5uvPYiHe6Zimotpb3KLBGvSa+7xQKNKkcNB8b0a+NJeFEGUYjHcV+LSWSlxYpL2+1hXyohjauwxj7MevdDiERBnBWOQP4Q9P+Jdb5Uo/3d09FyPBjVH6j7XywGimGLYTL0G7RcEa+Y6pFSk0i6pMsRmD0StYakBlrQjk6mrwXt/5hYZPidJXP3qFAyLeKQizdqLI73Fr2yJgwGwJmZxLX3ZhPTUi8Morp6vkP8oeHp3K4HeJeMksUyQJGSCbF3dq+nqMjTmXfrDVJoA0wWfm6zjbdevOiTy765+SotQvIx8eFVEkjfyv5+sw1094ssWSa1U6dchXpUEJptsCwKOrk9c7VF33EOZH1OFNkCPk04PWCm7NPoZb1F9PBuUEbkrST2vG0jhE0kpq3i+EftofYsWX39lp3AIzgZW0W63K7dkuG803ylCTwA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(376002)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6506007)(53546011)(26005)(6512007)(8676002)(54906003)(4326008)(76116006)(91956017)(66446008)(64756008)(6916009)(66476007)(316002)(66556008)(66946007)(122000001)(2616005)(478600001)(6486002)(83380400001)(71200400001)(38100700002)(8936002)(7416002)(5660300002)(2906002)(33656002)(41300700001)(36756003)(86362001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E3941A78B51C740A45532A29B294236@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9382
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f15ed85e-b356-47e6-48b7-08dbec090c60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2uf+0jwkJa3gEqYK0iaS3SG5mMou2SnYKnZP+ZVBQDR/VF2oWHgXdYEe0SlxWT41kjLU9no5VBWdCh2eaDYtoOP4nfAUhOa79HHPC3OnTPphwD//bQrDYII9b4srmZXQTkigTTj8M86xNhgTQbE9N9wyxPL0vcsdNW52Q3m54IgiSvJa2ioSUNG7ISYAttzMQnULwhIkzUSzbKOd+hWWh+WZrx727h8yvMZTo+3Ez27wKIRYUpjHbdn3KZzFbRettcvcGEuZNmaNPBAZIh+9QrIiZ6um9eIih0BEFsQVPdOYLxJj7aanke/5hvoJG5X7n030BMI+bXM6GslAMpeJ1az7qZdx6FXhQn9c6xig5eTKrsS6QV+eRa7rsigSPWMcZu+y12QwdEpvTsrmyYQCH+Vl6db4rdpTJOaygp6XTfsji/eCGXMxalSSu43A5nmFedAswwx0zInnFvhjIteUJtDLzzN0LmAZqBiOPC2DaxJkkcK6z+EeJ9MqT5mDeklNBNOYVMr8C4hEoZ+nSM5PqfIhAL92KSuv+lJpdh+3afjoQmpMyPy/8ueOKRKx5Qx4+tzdDxEh4LCqCYT2f6F8GiIoYv+lSrpuw3Qn7meZRpzRSgqK3KcLUmaVlBNRTNMcTTROiCQuykYVL6jLZlrNWMUpi2//T0Ddw0Blwtx8PO/gzHaGErVH/VUbTMwDQ0a+xBNCumOf8xTSH+ZcvC/YDutwKfsGa689xIW7H7VaK4snd2/dI2Se3g6lORuH8DZe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(40460700003)(36860700001)(26005)(336012)(53546011)(2616005)(83380400001)(6506007)(6512007)(8676002)(47076005)(6862004)(4326008)(41300700001)(8936002)(2906002)(478600001)(5660300002)(6486002)(316002)(54906003)(70206006)(70586007)(33656002)(86362001)(82740400003)(36756003)(356005)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:46:35.6193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2211a822-95b9-4e3a-cfe9-08dbec09151d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9437

DQoNCj4gT24gMjIgTm92IDIwMjMsIGF0IDE4OjAzLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDIyLzExLzIwMjMgMzo0OSBwbSwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+IA0KPj4+IE9uIDIxIE5vdiAyMDIzLCBhdCAyMDo0MSwgQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
T24gMjEvMTEvMjAyMyA4OjMzIHBtLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiArIENDIGhl
bnJ5DQo+Pj4+IA0KPj4+Pj4gT24gMjEgTm92IDIwMjMsIGF0IDIwOjE1LCBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gLVd3cml0
ZS1zdHJpbmdzIGlzIHVuaGFwcHkgd2l0aCBhc3NpZ25pbmcgInhlbiIgdG8gYSBtdXRhYmxlIHBv
aW50ZXIsIGJ1dCB0aGlzDQo+Pj4+PiBsb2dpYyBsb29rcyBpbmNvcnJlY3QuICBJdCB3YXMgaW5o
ZXJpdGVkIGZyb20gdGhlIHg4NiBzaWRlLCB3aGVyZSB0aGUgbG9naWMNCj4+Pj4+IHdhcyByZWR1
bmRhbnQgYW5kIGhhcyBub3cgYmVlbiByZW1vdmVkLg0KPj4+Pj4gDQo+Pj4+PiBJbiB0aGUgQVJN
IGNhc2UgaXQgaW5zZXJ0cyB0aGUgaW1hZ2UgbmFtZSBpbnRvICJ4ZW4seGVuLWJvb3RhcmdzIiBh
bmQgdGhlcmUgaXMNCj4+Pj4+IG5vIGxvZ2ljIGF0IGFsbCB0byBzdHJpcCB0aGlzIGJlZm9yZSBw
YXJzaW5nIGl0IGFzIHRoZSBjb21tYW5kIGxpbmUuDQo+Pj4+PiANCj4+Pj4+IFRoZSBhYnNlbmNl
IG9mIGFueSBsb2dpYyB0byBzdHJpcCBhbiBpbWFnZSBuYW1lIHN1Z2dlc3RzIHRoYXQgaXQgc2hv
dWxkbid0DQo+Pj4+PiBleGlzdCB0aGVyZSwgb3IgaGF2aW5nIGEgWGVuIGltYWdlIG5hbWVkIGUu
Zy4gImhtcC11bnNhZmUiIGluIHRoZSBmaWxlc3lzdGVtDQo+Pj4+PiBpcyBnb2luZyB0byBsZWFk
IHRvIHNvbWUgdW5leHBlY3RlZCBiZWhhdmlvdXIgb24gYm9vdC4NCj4+Pj4+IA0KPj4+Pj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuDQo+Pj4+PiANCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+Pj4+PiBDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4+Pj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+
Pj4+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4+Pj4+IENDOiBWb2xvZHlt
eXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+Pj4+PiBDQzogQmVydHJh
bmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+Pj4gQ0M6IFJvYmVydG8g
QmFnbmFyYSA8cm9iZXJ0by5iYWduYXJhQGJ1Z3NlbmcuY29tPg0KPj4+Pj4gQ0M6IE5pY29sYSBW
ZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4+Pj4+IA0KPj4+Pj4gdjI6DQo+
Pj4+PiAqIE5ldy4NCj4+Pj4+IA0KPj4+Pj4gSSdtIGFmcmFpZCB0aGF0IGFsbCBvZiB0aGlzIHJl
YXNvbmluZyBpcyBiYXNlZCBvbiByZWFkaW5nIHRoZSBzb3VyY2UgY29kZS4gIEkNCj4+Pj4+IGRv
bid0IGhhdmUgYW55IHdheSB0byB0cnkgdGhpcyBvdXQgaW4gYSByZWFsIEFSTSBVRUZJIGVudmly
b25tZW50Lg0KPj4+PiBJIHdpbGwgdGVzdCB0aGlzIG9uZSB0b21vcnJvdyBvbiBhbiBhcm0gYm9h
cmQNCj4+IEkgY29uZmlybSB0aGF0IGJvb3RpbmcgdGhvdWdoIFVFRkkgb24gYW4gYXJtIGJvYXJk
IHdvcmtzDQo+PiANCj4+IFJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1
QGFybS5jb20+DQo+PiBUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJt
LmNvbT4NCj4gDQo+IFRoYW5rcywgYW5kIHlvdSBjb25maXJtZWQgdGhhdCB0aGUgZmlyc3QgY21k
bGluZSBwYXJhbWV0ZXIgaXMgc3RpbGwgdXNhYmxlPw0KDQpZZXMsIEnigJltIHVzaW5nIGEgeGVu
LmNmZyBsaWtlIHRoaXM6DQoNCltnbG9iYWxdDQpkZWZhdWx0PXhlbg0KDQpbeGVuXQ0Kb3B0aW9u
cz1ub3JlYm9vdCBkb20wX21lbT00MDk2TSBib290c2NydWI9MCBpb21tdT1vbiBsb2dsdmw9ZXJy
b3IgZ3Vlc3RfbG9nbHZsPWVycm9yDQprZXJuZWw9SW1hZ2UgY29uc29sZT1odmMwIGVhcmx5Y29u
PXhlbmJvb3Qgcm9vdHdhaXQgcm9vdD1QQVJUVVVJRD02YTYwNTI0ZC0wNjFkLTQ1NGEtYmZkMS0z
ODk4OTkxMGVjY2QNCg0KQW5kIGluIFhlbiBib290IEkgY2FuIHNlZSB0aGlzOg0KDQpbLi4uXQ0K
KFhFTikgQ29tbWFuZCBsaW5lOiAgbm9yZWJvb3QgZG9tMF9tZW09NDA5Nk0gYm9vdHNjcnViPTAg
aW9tbXU9b24gbG9nbHZsPWVycm9yIGd1ZXN0X2xvZ2x2bD1lcnJvcg0KWy4uLl0NCg0KU28gSSB0
aGluayBpdOKAmXMgcGFzc2luZyBldmVyeSBwYXJhbWV0ZXINCg0KPiANCj4gfkFuZHJldw0KDQo=

