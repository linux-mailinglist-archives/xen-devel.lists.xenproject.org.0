Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97746224C2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 08:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440679.694793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfdz-0006P2-JS; Wed, 09 Nov 2022 07:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440679.694793; Wed, 09 Nov 2022 07:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfdz-0006Mc-Fx; Wed, 09 Nov 2022 07:37:07 +0000
Received: by outflank-mailman (input) for mailman id 440679;
 Wed, 09 Nov 2022 07:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIzN=3J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1osfdy-0006MV-1I
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 07:37:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130057.outbound.protection.outlook.com [40.107.13.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e5e08ca-6001-11ed-8fd1-01056ac49cbb;
 Wed, 09 Nov 2022 08:37:04 +0100 (CET)
Received: from DB6PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::26)
 by VE1PR08MB5648.eurprd08.prod.outlook.com (2603:10a6:800:1af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 07:37:01 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::9a) by DB6PR1001CA0016.outlook.office365.com
 (2603:10a6:4:b7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 07:37:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 07:37:01 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Wed, 09 Nov 2022 07:37:00 +0000
Received: from 26798a4ec1a8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59340BB6-F2F5-4E91-AC9F-4E3D67F76701.1; 
 Wed, 09 Nov 2022 07:36:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 26798a4ec1a8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 07:36:55 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU0PR08MB9704.eurprd08.prod.outlook.com (2603:10a6:10:444::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 07:36:52 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%6]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 07:36:52 +0000
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
X-Inumbo-ID: 4e5e08ca-6001-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lTA99b4+97FEyTmCKYJ9SgBmILl0BMLruj8gOGtoyulqcR10P6eMRiFcf9BTKMFS/7XvHlnyjSqPTBsPb0qxFNipnl9cEiljp1l82p2u9gyNgbV6OYCq7iH3HVMTVqzTNNCv3gDf/mD0hj/2PZtLzow4+5PquVClJe5Cnnt65me/ORzjZ2XT3lkdwf+qoJMJauhl+7M/azrnfxZ/FbNAyxK6jRJPWNmsWjFOGjjPOaRkBChPGM+faRMVTfFl8gez3XkNfE+ffT0OmN+cpc8LYj+/6s3V4UL32pCXEoUiHTStgF2T/TPw8QPU5v1YTVioER5IE8TRxIPJBz9vGYNTQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vns+0iou+lENK/ivLgNbjkfAx/dahjp+GaEwI/zT/E=;
 b=RvlOdw4dgE2FQcoT0raeXvzzkqX8N0IvbUhiRgHfWfbaBuodO4fvXqPcq8T7Slp3p820ugn3T/nXzfO2nhJegsWAY3gb6Q/9IAQl5rD85z1LfI9Bft8URaukAHkWMQT2J71L/1/MWj7efUcrJ3JUiH+lh3Y1u9S50kFRYRZZqUR72KltmwBdBSzsk0Npnututiwx4XopknPciNnzkrus09k+NXGyi4LL6J0qsd8EQ3lFOVF0dMMPgnTJKcllzRJ+TNn1AyWpMFMdUjhPN8ijpjGR/cZQCHvUYbYlTZilqoA/iMaBli6bHLzwwNTLx6U1XGdI+0jfSIteIFEPGXpu8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vns+0iou+lENK/ivLgNbjkfAx/dahjp+GaEwI/zT/E=;
 b=wgj4bd5LaXYULl4P0zVyw6ZeZ4UWJ9xGwZrAu0FqG6OrG6RI4ZW/YQAcY5/WV55s/9NfUb/Z+lIs60dve6UTzz3vqWlj90Gy5sJxCV39agSh7RVSz+D3Am9AgLO2SxcsxY5/xxvl1NpUBUglcKV+iQZw8msbCKXuI1JGxg854Ac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej6HDqxTr113oeCqTWhp63LFrXeUuJivh//85EqLIZrkl4JhTvqQzEbovEE+HdMurkSAAtjfhx+CK2kD8WxPePlIV4fE1byAm3SSol2Sq06EbGIVBUERDefwsLjfBmNYwvEbMGc3jaWcF00HnGrfGXgqFmknWFeObjAPO3UcHvunIbfIcoYDiGtkZzCpyYaOH27DIn1vFfd/O7bsGiE00z6zJe+/y8Rewh1wcCYIZ+FC8SLiXc0fQhVDlavX+xQoDy05VSR/FM9Lw8wf4G9R4IeKTUB84/MY3hZimE5TE/GrMBYV4qyqkIJamoGLljaI9stGgOCRTrnJ55J+LGG/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vns+0iou+lENK/ivLgNbjkfAx/dahjp+GaEwI/zT/E=;
 b=FZfEJiuUxXOPOVqul4tTk48AaHLFHjNA03kS0du2tWvURE41qcgvjMrwYUwKk+zSIh3KK71EhBLlvOZ9EzzVjDLJxCuyHSv5NMU1BVwZHIhhQ3Z+FGXCE2SFV4bRjyPsESNGZjOf4VLMrnXUBKWos+JF7mlOlWlEMNquPU1r0/dehR/E+jQUYrDsVJsf5HDCFTVOGw7aUduXS/Byn6xLPJGWUiwKs5PQNnraE8jtK/RVj3VqUmBLduMpBbfNhSVuRvLFhbXpext5uEChsWeE7DLx9RxCGXEpGQ8eQ1OnYSig7lz85swy8BCuRfeG2FYgOW5J9NH+V31NiJpbtF0ZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vns+0iou+lENK/ivLgNbjkfAx/dahjp+GaEwI/zT/E=;
 b=wgj4bd5LaXYULl4P0zVyw6ZeZ4UWJ9xGwZrAu0FqG6OrG6RI4ZW/YQAcY5/WV55s/9NfUb/Z+lIs60dve6UTzz3vqWlj90Gy5sJxCV39agSh7RVSz+D3Am9AgLO2SxcsxY5/xxvl1NpUBUglcKV+iQZw8msbCKXuI1JGxg854Ac=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: RE: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
Thread-Topic: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
Thread-Index: AQHY8DVrMB29cZJCrk+wAkCu80OmKq4yVgCAgAPeDBA=
Date: Wed, 9 Nov 2022 07:36:51 +0000
Message-ID:
 <PAXPR08MB74206E8C1513DC90DCD71CEC9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-9-wei.chen@arm.com>
 <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
In-Reply-To: <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 61B006AB516CED4087C067F3B9318C18.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DU0PR08MB9704:EE_|DBAEUR03FT049:EE_|VE1PR08MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: b8218745-ed58-4534-8714-08dac2253090
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1q6DLx26Xt86ovXFsA3tAtJUs/q5Y5NdEDkP/n9vU/gzr0fyOuf3gvjzLxVSUY0vI64eDfb7Med2BWu0quBiyjwEHvKqi4h5jBXok3cwZSsrRA22tAgDAAkaLjJAzkmWpvqNXvN0WmL0wXy6LebvKhZ0t71tVpQo295kZ+7NO1aEhD3TbQrvq2tkXE/V9zeea2WFOeN1nSBlR8bJFu+dpV3C7SPgXT0Zsbn6Tmi3ZYulB6T60l9XEZMWyNkt8ibsbUiP7Rm7pf6es6cFprmF3eqPza+VBJAqy60Y9IExdhMe+95E/WpXab2fT/lFFwCVREK6EZJFeMf/wxtKtXKmLgH1ts4XqA06iyriKsXN9NYHU7ohugNQehufVnSPOOV8QRQV6CJPNLwDs8NyeiNA/UPJCOmJB1qi84h5uOnxrqkriBNWmfAzKUquHle7zV0Bxm0tfeK3+R4JKFnapvOynVKVFbTEKk+dlHbOTLorbQuOw/Mm6iOqd7FXpPIGWC2ROfgU4bG7rBhyxQyODomCKQsd/HBetqNr5ZLZnO9Pl38CGj2/YxbGaaZpQYlYErHOGs4J+/rAtJEBKRB1E5EFOlhPegcndYZUgRxTxd4p9rXFNrUzVLlRpkX0cxhU2aPYmfLP5l0ET++qLwu+BQz5VTHQVcgN3gL2L9KMdiBFXDoJbJkzgErlwTWgAgkAPe8HPGoVG6NpVdX5Zurq11L+kENn5B+KPpW+kEHPq1nRqnayOQrUeTUHEiZxyWgM2WlUQgiSFqfSegMKTLQDhxvXu25QpsCqZ8TCiW13n+OAdrU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(66556008)(71200400001)(8936002)(8676002)(41300700001)(4326008)(76116006)(33656002)(52536014)(2906002)(66946007)(122000001)(64756008)(66446008)(66476007)(5660300002)(316002)(54906003)(55016003)(38070700005)(83380400001)(478600001)(7696005)(38100700002)(86362001)(6506007)(26005)(53546011)(186003)(9686003)(110136005)(66899015)(60764002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9704
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	652a8be0-8069-4ce2-6bfc-08dac2252b10
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7LkqSOwCJaklUy/P+yypJKVCklZQYmSqq3srZrd1lb0OMXydiwbEQ/RC5MCYn9Ws+TTb4PV8FKMD+MNDGDnqOpYT1QvjNCLVuTphwHxr8BVZCt5ZbKYofTGOCjmd8g/P686kr+jURz5xO8eCBAS267ZsR745f4Rzb1qFkOAfLayyzl4Z90VQP/vvKtVowZ9yHSZAPA+B4aYVQh78SSlu5UD4a07PvFLt6TR2ZBV4EFou4ozdCtbF6qnYE+3IWNEHx1EZ94LlHkCMpfATg/VQ7BgJPI2Ym10BTqAKFK+pZBNesFD+Lh3Pk+dm3wzPxkVg5U8T0JfwdxTV3tBAqjSr0QYOpI4Q+1CYHAqLcdjtSEwyRvm5mfsiTIPvIMYfnotvOd6pfMSp7ZephUiGrCWq5wwDATJukEdYhxspjYf28fvWQMITGl7ZPs8SuE1DAftAI+T35BWJHNok71E6kAaaz16HPInAeP8VamEeOj4C/DW9vd1SHPFefgk86hXWAF5sgDRYLLRN26Z0O2k5sqGTKgKvpCgF3/gAbre7+5xFSmOeiNh4cVqdpGoU9mW84lhjqS/xYtn2b6JLDWW/wXz5cFfXrYGg65omr0mZhNM1mL95Q9p3H+j7vn+SG5Q6PqV+dx+zkTfwJ+0FsWkTKlDXk23DlvEZji3YbAvJVzxBK+RYI4+ALlm5r/t7+8xX7Mib6FlkQ5935YwU9XiCLurL+OxeU2F8tC2FDDhQjmvLJkbaURFSd70EUDB6ECC0VFrJi+OTFWT4z9RyH6hGeqCv2iJ0iFi+3fFvho+OjG6KaL4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(70206006)(4326008)(40480700001)(55016003)(70586007)(110136005)(316002)(54906003)(82740400003)(52536014)(5660300002)(8676002)(36860700001)(33656002)(2906002)(7696005)(6506007)(47076005)(40460700003)(186003)(26005)(83380400001)(336012)(8936002)(53546011)(9686003)(478600001)(86362001)(81166007)(356005)(41300700001)(66899015)(82310400005)(60764002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 07:37:01.0546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8218745-ed58-4534-8714-08dac2253090
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5648

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeaciDfml6UgNDowNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDA4LzExXSB4ZW4vYXJtNjQ6IG1vdmUgTU1VIHJlbGF0ZWQgY29kZSBmcm9tIGhlYWQu
Uw0KPiB0byBoZWFkX21tdS5TDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAwNC8xMS8yMDIyIDEw
OjA3LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBUaGVyZSBhcmUgbG90cyBvZiBNTVUgc3BlY2lmaWMg
Y29kZSBpbiBoZWFkLlMuIFRoaXMgY29kZSB3aWxsIG5vdA0KPiA+IGJlIHVzZWQgaW4gTVBVIHN5
c3RlbXMuIElmIHdlIHVzZSAjaWZkZWYgdG8gZ2F0ZSB0aGVtLCB0aGUgY29kZQ0KPiA+IHdpbGwg
YmVjb21lIG1lc3N5IGFuZCBoYXJkIHRvIG1haW50YWluLiBTbyB3ZSBtb3ZlIE1NVSByZWxhdGVk
DQo+ID4gY29kZSB0byBoZWFkX21tdS5TLCBhbmQga2VlcCBjb21tb24gY29kZSBzdGlsbCBpbiBo
ZWFkLlMuDQo+IA0KPiBJIGFtIGFmcmFpZCB0aGF0IHlvdSBjYW4ndCBzaW1wbHkgbW92ZSB0aGUg
TU1VIGNvZGUgb3V0IG9mIGhlYWQuUw0KPiBiZWNhdXNlIHRoaXMgd2lsbCBicmVhayBYZW4gd2hl
biBydW5uaW5nIHVzaW5nIHRoZSBpZGVudGl0eSBtYXAuDQo+IA0KPiBUaGlzIGlzIGJlY2F1c2Ug
d2Ugb25seSBtYXAgdGhlIGZpcnN0IDRLQiBvZiBYZW4gd2l0aCBQQSA9PSBWQS4gQXQgdGhlDQo+
IG1vbWVudCwgd2UgZ3VhcmFudGVlIGl0IGJ5IGhhdmluZyBldmVyeXRoaW5nIHRoYXQgbmVlZHMg
dG8gYmUgdXNlZCBpbg0KPiB0aGUgaWRlbnRpdHkgbWFwcGluZyBiZWZvcmUgX2VuZF9ib290IGFu
ZCBjaGVja2luZyBhdCBsaW5rIHRpbWUgaWYgdGhpcw0KPiBmaXRzIGluIDRLQi4NCj4gDQo+IE5v
dyB0aGF0IHlvdSBtb3ZlZCB0aGUgTU1VIGNvZGUgb3V0c2lkZSBvZiBoZWFkLlMuIFdlIG5lZWQg
dG8gZmluZCBhDQo+IGRpZmZlcmVudCB3YXkgdG8gZ3VhcmFudGVlIGl0LiBPbmUgd2F5IHRvIGRv
IGl0IHdvdWxkIGJlIHRvIGNyZWF0ZSBhDQo+IHNlY3Rpb24gdGhhdCB3b3VsZCBiZSB1c2VkIGZv
ciBldmVyeXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgaWRlbnRpdHkgbWFwcGVkLg0KPiANCg0KUXVv
dGUgZnJvbSBuZXh0IGVtYWlsDQoiDQpMb29raW5nIGF0IHRoZSBjb2RlIHRoaXMgbW9ybmluZywg
SSBub3RpY2VkIHRoYXQgd2UgYWxyZWFkeSBoYXZlIHRoZSANCnNlY3Rpb24gIi50ZXh0LmhlYWRl
ciIuIEZvciBub3csIHRoYXQgc2hvdWxkIGRvIHRoZSBqb2IuIFNvIHdlIGp1c3QgbmVlZA0KdG8g
Y2hlY2sgdGhlIHNpemUgb2YgLnRleHQuaGVhZGVyLg0KDQpJZGVhbGx5LCBjaGVja2luZyB0aGUg
c2l6ZSBzaG91bGQgYmUgZG9uZSBpbiBhIHNlcGFyYXRlIHByZS1wYXRjaCBzbyBpdCANCmlzIGVh
c2llciB0byByZXZpZXcuDQoiDQoNCk9LLiBXZSB3aWxsIGNyZWF0ZSBhIHBhdGNoIHRvIGNoZWNr
IHRoZSBzaXplLCBhbmQgcGxhY2UgaXQgaW4gdGhlDQpoZWFkIG9mIHRoZSBzZXJpZXMuDQoNCj4g
Pg0KPiA+IEFzIHdlIG5lZWQgdG8gYWNjZXNzICJmYWlsIiBhbmQgInB1dHMiIGZ1bmN0aW9ucyBv
dXQgb2YgYXNzZW1ibHkNCj4gPiBmaWxlLCBzbyB3ZSBoYXZlIHRvIGV4cG9ydCB0aGVtIGluIHRo
aXMgcGF0Y2guIEFuZCB0aGUgYXNzZW1ibHkNCj4gPiBtYWNyb3M6IGFkcl9sIGFuZCBsb2FkX3Bh
ZGRyIHdpbGwgYmUgdXNlZCBieSBNTVUgYW5kIE1QVSBsYXRlciwNCj4gPiBzbyB3ZSBtb3ZlIHRo
ZW0gdG8gbWFjcm9zLmguDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5y
eS5XYW5nQGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFy
bS5jb20+DQo+IA0KPiBJbiBnZW5lcmFsLCB0aGUgZmlyc3Qgc2lnbmVkLW9mZiBzaG91bGQgbWF0
Y2ggdGhlIGF1dGhvci4gU28gd2hvIGlzIHdobw0KPiBoZXJlPw0KPiANCg0KSSB3aWxsIGFkanVz
dCB0aGlzIG9yZGVyLg0KDQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvTWFrZWZp
bGUgICAgICAgICAgICAgfCAgIDMgKw0KPiA+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyAg
ICAgICAgICAgICAgIHwgNDA3ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgeGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWRfbW11LlMgICAgICAgICAgIHwgMzY0ICsrKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21hY3Jvcy5oIHwgIDUy
ICsrLQ0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA0MzIgaW5zZXJ0aW9ucygrKSwgMzk0IGRlbGV0
aW9ucygtKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9oZWFk
X21tdS5TDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L01ha2VmaWxl
IGIveGVuL2FyY2gvYXJtL2FybTY0L01ha2VmaWxlDQo+ID4gaW5kZXggNmQ1MDdkYTBkNC4uMjJk
YTJmNTRiNSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvTWFrZWZpbGUNCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvTWFrZWZpbGUNCj4gPiBAQCAtOCw2ICs4LDkgQEAg
b2JqLXkgKz0gZG9tY3RsLm8NCj4gPiAgIG9iai15ICs9IGRvbWFpbi5vDQo+ID4gICBvYmoteSAr
PSBlbnRyeS5vDQo+ID4gICBvYmoteSArPSBoZWFkLm8NCj4gPiAraWZuZXEgKCQoQ09ORklHX0hB
U19NUFUpLHkpID4gK29iai15ICs9IGhlYWRfbW11Lm8NCj4gPiArZW5kaWYNCj4gPiAgIG9iai15
ICs9IGluc24ubw0KPiA+ICAgb2JqLSQoQ09ORklHX0xJVkVQQVRDSCkgKz0gbGl2ZXBhdGNoLm8N
Cj4gPiAgIG9iai15ICs9IHNtYy5vDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4gaW5kZXggY2NlZGYyMGRj
Ny4uZDlhOGRhOTEyMCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
DQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiA+IEBAIC0yNSwxNyArMjUs
NiBAQA0KPiA+ICAgI2luY2x1ZGUgPGVmaS9lZmllcnIuaD4NCj4gPiAgICNpbmNsdWRlIDxhc20v
YXJtNjQvZWZpYmluZC5oPg0KPiA+DQo+ID4gLSNkZWZpbmUgUFRfUFQgICAgIDB4ZjdmIC8qIG5H
PTEgQUY9MSBTSD0xMSBBUD0wMSBOUz0xIEFUVFI9MTExIFQ9MSBQPTENCj4gKi8NCj4gPiAtI2Rl
ZmluZSBQVF9NRU0gICAgMHhmN2QgLyogbkc9MSBBRj0xIFNIPTExIEFQPTAxIE5TPTEgQVRUUj0x
MTEgVD0wIFA9MQ0KPiAqLw0KPiA+IC0jZGVmaW5lIFBUX01FTV9MMyAweGY3ZiAvKiBuRz0xIEFG
PTEgU0g9MTEgQVA9MDEgTlM9MSBBVFRSPTExMSBUPTEgUD0xDQo+ICovDQo+ID4gLSNkZWZpbmUg
UFRfREVWICAgIDB4ZTcxIC8qIG5HPTEgQUY9MSBTSD0xMCBBUD0wMSBOUz0xIEFUVFI9MTAwIFQ9
MCBQPTENCj4gKi8NCj4gPiAtI2RlZmluZSBQVF9ERVZfTDMgMHhlNzMgLyogbkc9MSBBRj0xIFNI
PTEwIEFQPTAxIE5TPTEgQVRUUj0xMDAgVD0xIFA9MQ0KPiAqLw0KPiA+IC0NCj4gPiAtLyogQ29u
dmVuaWVuY2UgZGVmaW5lcyB0byBnZXQgc2xvdCB1c2VkIGJ5IFhlbiBtYXBwaW5nLiAqLw0KPiA+
IC0jZGVmaW5lIFhFTl9aRVJPRVRIX1NMT1QgICAgemVyb2V0aF90YWJsZV9vZmZzZXQoWEVOX1ZJ
UlRfU1RBUlQpDQo+ID4gLSNkZWZpbmUgWEVOX0ZJUlNUX1NMT1QgICAgICBmaXJzdF90YWJsZV9v
ZmZzZXQoWEVOX1ZJUlRfU1RBUlQpDQo+ID4gLSNkZWZpbmUgWEVOX1NFQ09ORF9TTE9UICAgICBz
ZWNvbmRfdGFibGVfb2Zmc2V0KFhFTl9WSVJUX1NUQVJUKQ0KPiA+IC0NCj4gPiAgICNkZWZpbmUg
X19IRUFEX0ZMQUdfUEFHRV9TSVpFICAgKChQQUdFX1NISUZUIC0gMTApIC8gMikNCj4gPg0KPiA+
ICAgI2RlZmluZSBfX0hFQURfRkxBR19QSFlTX0JBU0UgICAxDQo+ID4gQEAgLTgyLDczICs3MSwy
MiBAQA0KPiA+ICAgICogIHgzMCAtIGxyDQo+ID4gICAgKi8NCj4gPg0KPiA+IC0jaWZkZWYgQ09O
RklHX0VBUkxZX1BSSU5USw0KPiA+IC0vKg0KPiA+IC0gKiBNYWNybyB0byBwcmludCBhIHN0cmlu
ZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLg0KPiA+IC0gKg0KPiA+IC0gKiBDbG9iYmVy
cyB4MCAtIHgzDQo+ID4gLSAqLw0KPiA+IC0jZGVmaW5lIFBSSU5UKF9zKSAgICAgICAgICBcDQo+
ID4gLSAgICAgICAgbW92ICAgeDMsIGxyIDsgICAgIFwNCj4gPiAtICAgICAgICBhZHIgICB4MCwg
OThmIDsgICAgXA0KPiA+IC0gICAgICAgIGJsICAgIHB1dHMgICAgOyAgICBcDQo+ID4gLSAgICAg
ICAgbW92ICAgbHIsIHgzIDsgICAgIFwNCj4gPiAtICAgICAgICBST0RBVEFfU1RSKDk4LCBfcykN
Cj4gPiArLnNlY3Rpb24gLnRleHQuaGVhZGVyLCAiYXgiLCAlcHJvZ2JpdHMNCj4gPiArLyouYWFy
Y2g2NCovDQo+IA0KPiBUaGUgcGF0Y2ggaXMgYWxyZWFkeSBxdWl0ZSBkaWZmaWN1bHQgdG8gcmVh
ZC4gU28gSSB3b3VsZCByYXRoZXIgcHJlZmVyDQo+IGlmIHRoZSBpbmRlbnRhdGlvbiBpcyBjaGFu
Z2VkIHNlcGFyYXRlbHkuDQo+IA0KDQpPay4NCg0KPiBGdXJ0aGVybW9yZSwgSSB0aGluayBpdCB3
b3VsZCBiZSBiZXN0IGlmIHRoZSBmdW5jdGlvbnMgbW92ZWQgaW4gdGhlDQo+IGhlYWRlciBhcmUg
ZG9uZSBzZXBhcmF0ZWx5IHRvIGhlbHAgY2hlY2tpbmcgKEkgd291bGQgYmUgYWJsZSB0byBkaWZm
IHRoZQ0KPiBzb3VyY2Ugd2l0aCB0aGUgZGVzdGluYXRpb24gbW9yZSBlYXNpbHkpLg0KPiANCg0K
RGlkIHlvdSBtZWFuIHRvIGNyZWF0ZSBhIHNlcGFyYXRlIHBhdGNoIGZvciBtb3ZpbmcgdGhlIGZ1
bmN0aW9ucyBpbiBtYWNyby5oPw0KT3IgaW4gaGVhZGVyIHNlY3Rpb24/DQoNCj4gPg0KPiA+ICAg
LyoNCj4gPiAtICogTWFjcm8gdG8gcHJpbnQgdGhlIHZhbHVlIG9mIHJlZ2lzdGVyIFx4Yg0KPiA+
ICsgKiBLZXJuZWwgc3RhcnR1cCBlbnRyeSBwb2ludC4NCj4gPiArICogLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IA0KPiBTYW1lIGhlcmUgYWJvdXQgdGhlIGluZGVudGF0aW9uLiBJIHdp
bGwgbm90IGNvbW1lbnQgZXZlcnl3aGVyZSB3aGVyZSB0aGUNCj4gaW5kZW50YXRpb24gd2FzIGNo
YW5nZWQuIFNvIHBsZWFzZSBsb29rIGF0IGl0Lg0KPiANCg0KT0suIHdlIHdpbGwgdXNlIGEgc2Vw
YXJhdGUgcGF0Y2ggdG8gY2xlYW4gdGhlbS4NCg0KPiBbLi4uXQ0KPiANCj4gPiAtLyoNCj4gPiAt
ICogTWFwIHRoZSBVQVJUIGluIHRoZSBmaXhtYXAgKHdoZW4gZWFybHlwcmludGsgaXMgdXNlZCkg
YW5kIGhvb2sgdGhlDQo+ID4gLSAqIGZpeG1hcCB0YWJsZSBpbiB0aGUgcGFnZSB0YWJsZXMuDQo+
ID4gLSAqDQo+ID4gLSAqIFRoZSBmaXhtYXAgY2Fubm90IGJlIG1hcHBlZCBpbiBjcmVhdGVfcGFn
ZV90YWJsZXMgYmVjYXVzZSBpdCBtYXkNCj4gPiAtICogY2xhc2ggd2l0aCB0aGUgMToxIG1hcHBp
bmcuDQo+ID4gLSAqDQo+ID4gLSAqIElucHV0czoNCj4gPiAtICogICB4MjA6IFBoeXNpY2FsIG9m
ZnNldA0KPiA+IC0gKiAgIHgyMzogRWFybHkgVUFSVCBiYXNlIHBoeXNpY2FsIGFkZHJlc3MNCj4g
PiAtICoNCj4gPiAtICogQ2xvYmJlcnMgeDAgLSB4Mw0KPiA+IC0gKi8NCj4gPiAtc2V0dXBfZml4
bWFwOg0KPiA+IC0jaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USw0KPiA+IC0gICAgICAgIC8qIEFk
ZCBVQVJUIHRvIHRoZSBmaXhtYXAgdGFibGUgKi8NCj4gPiAtICAgICAgICBsZHIgICB4MCwgPUVB
UkxZX1VBUlRfVklSVFVBTF9BRERSRVNTDQo+ID4gLSAgICAgICAgY3JlYXRlX21hcHBpbmdfZW50
cnkgeGVuX2ZpeG1hcCwgeDAsIHgyMywgeDEsIHgyLCB4MywNCj4gdHlwZT1QVF9ERVZfTDMNCj4g
PiAtI2VuZGlmDQo+ID4gLSAgICAgICAgLyogTWFwIGZpeG1hcCBpbnRvIGJvb3Rfc2Vjb25kICov
DQo+ID4gLSAgICAgICAgbGRyICAgeDAsID1GSVhNQVBfQUREUigwKQ0KPiA+IC0gICAgICAgIGNy
ZWF0ZV90YWJsZV9lbnRyeSBib290X3NlY29uZCwgeGVuX2ZpeG1hcCwgeDAsIDIsIHgxLCB4Miwg
eDMNCj4gPiAtICAgICAgICAvKiBFbnN1cmUgYW55IHBhZ2UgdGFibGUgdXBkYXRlcyBtYWRlIGFi
b3ZlIGhhdmUgb2NjdXJyZWQuICovDQo+ID4gLSAgICAgICAgZHNiICAgbnNoc3QNCj4gPiAtDQo+
ID4gLSAgICAgICAgcmV0DQo+ID4gLUVORFBST0Moc2V0dXBfZml4bWFwKQ0KPiA+IC0NCj4gPiAg
IC8qDQo+ID4gICAgKiBTZXR1cCB0aGUgaW5pdGlhbCBzdGFjayBhbmQganVtcCB0byB0aGUgQyB3
b3JsZA0KPiA+ICAgICoNCj4gPiBAQCAtODEwLDQxICs0NTgsMTQgQEAgbGF1bmNoOg0KPiA+ICAg
RU5EUFJPQyhsYXVuY2gpDQo+ID4NCj4gPiAgIC8qIEZhaWwtc3RvcCAqLw0KPiA+IC1mYWlsOiAg
IFBSSU5UKCItIEJvb3QgZmFpbGVkIC1cclxuIikNCj4gPiArRU5UUlkoZmFpbCkNCj4gDQo+IFRo
aXMgbmFtZSBpcyBhIGJpdCB0b28gZ2VuZXJpYyB0byBiZSBleHBvc2VkLiBCdXQgaXQgd291bGQg
YmUgYmV0dGVyIHRvDQo+IGR1cGxpY2F0ZSBpdC4NCg0KWWVzLCBkdXBsaWNhdGUgaXQgbWlnaHQg
YmUgYmV0dGVyLiBXZSB3aWxsIGRvIGl0IGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KV2Vp
IENoZW4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

