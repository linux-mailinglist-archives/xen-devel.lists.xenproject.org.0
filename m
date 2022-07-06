Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1B568777
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 13:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362182.592146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93fp-0006K5-7D; Wed, 06 Jul 2022 11:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362182.592146; Wed, 06 Jul 2022 11:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93fp-0006Ho-4P; Wed, 06 Jul 2022 11:58:29 +0000
Received: by outflank-mailman (input) for mailman id 362182;
 Wed, 06 Jul 2022 11:58:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LAHD=XL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o93fn-0006Hd-2l
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 11:58:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f135dd13-fd22-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 13:58:26 +0200 (CEST)
Received: from AS9PR05CA0040.eurprd05.prod.outlook.com (2603:10a6:20b:489::23)
 by DB4PR08MB8197.eurprd08.prod.outlook.com (2603:10a6:10:383::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 11:58:24 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::9) by AS9PR05CA0040.outlook.office365.com
 (2603:10a6:20b:489::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Wed, 6 Jul 2022 11:58:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 11:58:21 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Wed, 06 Jul 2022 11:58:15 +0000
Received: from 2cd8a98d0176.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D06582F-D626-47BF-B62D-52A5B97C5736.1; 
 Wed, 06 Jul 2022 11:58:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2cd8a98d0176.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 11:58:08 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7802.eurprd08.prod.outlook.com (2603:10a6:150:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 11:57:58 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 11:57:58 +0000
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
X-Inumbo-ID: f135dd13-fd22-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QAblQtGZEDVFY9RjGJ2AweEX5Ej+OJ0jg4i/ZIK8iT1hIPsvUKhBbZKsD/pFBDrJwV1AvVfWIAsvVBhxGSQYB3F+vOQyG0kVNhJaucgMC+nMm2Q6hn/0pIroFzBCz3B21z9WaWahYGcZFYYqAmmOAsEpnpb7icPqxLTWiMDGUPP6j2bXr59FdOyr8ywCeutSVwiMy2GWC2X8evajsfgLQR9LCkMyXyFSvXgTfaq6xI1ytBOw8FnrFKgp95fjWSRcBU2bZX6ogUDa6CQrsHs6zvmy5x0WtDOacK0CshTaO/RRc9x5bIasGRQaZLIu+8e0oXbKn1Z/9+S5xqc+jn2qUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ir3P2/8WVexRwE51Kmdee/xJgZjqwnO7nCx9vvwS8w=;
 b=f7dwJKqCu7JSjWL1VchoZK/SKLAH6mOIQuzgTNBdoXXM3iJu1jx0gskbfqyKhnAPd4jWgyuRgc35SWP91TxNItL7AuO9kqupiOpCwzK6IgPBmiD92kPb4jWp33NdWBX68aNJ9wpK1qpRp09tzAWVf1sMyyEVgG7KI/m9QoOlC5Jb88aFhoJZq8Rt/2SJzwdj1SH53/ntmyBWnvpgHKQYwZxljkgbHTh86Pu4MBgyZx75LY72Vl3CDGox1xAs7LFtGvGyuGN/71WCHpHNs+8E9BYQKZ9Z+G4prNMkSTCeq7saZ0c6DOa5Z50XDO+mt4Vj/Cp9grGwwD40lMmtsMyWRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ir3P2/8WVexRwE51Kmdee/xJgZjqwnO7nCx9vvwS8w=;
 b=9zzhfyZ/uu/jPehHOpz7p1Jpn1Aof6hQPj79MYOWUTWu7VrhngUcgs7wEBP2VRKPzXz1z6vQH/vBXWmdPIXnvBLvKMV7wNHJa3rh7/wNC6cVeqSPgitjvyjghlcPueZ1pSQTn6ETncBYEi9uWCey1vD7CEHY15h6UZmrEjRBqSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 475b56113fb5653a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bnj++qHnUZYFMkOAJaDV3jyy7yjZzDUMgZZkwc6Lz2C98N6ylf+7R+QSc6dOX44h90r7jGWrLSgO4xMS40ZPNuXENW+tyOlLTgRZqzO67RXRiE7rj5Yxs8qE/YLAY3eODc/WDDGHAK9jGtsfNvUp8AsURO7USq/ccAZrJCtMLXWFKEyKcriU02OvZAVraVAUsDIPuin8/qAg1HfavVVShtULfrN3llLc1xDWgdDFLe8XiciGyxfpbs6DvM6X2R6vWAMOfXyQssnUazeVSwbdA5MmcKE3M3Cfkl98MwyF/cpIdvVfHbHB/3AArKyT55WDsE62ChR+EiaqH7FGCRgVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ir3P2/8WVexRwE51Kmdee/xJgZjqwnO7nCx9vvwS8w=;
 b=PVF9WPoHWaLd7htjOv/dfEK1UmVxJRZSma0ye6xj206PyOo+nMqBc+xFtXtxuDv/P0BaMFQUKksc7pJo0qVV9cxm9RlQSO3kLMYKbiLo7z69OkB/3/eakrnPTBZu+tEr06EIk84Xa9pwwJ/3PcBp0RO0XxdqDb+ekrrP9W7miMSc9f7fgD3n99aIaJYPApRbVWYXKAig7REmtvZQng1YomHDh4+jLx9uAG04Z5GS/0CRvr/e7fZQQ+6kOQBMA+bQ27P9zVz6cxdCViElPm8PJ6LR8rPiDo+39V5OpEwLFrAI8GKMe6NJV5KqGn9ZKB1UzzYtwPSdwXveYkpXaBwYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ir3P2/8WVexRwE51Kmdee/xJgZjqwnO7nCx9vvwS8w=;
 b=9zzhfyZ/uu/jPehHOpz7p1Jpn1Aof6hQPj79MYOWUTWu7VrhngUcgs7wEBP2VRKPzXz1z6vQH/vBXWmdPIXnvBLvKMV7wNHJa3rh7/wNC6cVeqSPgitjvyjghlcPueZ1pSQTn6ETncBYEi9uWCey1vD7CEHY15h6UZmrEjRBqSY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to
 allocate specified port
Thread-Topic: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to
 allocate specified port
Thread-Index: AQHYhkXgFvoQlpdPN0O1CKuVc36nOK1v9mEAgAADLoCAAVkogA==
Date: Wed, 6 Jul 2022 11:57:57 +0000
Message-ID: <BCA05BEC-7F53-41D0-8E62-AD385781FE21@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <08fab20e71d280396d7b65397339ad9d9ab96d5c.1655903088.git.rahul.singh@arm.com>
 <9822e10e-ea7e-a39e-1270-14f0e2741325@suse.com>
 <473505a8-7df8-49a7-c33a-02b383efc22f@xen.org>
In-Reply-To: <473505a8-7df8-49a7-c33a-02b383efc22f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 523de96d-138a-4189-c983-08da5f46d323
x-ms-traffictypediagnostic:
	GV1PR08MB7802:EE_|AM5EUR03FT019:EE_|DB4PR08MB8197:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GFlWJMJagZfE+Y9zLTSdPb7FEDAKTyzycSTEyoIrALBEMHGg91Y/P10NfaaA6hJdewAi43SPOhOYVJflupfWiwF7AU0UE6qqKvfBxIc0NqXmcuBvK3+23bLb7HzWKFfZzFVlzZW0G0C2BHRbY/Ze0B2XETUnqxHrelQ1nmdlbvYF5q/PfWNOEIanqHNGcYJs2iwuSy9pJ4iOnnlAdBstAhYlK/XrzOzDTL69YbCXx9rCl4vKY3itxdzfPIg2MeGByGrLpoFb2+dWHsKPGVLPQDqna9nxuC+I7wdWbwOIhv0sQ/dRvinWnyOcBy2C113r9VO8xzeGMgHyrADZH76KtEM9juDJVvrcKCOJvsSHE8osGTttj4tOyI11UvAWrkoOoEGdvViXZHHB6wkC49bJ0u3TbxFZWNwZNTNl15QqMFbOAo2rloELN6f9xsLJEtiYNRLoBkOvzvtNmRWvPA5fQtYcEtrg7wx3nF0UzYpWu9L1gYM8hGPK+QqMS3Br9LgzW6C0UFuePGibFacWqHoMLFOrOVEGND1IS1aJU0PHXr7x1+gLbeLcPJSsV3e6MdVTLWogLS2GazdNrres+lqVVI8pI20NP9/7+Ua42KBU3TJFHzEE0pNoZVtMlBXrQkMHQs/I/J097vcPQGXbvRcixyeNTujbgzvfIIz53fLYu4byjtLMu4t5a+ybzS0BL5K1L7iSWchMCSFoUC8URlIOoDfwmnT5BveSTLPL/vx/6ayZAV81zDMlIoQQglmpY3NqO3XvZtF61NJqbyiJC1yy8V5aa8ZUuYavoosSSjI0tKwjdETnscex2NxQVBF3BnYUEXZM6N5ySYnPQjTWOD4VXWNE3Adex4MtGNFx+4WdB64=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(2906002)(36756003)(2616005)(33656002)(8936002)(83380400001)(186003)(38100700002)(91956017)(41300700001)(53546011)(26005)(4744005)(5660300002)(6512007)(6916009)(76116006)(38070700005)(66946007)(6506007)(4326008)(6486002)(66446008)(64756008)(66556008)(122000001)(8676002)(66476007)(71200400001)(316002)(54906003)(86362001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C5AE0279D407D4C9962EB5B7055BCDB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7802
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9a19a2a-faf5-4cbe-75f8-08da5f46c4c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DXcd+mKkTt5Lwx6ryyTl4UJSDyGztLiINJixbUJ5kVvaTT79p39c0mmkdmPn6ebAkRmMyLmXNgwJugnfOxRSMgz/g9Uh2FAmILZ0LCHdOal3jy68YPEAOMvrn8rCmNtpV+Nk5bWXXQUrG0rgg14Fq9w2/aKzhWkgc1Nz5n64FnEMVQvns/V+hxdLaUzrXrijQ2gPvm4nXYP92yhvQv/XI28Rakuf5Xwk721rWZ9L+jY4YgCNYLIm6tmXW3CsDnsMo6DimRjz2pW4UL/QrI0AHfV5QD5HSBk1BeSGsBB0w8yGVx2oIIsaJllb4p+N1PyIjMV03fJpPlZZi9yMjySRbEBnU7GK9PulBYpfhrL8JmiPL3nhV8Qreic1RNYm/i0Upl9pruH0H14/GV+oPx0Ep/i94RfZK2z8JVe9KdSdlHmtwNZ+aXMsr+J2NeD8uiLGvYGtVZKu+aBr/r0wLdlasVAJQVtcxXtWag4yvVJ3cqt50s9l7sfCjiruBG38dJvC4DAwaq6aE8zRf1/+niykN9md+TJwnkqZoCJ4I8JxVVxMS57R8wTQjfDlHNoL/O25F/aFAY5UsnyEZgNv8W+12YbrixQaC+VK0RrnXDoE0i+n/x4wVt4Upe96UFm4Psbw2Zt4J+6HBceiv/dYimCnZ8rdt7T0VpK9j3lhYPnYPVxmNtH9V4LJL9VpBeViHiSYeUkhOc8Q0tvC88zkgw5nPXxKdHejQ7fPuEyV9MGHJQDEoW1VGQo8KX7js7rxR9R31W6KeaagWsKejHeDOLMSwNrFHjS0J17LZ4IaqWldvX4iHq/NDoXy2xC3ovImLpal
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(40470700004)(8936002)(6862004)(6486002)(33656002)(478600001)(86362001)(356005)(4326008)(8676002)(6512007)(70586007)(70206006)(36860700001)(82740400003)(4744005)(82310400005)(5660300002)(40480700001)(2616005)(40460700003)(26005)(81166007)(186003)(53546011)(36756003)(316002)(47076005)(54906003)(336012)(6506007)(83380400001)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 11:58:21.9032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 523de96d-138a-4189-c983-08da5f46d323
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8197

Hi Julien,

> On 5 Jul 2022, at 4:22 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 05/07/2022 16:11, Jan Beulich wrote:
>> On 22.06.2022 16:38, Rahul Singh wrote:
>>> @@ -387,8 +392,19 @@ int evtchn_bind_interdomain(evtchn_bind_interdomai=
n_t *bind)
>>> spin_lock(&ld->event_lock);
>>> }
>>> - if ( (lport =3D get_free_port(ld)) < 0 )
>>> - ERROR_EXIT(lport);
>>> + if ( lport !=3D 0 )
>>> + {
>>> + if ( (rc =3D evtchn_allocate_port(ld, lport)) !=3D 0 )
>>> + ERROR_EXIT_DOM(rc, ld);
>>> + }
>>> + else
>>> + {
>>> + int alloc_port =3D get_free_port(ld);
>>> +
>>> + if ( alloc_port < 0 )
>>> + ERROR_EXIT_DOM(alloc_port, ld);
>>> + lport =3D alloc_port;
>>> + }
>> This is then the 3rd instance of this pattern. I think the logic
>> wants moving into get_free_port() (perhaps with a name change).
>=20
> I think the code below would be suitable. I can send it or Rahul can re-u=
se the commit [1]:

Thanks for the code. I will include this patch in next version.

Regards,
Rahul

