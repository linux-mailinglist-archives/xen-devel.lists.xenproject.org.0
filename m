Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA9E809F28
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650468.1016033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX3f-0003v8-5E; Fri, 08 Dec 2023 09:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650468.1016033; Fri, 08 Dec 2023 09:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX3f-0003tT-1e; Fri, 08 Dec 2023 09:22:07 +0000
Received: by outflank-mailman (input) for mailman id 650468;
 Fri, 08 Dec 2023 09:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBX3d-0003Qs-N8
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:22:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f8c5b0f-95ab-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:22:03 +0100 (CET)
Received: from AS4P189CA0061.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::10)
 by PAWPR08MB9566.eurprd08.prod.outlook.com (2603:10a6:102:2e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 09:21:59 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::98) by AS4P189CA0061.outlook.office365.com
 (2603:10a6:20b:659::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Fri, 8 Dec 2023 09:21:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.24 via Frontend Transport; Fri, 8 Dec 2023 09:21:59 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Fri, 08 Dec 2023 09:21:59 +0000
Received: from 2febf2c35abb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2834117-C988-4AA1-93E9-213DD36109DF.1; 
 Fri, 08 Dec 2023 09:21:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2febf2c35abb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 09:21:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9948.eurprd08.prod.outlook.com (2603:10a6:10:3d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:21:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 09:21:45 +0000
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
X-Inumbo-ID: 3f8c5b0f-95ab-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RLgsvRtEoUmpg4uVGMs3b+HAVkxnxiNLOjMb9XSJAZsqiEYEeerzuVzDfFmv7+E/qCoMjpx4xjNpmT60r6wPQ1Y0nKjBnzf5TnJDpypFElGW3HxTKvTqg/ALwZBJAuY/niPxFEa5sqfzcrw2bObL9od9qV6y85Gr/FTeGwh4xH7YwAcxVkEddGNkXd2YCmiCZirwOagmM8ydmC8i/1ftvAkY3LXkmom6yj16+KTEZu5ioV3/1HIzuW7xPuPyWSzfaDerVOVaovWbUhBPa/kwhQ9TOxgRIZgCBYPlVpq8VlBUIWC4nCbcV4oQlGDFyP07ll8hln2ltTXT4skHtIaU6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOLpXlf3E3D3Vw8JXIqluXz4oNTHkg/1j/2b0/ZaXSI=;
 b=JXNsu3cls9IfIarZlneagOf7scCBY0esE1zcuLD6CzL2++NiVE6baAALbHhlczwki327mVGyzKmgjAtQaAzL8N6DXP55nGfEccV4s8KT3QxJS+eKGCCC8EAhHaPecoflotJKc8v8p+MQOi90dfiODT1zsoklGqSuEMXv2bEL5ds+cTBdUMF1h4FSmn3MR90rmTtZraME/j6rqr/lqhcPR0/Dy+dEmL7V36UZ4ru/8M9a3umSlY5TJofNPQiYaKRzN+kruvnx2HN44bMqQCcfMw2zPDAhQAW9uPnGxqL2kJ75ziqvLniMPzoi8Ps099UgHo6j1/bdrZdzbUbXcz5/aA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOLpXlf3E3D3Vw8JXIqluXz4oNTHkg/1j/2b0/ZaXSI=;
 b=PdRkZJFYnaa3ZVB/WVPqddih5hib2bfREeCT3rayebE9/ZhHJgd7Aygh0sL0oUjV8vFRmu2nuIUQO069hV7Mgi4cbAf3bcHeg30Y6X8UWjE2NBWNAnZWIju5lFPFMxnL9GgEV6BFLNtPkWgleTi/7mqv3wu4M7Sxxrs8EpCRh4o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11e09786bbff8ec5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpZRrFQqIPZGZQW+yce24K4fWguv5MgB35oaLna3Oq1RL4wUsjbt7RQ4x3oRa6S/w9ypLPL+Oe9FOHjkoYahPZE6m7wr6T8Xt9ZQyo0te9GyLwxhEJSwwtwcsT0MCnyX2rXMUFZ+M8Am9IPoCcu39ofIVL539xnh62uXLNscY7QQWHq8dsIHzyR5iK99WhkdGI01+mUfzmBd6hLhB7pPpU4X5gsKlB9FtmyCCDTH+GChl5u7QopeSKclg99NqlgXdEu4uT3BWyHVUlB6ll7GnqqacGSEmTAIRkgsSHS/2oTYVD/CqEzO1ZSrsIOf5xr7l9vyNwhgrWRagxhRU4B53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOLpXlf3E3D3Vw8JXIqluXz4oNTHkg/1j/2b0/ZaXSI=;
 b=LpkwX1U20y7Ld9ixwlgrITQvw2Jzt18Ov6Cybfs0byfjLVNCrb/cxE8Buex1QVVD+25ofz1OPhNR9/k9lVc/24bDSS7MlqNbeiug2/0Chiq6Ms/R+B79XCR2waiLT/RxUVBe5vtCZbdq+lz/eFNbI0k2EQM2jZhEP97XCweDgYebpFiVeMZVmvEbZNq8iv4vv82/XZbl1JixMs240wpj0knCnEhhGrZLio+imO34L7G+MfNYFZ9hrLDnH2lHHbzrnfTers+IzQY0JmHlHS6YZD6JdPv73hjVHCUDbaYa7CkvS4EItAJXsQgkiZ8lHDB6UyIdtux3imHPKXjYnO/RWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOLpXlf3E3D3Vw8JXIqluXz4oNTHkg/1j/2b0/ZaXSI=;
 b=PdRkZJFYnaa3ZVB/WVPqddih5hib2bfREeCT3rayebE9/ZhHJgd7Aygh0sL0oUjV8vFRmu2nuIUQO069hV7Mgi4cbAf3bcHeg30Y6X8UWjE2NBWNAnZWIju5lFPFMxnL9GgEV6BFLNtPkWgleTi/7mqv3wu4M7Sxxrs8EpCRh4o=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Topic: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Index: AQHaKZoAVIHO2rCYDECWUL8sUR2sfLCfFe6AgAACFwCAAAHkAIAAAsIA
Date: Fri, 8 Dec 2023 09:21:45 +0000
Message-ID: <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
 <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
In-Reply-To: <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9948:EE_|AM3PEPF0000A792:EE_|PAWPR08MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f9a881-77c1-4d83-dde8-08dbf7cf2186
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vujafXNqpG1qdyVEfFY+wHQ+4HhZhwRCGwurIfMHOwjWpEqvqL3aBcb9mzfVee+GPMZErILgfsr74j+0lrHKRsLTmldCbD+tO20LRI6ooBq65HnW8mPmAb/7eh5wuvARE4Tbm20uN7HoM32pnZX6YubLwFImsSCWvYTxEIiXlHiktpJSoRtQ3qHDXkpeQYulyuwxHPwZBKiUTlnvJVw+rnwFA5+T4bB1OTU9bcaKB1PpAuAsXkH5orD9aHyZsnY3gyu+PC75mnA0Xwqzc8fm21Bb/18GBJsYMgV4ZTzly63NcEGbZEHP+YVpylJ9q85aCgAgl1ikJ0dspXrvyuT32MKttVrWdFLtdjNSw35Xhn6dV/1BYj2Auoty91ApFOtEN0MKQ+iDM0cA2GByy3qQgK8CHYXt+VijNopP74PzzJ2Vgm4JulRd55qfa+KfVrozi/39GidT3anr0iWt3A1x/mkkNE0oRZprlOJGby+uSHW+PYc1/89sYv23whNUF/9KRjCbxpxoLuSRHF/gVmzj/CzC4lEvXnhflLhpU//CtkkwIpPNRe7QCm191qp5FMn/Zaijgj3OHdydbzKXDzqDyDkedchxMFbxr9UTwsgRvzUXqYNO4uzQJ4M61gntoNkcECBhqRUFdspKbsQcyT/S9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(5660300002)(8676002)(8936002)(4326008)(86362001)(38070700009)(36756003)(41300700001)(2906002)(33656002)(83380400001)(26005)(2616005)(38100700002)(122000001)(66476007)(66556008)(64756008)(66946007)(66446008)(91956017)(76116006)(54906003)(6916009)(316002)(6506007)(53546011)(71200400001)(6512007)(966005)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E585075C6356B4D801D0044B9FE4126@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9948
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4010a458-5c07-4000-67d1-08dbf7cf1954
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbjIwTANvuHFZGN/aF+95c6S9ej0aidoDeX2dmihRSO6aIN616RK6cqW3IyGjQA0gS+zsfoJmpWU08LafaJa96Nc7XOewovo88n7IJe4IaHO/7oeWKX+SvNaK22kYHFwW8DvTsBsAalqkrneNf03ddHOZvmOrAa2OcxcnVglxCjE5ub0qSmJxFXBC8ZAb0PPACRYK0E3gF4qXi8+vYnRdf+jolEoCr5+L8nkGbhrUpL3ZrrRtyDCp+X+jCqXG5z+HoCMD9FDRlnxnofZNC3Zy/WEsDGJpTUSzFOqPiAFxAFsIEVxY8+JP/V2fnQIF4umHcOLMQBb1rRuHr9olCB8KjDxQlcFv62Ad6yj5oZo1bX2susPUGDYTe4ouQ48uH79ir39kVuXeOyxWTlbK6HbvbK4jfbSYfyH7hn8FxjKzBcF4ZIHyW2DFEc3vXtdXQLYZOWhuTHEp3TTD4qHwRC2J8aDXBGO9OjuMtrLBsuIOEBXrDBMnAjcDFGHIeJTGdBD5H/BTU0KT7+pzouc/a3yXq8MNOdJJ9plSM5K/2dFI8rlz+8/SXUMN8VmQ5Aj4vcu05f8Q9L89DcCOnygW1wrwNChUMvNpRT9uL8swqvCrmEuwwzDLbk/ZLIH1ZfLZThYbLCpmbNH6xgxOZmAP1+hgCwaMqkK8UZGP4AA7ODQ6ADjcyu6PAccZKJQenfwNzSyyeQrlDg8DiW1Jgy9+lHAIc7swYaB4xBSHEgnpbXri3k=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(40460700003)(70586007)(316002)(70206006)(54906003)(41300700001)(36756003)(6512007)(36860700001)(33656002)(336012)(26005)(6506007)(2616005)(478600001)(6486002)(966005)(86362001)(356005)(53546011)(81166007)(83380400001)(82740400003)(47076005)(40480700001)(2906002)(5660300002)(8676002)(6862004)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:21:59.5209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f9a881-77c1-4d83-dde8-08dbf7cf2186
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9566

SGkgTWljaGFsLA0KDQo+IE9uIERlYyA4LCAyMDIzLCBhdCAxNzoxMSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IE9uIDA4LzEyLzIwMjMgMTA6MDUsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+PiANCj4+IEhpIE1pY2hhbCwNCj4+IA0KPj4+IE9uIERlYyA4LCAyMDIz
LCBhdCAxNjo1NywgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+
Pj4gDQo+Pj4gSGkgSGVucnksDQo+Pj4gDQo+Pj4gT24gMDgvMTIvMjAyMyAwNjo0NiwgSGVucnkg
V2FuZyB3cm90ZToNCj4+Pj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9leHBlY3Qv
ZnZwLWJhc2Utc21va2UtZG9tMC1hcm02NC5leHAgYi9hdXRvbWF0aW9uL3NjcmlwdHMvZXhwZWN0
L2Z2cC1iYXNlLXNtb2tlLWRvbTAtYXJtNjQuZXhwDQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNzU1
DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAuLjI1ZDlhNWY4MWMNCj4+Pj4gLS0tIC9kZXYvbnVsbA0K
Pj4+PiArKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvZXhwZWN0L2Z2cC1iYXNlLXNtb2tlLWRvbTAt
YXJtNjQuZXhwDQo+Pj4+IEBAIC0wLDAgKzEsNzMgQEANCj4+Pj4gKyMhL3Vzci9iaW4vZXhwZWN0
DQo+Pj4+ICsNCj4+Pj4gK3NldCB0aW1lb3V0IDIwMDANCj4+PiBEbyB3ZSByZWFsbHkgbmVlZCBz
dWNoIGEgYmlnIHRpbWVvdXQgKH4zMCBtaW4pPw0KPj4+IExvb2tpbmcgYXQgeW91ciB0ZXN0IGpv
YiwgaXQgdG9vayAxNiBtaW5zIChxdWl0ZSBhIGxvdCBidXQgSSBrbm93IEZWUCBpcyBzbG93DQo+
Pj4gKyBzZW5kX3Nsb3cgc2xvd3MgdGhpbmdzIGRvd24pDQo+PiANCj4+IFRoaXMgaXMgYSByZWFs
bHkgZ29vZCBxdWVzdGlvbi4gSSBkaWQgaGF2ZSB0aGUgc2FtZSBxdWVzdGlvbiB3aGlsZSB3b3Jr
aW5nIG9uDQo+PiB0aGUgbmVnYXRpdmUgdGVzdCB0b2RheS4gVGhlIHRpbWVvdXQgMjAwMCBpbmRl
ZWQgd2lsbCBmYWlsIHRoZSBqb2IgYXQgYWJvdXQgMzBtaW4sDQo+PiBhbmQgd2FpdGluZyBmb3Ig
aXQgaXMgaW5kZWVkIG5vdCByZWFsbHkgcGxlYXNhbnQuDQo+PiANCj4+IEJ1dCBteSBzZWNvbmQg
dGhvdWdodCB3b3VsZCBiZSAtIGZyb20gbXkgb2JzZXJ2YXRpb24sIHRoZSBvdmVyYWxsIHRpbWUg
bm93DQo+PiB3b3VsZCB2YXJ5IGJldHdlZW4gMTVtaW4gfiAyMG1pbiwgYW5kIGhhdmluZyBhIDEw
bWluIG1hcmdpbiBpcyBub3QgdGhhdCBjcmF6eQ0KPj4gZ2l2ZW4gdGhhdCB3ZSBwcm9iYWJseSB3
aWxsIGRvIG1vcmUgdGVzdGluZyBmcm9tIHRoZSBqb2IgaW4gdGhlIGZ1dHVyZSwgYW5kIGlmIHRo
ZQ0KPj4gR2l0TGFiIEFybSB3b3JrZXIgaXMgaGlnaCBsb2FkZWQsIEZWUCB3aWxsIHByb2JhYmx5
IGJlY29tZSBzbG93ZXIuIEFuZCBub3JtYWxseQ0KPj4gd2UgZG9u4oCZdCBldmVuIHRyaWdnZXIg
dGhlIHRpbWVvdXQgYXMgdGhlIGpvYiB3aWxsIG5vcm1hbGx5IHBhc3MuIFNvIEkgZGVjaWRlZA0K
Pj4gdG8ga2VlcCB0aGlzLg0KPj4gDQo+PiBNaW5kIHNoYXJpbmcgeW91ciB0aG91Z2h0cyBhYm91
dCB0aGUgYmV0dGVyIHZhbHVlIG9mIHRoZSB0aW1lb3V0PyBQcm9iYWJseSAyNW1pbj8NCj4gRnJv
bSB3aGF0IHlvdSBzYWlkIHRoYXQgdGhlIGF2ZXJhZ2UgaXMgMTUtMjAsIEkgdGhpbmsgd2UgY2Fu
IGxlYXZlIGl0IHNldCB0byAzMC4NCj4gQnV0IEkgd29uZGVyIGlmIHdlIGNhbiBkbyBzb21ldGhp
bmcgdG8gZGVjcmVhc2UgdGhlIGF2ZXJhZ2UgdGltZS4gfjIwIG1pbiBpcyBhIGxvdA0KPiBldmVu
IGZvciBGVlAgOikgSGF2ZSB5b3UgdHJpZWQgc2V0dGluZyBzZW5kX3Nsb3cgdG8gc29tZXRoaW5n
IGxvd2VyIHRoYW4gMTAwbXM/DQo+IFRoYXQgc2FpZCwgd2UgZG9uJ3Qgc2VuZCB0b28gbWFueSBj
aGFycyB0byBGVlAsIHNvIEkgZG91YnQgaXQgd291bGQgcGxheSBhIG1ham9yIHJvbGUNCj4gaW4g
dGhlIG92ZXJhbGwgdGltZS4NCg0KSSBhZ3JlZSB3aXRoIHRoZSBzZW5kX3Nsb3cgcGFydC4gQWN0
dWFsbHkgSSBkbyBoYXZlIHRoZSBzYW1lIGNvbmNlcm4sIGhlcmUgYXJlIG15IGN1cnJlbnQNCnVu
ZGVyc3RhbmRpbmcgYW5kIEkgdGhpbmsgeW91IHdpbGwgZGVmaW5pdGVseSBoZWxwIHdpdGggeW91
ciBrbm93bGVkZ2U6DQpJZiB5b3UgY2hlY2sgdGhlIGZ1bGwgbG9nIG9mIERvbTAgYm9vdGluZywg
Zm9yIGV4YW1wbGUgWzFdLCB5b3Ugd2lsbCBmaW5kIHRoYXQgd2Ugd2FzdGVkIHNvDQptdWNoIHRp
bWUgaW4gc3RhcnRpbmcgdGhlIHNlcnZpY2VzIG9mIHRoZSBPUyAobW9kbG9vcCwgdWRldi1zZXR0
bGUsIGV0YykuIEFsbCBvZiB0aGVzZSBzZXJ2aWNlcw0KYXJlIHJldHJpZWQgbWFueSB0aW1lcyBi
dXQgaW4gdGhlIGVuZCB0aGV5IGFyZSBzdGlsbCBub3QgdXAsIGFuZCBmcm9tIG15IHVuZGVyc3Rh
bmRpbmcgdGhleQ0Kd29u4oCZdCBhZmZlY3QgdGhlIGFjdHVhbCB0ZXN0KD8pIElmIHdlIGNhbiBz
b21laG93IGdldCByaWQgb2YgdGhlc2Ugc2VydmljZXMgZnJvbSByb290ZnMsIEkgdGhpbmsNCndl
IGNhbiBzYXZlIGEgbG90IG9mIHRpbWUuDQoNCkFuZCBob25lc3RseSwgSSBub3RpY2VkIHRoYXQg
cWVtdS1hbHBpbmUtYXJtNjQtZ2NjIHN1ZmZlcnMgZnJvbSB0aGUgc2FtZSBwcm9ibGVtIGFuZCBp
dCBhbHNvDQp0YWtlcyBhcm91bmQgMTVtaW4gdG8gZmluaXNoLiBTbyBpZiB3ZSBtYW5hZ2VkIHRv
IHRhaWxvciB0aGUgc2VydmljZXMgZnJvbSB0aGUgZmlsZXN5c3RlbSwgd2UNCmNhbiBzYXZlIGEg
bG90IG9mIHRpbWUuDQoNCkJ1dCBJIGZvdW5kIGl0IGRpZmZpY3VsdCB0byBkbyB0aGUgcHJvcGVy
IHRhaWxvcmluZywgYW55IHN1Z2dlc3Rpb25zPw0KDQpbMV0gaHR0cHM6Ly9naXRsYWIuY29tL3hl
bi1wcm9qZWN0L3Blb3BsZS9oZW5yeXcveGVuLy0vam9icy81NzA4NTU3ODUwL2FydGlmYWN0cy9m
aWxlL3Ntb2tlLnNlcmlhbA0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IEkgdXNlIEZWUCBx
dWl0ZSByYXJlbHkgdGhlc2UgZGF5cywgc28geW91IHNob3VsZCBrbm93IGJldHRlciBpZiB0aGlz
IGNhbiBiZSBwZXJjZWl2ZWQgYXMNCj4gdXN1YWwvbm9ybWFsIGJlaGF2aW9yLg0KPiANCj4gfk1p
Y2hhbA0KPiANCg0K

