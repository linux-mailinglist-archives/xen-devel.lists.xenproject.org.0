Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60B5E7EC4
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 17:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410861.654000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obkpd-0004O3-On; Fri, 23 Sep 2022 15:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410861.654000; Fri, 23 Sep 2022 15:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obkpd-0004Kd-M3; Fri, 23 Sep 2022 15:43:13 +0000
Received: by outflank-mailman (input) for mailman id 410861;
 Fri, 23 Sep 2022 15:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQMd=Z2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1obkpc-0004KX-62
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 15:43:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130050.outbound.protection.outlook.com [40.107.13.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cbd64a9-3b56-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 17:43:09 +0200 (CEST)
Received: from AM6P194CA0090.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::31)
 by AS8PR08MB7337.eurprd08.prod.outlook.com (2603:10a6:20b:444::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 15:43:06 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::d6) by AM6P194CA0090.outlook.office365.com
 (2603:10a6:209:8f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 15:43:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 15:43:05 +0000
Received: ("Tessian outbound 9236804a5e9b:v124");
 Fri, 23 Sep 2022 15:43:05 +0000
Received: from f3fc23c10e67.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9FE9C4D-9092-4DA5-A709-35B9CE9424E2.1; 
 Fri, 23 Sep 2022 15:42:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3fc23c10e67.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Sep 2022 15:42:54 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB3PR08MB9111.eurprd08.prod.outlook.com (2603:10a6:10:43c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 15:42:52 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3475:c78d:9d75:6137]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3475:c78d:9d75:6137%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 15:42:52 +0000
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
X-Inumbo-ID: 6cbd64a9-3b56-11ed-9647-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jePM00MneEfZ5IM7n/OjIO0xyig9bx+chJG8G3S+jlhvV3vyPP5RCAowrqQqNE4o5yeiG6GKwzchp5JiZcgArbasbNRPkAlKPO74yqEquNwGdapc3PKJT2TcZsE6coV/DQDE1KAeDI0IadUPgfGY8sM/9osG60UJHLchkB6f1a8t9aKm883CJN9RykeTFY9fV0NIhfgA2s05ugBlsDV79AMcGGhxd/cDUzgAohqW4dNXYIl5GwKZKxDDzibYNhWjGYaAnQCcDC/09NTkxh8RV3SVNnE2EoxoqLSeF75l0HFlR2kkd4pfeg2g/zJrIcyBUEq+JMnynjbDsGyGSqCetA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+jU8+ToR2i5jp0usVgH7Lokh2KuQEXfN0JTZgDdlRU=;
 b=PFUHkzPo3hUpoFXheliJnV/gEq0TZoNbIRRn168ctCtFX9dRblbdpG3WFMZOAquA/iFe2RjEwbq6PNyQf8Ok9iEGW7zD9hp+GbaHkY+4fK+Trq6IVdUDbY6Vz2hSFWEv8MW1Wk1kzfcD06+lP0/yvNinhkxySxCiQdIHbkzLiqsqDVOF+6Pi9OrMiXPuIbp5vRT2xwJW4UvXbu359QgdA/x5xPfhfaIGMC4A0zwGGPbCA1Pxh3bFDG0KguaHJ5k7lyp6y9zlzwYOsBoINbAIT+goMF/7TJLKZdbPR2nTI4Y6XCtPq4fPm0Q9QcD4qCzt2dEoYQN4Cl5JRWiUO1cyLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+jU8+ToR2i5jp0usVgH7Lokh2KuQEXfN0JTZgDdlRU=;
 b=Mi9mdacy619XrEcALM5RS4GKSWgsuh3MzSvOLWj3FlWBeWGUhVcRlZGwsoP1ZSu63aSI23qyz5VxXa2mcMwL3dtgt7hfW3wPqXyZOWUZdMVKwNVZWaPot6mJ79c6+AXiXWqeg1IEIB9QeDm5o24I5NFElEfnkDdgQpbLvQOCLh4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3577572f0199be4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjDkYCysTXhL61HkBkdxE7BJ6oF6/XW4SWgoNtXQ5kzqhu+OEfLP6xNfIMsyVhwM/7ePdQSsmFPkY7b6TimItznzBNeYBKaTKPrAFgeki+uMGZGijnb/4Nf4Q6XJ9/6dlA6QC1g5Xk/dYUMBfrQyIZ9lP1SKV63lDMWV+mG+7fiuF4p1Rd5pPgLAAPZLFTUoueDShhTApVnLSE4zNmCb4Ny8KK2u3UiY06pmG/2+u3uL4LBh1U8rxXWDq4pDp6+0qaudsOcxnlrG9IIOTzxsXZrateCOHqvySc8dUHpPlmzuIGY7yEHHtvGMyk2tTipbda6rHv0NCFqp4xaPJitkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+jU8+ToR2i5jp0usVgH7Lokh2KuQEXfN0JTZgDdlRU=;
 b=RY7yc8Ky0XVui+NzUR2+91q+kzzp9yppyQMNiexDw7XiQw0VeG3/BEjN4ZWmegKoaguKVaErczS+BJ4n6gbCDA3hw1GvVEP6ooJpQSnDkeYRGciMh3ppE8hmnnzW7j7VRaROZYlN1hW/f1dY3RH6u4NaStRRtyHDoMrrszB0MUQmqki+jhK5J1RHUWLKBRk7JgNLuFLhcqA6ggznoUlFYh4ilC/mqgt+Clu3z/9OZOkkV7CqqQA55xyXfG6KwHGayuYH65i/ZVnC0DZxwp0J4h8xdtLRrNwSkLkqmLO/tDpvgdfdQfHXilwHh+1YYHuGA0TgqFwtSIodMX5Fx7O1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+jU8+ToR2i5jp0usVgH7Lokh2KuQEXfN0JTZgDdlRU=;
 b=Mi9mdacy619XrEcALM5RS4GKSWgsuh3MzSvOLWj3FlWBeWGUhVcRlZGwsoP1ZSu63aSI23qyz5VxXa2mcMwL3dtgt7hfW3wPqXyZOWUZdMVKwNVZWaPot6mJ79c6+AXiXWqeg1IEIB9QeDm5o24I5NFElEfnkDdgQpbLvQOCLh4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: fix booting ACPI based system after static
 evtchn series
Thread-Topic: [PATCH 2/2] xen/arm: fix booting ACPI based system after static
 evtchn series
Thread-Index: AQHYzzwtnQ0btLDO4Eq57Exdd2Iqca3s7GqAgAA7ZIA=
Date: Fri, 23 Sep 2022 15:42:52 +0000
Message-ID: <510F20E8-B6B9-447B-A40A-9947D9A49D95@arm.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
 <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
 <000f22e5-1628-a937-0871-44ed498e1b26@amd.com>
In-Reply-To: <000f22e5-1628-a937-0871-44ed498e1b26@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|DB3PR08MB9111:EE_|VE1EUR03FT006:EE_|AS8PR08MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 61eaca7a-98c3-40c4-03a3-08da9d7a4ecd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Yo5b5xv7DkAECFevi+05iXzekcMslHL3mcBcSdPvR4eUX5eQOyHBS48CcG4ynNmDI1V3DOsQGvk18qtFHhIHiZfC0sNAd4VTJVmkLBaaiy48ARQ9RPqyUPZbzihK/5aVlSFcUCWtavlGshpI25sUj+XHvOBBPym2aIZnyhny7UeJ4MHuiSkrhxFFodJdGxC5Yn6YanvCOv/tifDphFZ+FmGkv3UPNJp/XnGLeqaqG0xkPT+E9rAVoLVfpBi7Nk7VTWsc/rjkYQHKSIhxr5lJqma6v1INFOdZw4pVStBxcVU+hz7aZVEqmcrSmilKcWeubuFh5Imojz1N3C00KP6ZAong8jVru21q+PcKo387jMyI5A8PUrz+RolTeZblJCPtEZf+bx00JF2Mfz/W5GJ3RtF6BA2dwF13zhlKj1iuQGZWPI/F539BuJS/r8sNsrmCQ0cqD/rdJSEC2iAC7G4291wK9eCfvnHVos5gAkMH8ifwHF5e6n7pszksuCDbTBZiRSXKgHnIXMffAVF+HPm6yBz+5jpT+6zm5zu+cMxB+WuQWyZOIt3Q3h3DSv5nxjds+LENjNrJvR7te2NiOXjh7AEw1kEFozO7x4EPQSF7oZzkOKJuyPcu5+Sc9PyUl4mxVUxNLnqpQyhvSEcvpIhl2vPfx83u1aj9mfu613hOVgYhcNzLyih/N6RhXoFy6rJRWXg7RIeGMdHPgyOa5C25VrYZOBSK29Q8hjRUEa5b29j51YJY8yrcE7CeEYyxz94DVQXCWNMRP2ciZiHqevGW97fKyGBNavbuEZaYuofyvGo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199015)(478600001)(6486002)(71200400001)(36756003)(41300700001)(5660300002)(316002)(66946007)(76116006)(4326008)(8936002)(66556008)(91956017)(33656002)(54906003)(8676002)(66446008)(64756008)(66476007)(53546011)(38100700002)(26005)(122000001)(6916009)(186003)(38070700005)(6512007)(6506007)(83380400001)(2616005)(86362001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <927829C62FED14468D35CEB63D4832D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9111
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a10a4a39-11fd-48c9-5d1f-08da9d7a4695
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/0/edZ2TdP5p5AEYPtlNuD8Rl0tUb6fQyhbdz/ne9dMrkwi+6fbisSO3EkrmVKzov7KZqgYgjA4EAEw5phNtiuqI+wz49O+fEea9JSItY8Ow9wjonnGCnUTI7KS4MlBjJe5NJVpzF+ZCtrKwLAY678GSHfqJuRAUHH2gqLNrDH3tqfAIyGhwvZTGU4OIqYX7f/D3MpQreiTaF8XCebq21f5PnN4X3ZHVMDYMwyClXC+uRocqXGqw4fsbLYhSjone+09E/uPF9eo75WE0x67gI8K/9DrZxOOT74Fu8Dv0E41uHLm/dTeTLjoQqoyeG68UyEFDaPpnZP8pxIXiuyYTCsAvz5faYDO//HdQ9J0+Q0wkF0lk5zYv8e9aLv5jY8F49MRcMBxOUcxx+r3/zQZMn8gYLazfxGZ3w0pND8udW+cBnmdJnDUyjFX8pux+O4w7mYHR9tyNeJpkhuUag9xksKzvoLQfAYFISkRsv4NibFa4u5P5SqZOV+GC8OG6eIwZsfCSZYe0Cl7qLkz3hKF8gNENFRl3SrO/d5GXogCJavmDq8hChrW2NripKJLVKM+ci9K4VyfhfOuT+zKYP7HV5PkScHLhJt2ELoyUhLy3Mbk199cocUUkIxi4w2oSsgVRsK+h/QEFzYpG325QvG8akz48Fr8sqsRBUiNM8NMvK6NTPgYrhkwoKETsU2DeC0j+tWY2A07YZ5wXl13uQWp5T37/WofNt/EqklEgbg6JEHMa6v91j4gcVB0laXYW8NMm4j8F8011eYxnuprkv6IPA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(26005)(6862004)(5660300002)(6486002)(41300700001)(8936002)(82740400003)(356005)(6506007)(33656002)(81166007)(40460700003)(82310400005)(53546011)(86362001)(40480700001)(54906003)(316002)(70206006)(186003)(6512007)(8676002)(70586007)(36860700001)(107886003)(478600001)(2906002)(4326008)(2616005)(83380400001)(36756003)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:43:05.8882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61eaca7a-98c3-40c4-03a3-08da9d7a4ecd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7337

Hi Ayan,
=20
> On 23 Sep 2022, at 1:10 pm, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Rahul,
>=20
> On 23/09/2022 12:02, Rahul Singh wrote:
>> CAUTION: This message has originated from an External Source. Please use=
 proper judgment and caution when opening attachments, clicking links, or r=
esponding to this email.
>>=20
>>=20
>> When ACPI is enabled and the system booted with ACPI, BUG() is observed
>> after merging the static event channel series. As there is not DT when
> [NIT] : s/not/no

Ack.=20
>> booted with ACPI there will be no chosen node because of that
>> "BUG_ON(chosen =3D=3D NULL)" will be hit.
>>=20
>> (XEN) Xen BUG at arch/arm/domain_build.c:3578
> Is the bug seen on the gitlab ci ?

No, I found the issue while testing the ACPI boot. But going forward we wil=
l add this in our internal ci.
>>=20
>> Move call to alloc_static_evtchn() under acpi_disabled check to fix the
>> issue.
>>=20
>> Fixes: 1fe16b3ed78a (xen/arm: introduce xen-evtchn dom0less property)
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  xen/arch/arm/setup.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 61b4f258a0..4395640019 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -1166,9 +1166,10 @@ void __init start_xen(unsigned long boot_phys_off=
set,
>>          printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>=20
>>      if ( acpi_disabled )
>> +    {
>>          create_domUs();
>> -
>> -    alloc_static_evtchn();
>> +        alloc_static_evtchn();
>=20
> Can the code in alloc_static_evtchn() be guarded with "#ifndef CONFIG_ACP=
I ... endif" ?

Not required as acpi_disabled will take care of that. acpi_disabled variabl=
e is used to avoid the CONFIG_ACPI.

Regards,
Rahul


