Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CC5A0AD4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393096.631832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7iV-000529-Q6; Thu, 25 Aug 2022 07:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393096.631832; Thu, 25 Aug 2022 07:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7iV-000508-NL; Thu, 25 Aug 2022 07:55:55 +0000
Received: by outflank-mailman (input) for mailman id 393096;
 Thu, 25 Aug 2022 07:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9hs=Y5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oR7iU-000502-NF
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:55:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5813a121-244b-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 09:55:54 +0200 (CEST)
Received: from AM5PR0701CA0056.eurprd07.prod.outlook.com (2603:10a6:203:2::18)
 by AM6PR08MB4102.eurprd08.prod.outlook.com (2603:10a6:20b:ab::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 07:55:45 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::9c) by AM5PR0701CA0056.outlook.office365.com
 (2603:10a6:203:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.3 via Frontend
 Transport; Thu, 25 Aug 2022 07:55:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 07:55:44 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 25 Aug 2022 07:55:44 +0000
Received: from b73197688268.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 64E661B5-FDD0-4CF7-985E-0CC53B0B64DD.1; 
 Thu, 25 Aug 2022 07:55:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b73197688268.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Aug 2022 07:55:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8724.eurprd08.prod.outlook.com (2603:10a6:10:3d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 07:55:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Thu, 25 Aug 2022
 07:55:31 +0000
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
X-Inumbo-ID: 5813a121-244b-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BL4G0o4cVf0zr5pUNRQ+g9OHieOKJoTBnHzDLnc0M4u32y9y8M/8jx4E0uu5uHezjcCLX5RPf0Siw5C8MSpLYECn0U5DGcWBxQU9nBZ4X4FRAS0Qm0iNrRPju58sNc8xJKTHYCJ3lKl5yta6+JTrUhdINE/XPsg16N9OX3PXn98iXj0nQWx7EArdlfHoEZIAefheBz/UgLh/NqEvw9i4/7OZrokSLROwBT3Ex2o5skthoBaz5fBZupfoGM+BGl8U76x6KIAFy2h4YQjlEa0/OPfoWmngO7Boq4IbCmCO+ptknJSxmp1ShJKz86Qk1mhgqbxVu3Md3CeQBbMM+qQZ/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdWdyRBvfmdHOjNP/F1jUYFUCOtG1q74gWW9vvBO+kk=;
 b=ZSyjZnw8PVjHf3WmNH/cMNqJhjv1ux9VJ8MUo1XFd/+HJHDyLmlpXF4gZhtjWbgU9EZ/ezAPl71WTCKPzbQPjJdpygJqRriwA/qLBuDYASnnCKRO59JUb+HI5gmiWUXTrnxif1RkdU5s/hXSTcIFqJunE+s3S38Qa+kuQ0XmQOjjlIzr7j4AmspKR//kyeYj4k0ABfyKtFuyUIUEUtFynGhdkMtQz0yRHuvz8cAA/iD6yOsZI0NmoiGJ/EHiQUurPVZ29v/NJR7oww8ozyduO0LXUPPVqWr5UDbO+aNM1kC4QAXr0bQOo8QW3R7nvj6MOgS7JBFxKSoF19liOkq3ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdWdyRBvfmdHOjNP/F1jUYFUCOtG1q74gWW9vvBO+kk=;
 b=V8aqCrdTXcjhbMssJGSKO41rcMMxgvSONDDdj5GKrSJJk/1cr34hUsXQs8AoikB6ub55IxcQp+xtyOnRzaR01sSuYABqC3rziwuaj7mWNd5jObqCfq9h/+l7FqlwIzwOJjhCOqXZv7dV42aWWrqte5oZEZCQpT9PzXGjAkAlJBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ae6b5a9d581259f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEFWbMybWeHxg2rC9CtHGia8raCEnhnBWNImTiRNNbBmV4jfYbu0BpB0sJpvU4AanV0niup+B2OQMOfE/t5ZNGyURYCPS3aY6qEKmlS+KVp82AfoKy4xrSx0DhEkOtm+NCk9Q4G8TNi8PjGhLSbLcHhSU95tKgfxBj4rKwTOGeJLZOOfcn4d5F5morg9HikvXJm+rqlBjOCKcVHZT9+ocpQx9aocwmhZ8QuaphV+O+we1t69Gsh/BQnvMkBJXlhejVb9fjWAejdQOOHVrQjM87Ol7MXYf9C/BPlsMgzWuHQmnOQBoK6BoCtBClLRiwuQxRVIdj5Nru/0mX229kCfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdWdyRBvfmdHOjNP/F1jUYFUCOtG1q74gWW9vvBO+kk=;
 b=g4glGQiTHdaJ6gG7HROZ9E1/0KdKa3NygFpBozgZ/cIMy2OewswtZrMCMZld+wn0CKOsOwUDwUuNutTZjLTbYeSMfMvL6FRrCGiHd/wR98UTuO+GgDtXssgpfRbiE5NnygYfkNEeXFhgPGpwnTofw2UcHV/rlCKc6hA5+CUqgGUgMVH3WI1KhZcSv1aAsMk+lugyALunUWfhx4PfH/08rxLGEDGI4XaPT8ATA9q3r4gOJzN8s/pvAmX6VwXuOfU6ic5Oh/ekpQNmqc0K9meepTweOq72PBFf9ZCvf3ZZuWSXqW6eC1cffO/oC3yOLZD6iCHNgqArCGKyYYBlCh1LhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdWdyRBvfmdHOjNP/F1jUYFUCOtG1q74gWW9vvBO+kk=;
 b=V8aqCrdTXcjhbMssJGSKO41rcMMxgvSONDDdj5GKrSJJk/1cr34hUsXQs8AoikB6ub55IxcQp+xtyOnRzaR01sSuYABqC3rziwuaj7mWNd5jObqCfq9h/+l7FqlwIzwOJjhCOqXZv7dV42aWWrqte5oZEZCQpT9PzXGjAkAlJBY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Vipul Suneja <vsuneja63@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: Porting xen on rpi4
Thread-Topic: Porting xen on rpi4
Thread-Index: AQHYt8SgkyOonJ7Wl0ezDHN7orB+v62+Hg2AgAAnmwCAAEWWAIAAroCAgAAG0YA=
Date: Thu, 25 Aug 2022 07:55:31 +0000
Message-ID: <62627CF0-8594-4DEB-9F6C-37AECDE6B77B@arm.com>
References:
 <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
 <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com>
 <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2208241401110.15247@ubuntu-linux-20-04-desktop>
 <CALAP8f-3jcGen82DaVrxRTF3TMDVMkLJA5Nsxu=HDYFDqTOOdQ@mail.gmail.com>
In-Reply-To:
 <CALAP8f-3jcGen82DaVrxRTF3TMDVMkLJA5Nsxu=HDYFDqTOOdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8c04ffee-240e-408f-9adb-08da866f3702
x-ms-traffictypediagnostic:
	DB9PR08MB8724:EE_|VE1EUR03FT003:EE_|AM6PR08MB4102:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O8IwciKWcRO/31uekI+aXm8mbD918wEN050YJeTX2Lw2ZQ8Eb3+EiIPSgFYGAqLuqjZX1sJ9n8H6hrIFaXLBtVGSmkgdnH1jNAv1l+dY+HIMhxz8kCB99EtxuXiEgL4IJZ/2bpc1LMex7rtZDTmC6l2LoUQ5jflXpm+jei63S9evnvWrUOv1hw/EfNVGz7VmhjEjSxVu5ILWtLzeF9m5NRHUjDJtG2L13/B8o4eWeXLrnjhXqSImuhnzg0dKJ9NoEpA57WYmYrJqqKwHv9NpKScpgRfNkQvRmF5YjyBsEbTx89xNDWLCnG3UG7Zxhgb/tC2yL2BHBbXaSexP5qlfaD5QJLm4GHqGgF/+a69QCOQr3mnreS4KGu2b8DgXoycSJOJAB2Cc7Sku1BRG6Yow6BrE+Os/3II7kwqrcngwp6E570bbU+yLOvjyKywnU9XeZEHy3Cey93Jm/vrX5jmWkjGqti/OP6AR1UZLWspNx76rdf9Vw6MJ3jm+clAfWYZoOCPuv7JlwFou4QG3vF6+Q6MH0ShO4S0RXRsvNNQjlZzd5ep2u9l1+z/18mxJ057ufcyh2paFCIwInsd3gF0iSk3wzQh+C+SrCxBSl1SlSZdNAoBuukNodKfPhXIX5ZHUjG/miba8KRrBX6YWEbaBoNS1QhK7YDY2CRxLCfyFPcMxlMrLGvg8s+CibzGgkl3T+2ahFAKWY7YzSeJNgaRjR6gK3z8Ilph1FcVyNpvfVzxNnDO/x59PWTP9AI2/RsY7EG+n4CgNu6LKtXaMk9Zff2D3HKPQ6jZ1uweaSMSLjw8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(36756003)(2616005)(316002)(41300700001)(38070700005)(8936002)(83380400001)(6916009)(54906003)(38100700002)(186003)(71200400001)(122000001)(4326008)(64756008)(66476007)(8676002)(76116006)(91956017)(66946007)(33656002)(478600001)(6506007)(2906002)(66446008)(86362001)(6486002)(5660300002)(66556008)(26005)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <29052BCF26C30E47AEC0535077785C79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8724
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b305cc7b-0614-4d5f-6907-08da866f2f47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZK6hA/dM8jS2EzChqSduTsk4uJbCc/PJe+5QUYRSdPCyveNVGfb1C0aHqnANW2eBsJyptKnbacBXkkx4lcw9QN95WFQ6/Z884VEy7hJvgSPwCPSUekeP3Y9paKh72bKtd/pt+A2BdJXySrgSa2VIugFagdhy8ARbKDNzr/mqOaz2CL7em7VFRanTKhmIOhAWXTD9x0ZQmT4/fmdUAxEz/Xln2o3nr15TIGPqw35gudOjCwQu84G0Rk4thQvKw+CgtqzDKixlibErMeqsJQd4Ffjmt+HLA5tqQOoRVkVw7SCcF53ClHC4QJppCjlMHjmyREHgJmkuaKT8F5AMFm/kwpzxZcwXWrBD5CqxwzLCiRdv6xx3l1ZSw9AROoMjZ6CjtKwlhl9Dz1TnLJOlj959TADfTunt7pifMf6yqtHmpoZvxZbyLIbuemL74oYe2jeCHlCO9I3Y6rz10bLEUHU2y0xlukzx8hN+2bw1+uW7K8gajrQC0q/XXpJnzxyRoIjEF4JGq5O/fo+DqVQR/hC7N7yxIHx3a7mDP+05DGnkXdaCwlpjLjpvzeBSkeWm3Rz26sXTgYEfCiZZeTDbbIynKsjmmP01L7n5KgpbILR/19AOVrOgxfZEbM2Lma3pYyY2jOFhv65M/PEDVBU73+zvQwF66c+UwAq6O5Dxnn4pCYfY2CsYPf/sYcCZ0Dm8+C+Krg8w+lKxVOk1JeDxcp4K+lhwxNzgKN7kKbHJuFgSsxVR8lOiXBiu6qAvyLgXNrqgAeZei34Rahw9ptGSwioxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(36840700001)(40470700004)(8936002)(81166007)(36860700001)(86362001)(82740400003)(33656002)(40480700001)(40460700003)(2616005)(5660300002)(478600001)(47076005)(186003)(53546011)(336012)(6506007)(41300700001)(6512007)(26005)(6486002)(6862004)(36756003)(83380400001)(8676002)(82310400005)(4326008)(2906002)(70206006)(356005)(316002)(54906003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 07:55:44.7037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c04ffee-240e-408f-9adb-08da866f3702
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4102

SGkgVmlwdWwsDQoNCj4gT24gMjUgQXVnIDIwMjIsIGF0IDA4OjMxLCBWaXB1bCBTdW5lamEgPHZz
dW5lamE2M0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSGkgU3RlZmFubywNCj4gDQo+IFRoYW5r
cyENCj4gDQo+IEFzIHN1Z2dlc3RlZCwgSSBjaGFuZ2VkIHRoZSBndWVzdDEuY2ZnIGZpbGUuIEJl
bG93IGFyZSB0aGUgY29udGVudHMgb2YgY29uZmlnIGZpbGUNCj4gDQo+IGtlcm5lbCA9ICIvaG9t
ZS9yb290L0ltYWdlIg0KPiBjbWRsaW5lID0gImNvbnNvbGU9aHZjMCBlYXJseXByaW50az14ZW4g
c3luY19jb25zb2xlIHJvb3Q9L2Rldi94dmRhIg0KPiBtZW1vcnkgPSAiMTAyNCINCj4gbmFtZSA9
ICJndWVzdDEiDQo+IHZjcHVzID0gMQ0KPiBzZXJpYWw9InB0eSINCj4gZGlzayA9IFsgJ2ZpbGU6
L2hvbWUvcm9vdC94ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0Myx4
dmRhLHcnIF0NCj4gdmlmPVsgJ21hYz0wMDoxMToyMjo2Njo4ODoyMixicmlkZ2U9eGVuYnIwLHR5
cGU9bmV0ZnJvbnQnLCBdDQo+IA0KPiBJdHMgZmFpbGluZyB3aXRoIGJlbG93IGxvZ3M6DQo+IA0K
PiByb290QHJhc3BiZXJyeXBpNC02NDp+IyB4bCBjcmVhdGUgLWMgZ3Vlc3QxLmNmZyANCj4gUGFy
c2luZyBjb25maWcgZnJvbSBndWVzdDEuY2ZnDQo+IEludmFsaWQgcGFyYW1ldGVyIGB0eXBlJy4N
Cj4gbGlieGw6IGVycm9yOiBsaWJ4bF9leGVjLmM6MTE3OmxpYnhsX3JlcG9ydF9jaGlsZF9leGl0
c3RhdHVzOiAvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrIGFkZCBbNzQyXSBleGl0ZWQgd2l0aCBlcnJv
ciBzdGF0dXMgMQ0KPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2RldmljZS5jOjEyNjU6ZGV2aWNlX2hv
dHBsdWdfY2hpbGRfZGVhdGhfY2I6IHNjcmlwdDogbG9zZXR1cCAvZGV2L2xvb3AwIC9ob21lL3Jv
b3QveGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4dDMgZmFpbGVkDQo+
IGxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRlLmM6MTY0Mzpkb21jcmVhdGVfbGF1bmNoX2RtOiBE
b21haW4gMTp1bmFibGUgdG8gYWRkIGRpc2sgZGV2aWNlcw0KPiBsaWJ4bDogZXJyb3I6IGxpYnhs
X2V4ZWMuYzoxMTc6bGlieGxfcmVwb3J0X2NoaWxkX2V4aXRzdGF0dXM6IC9ldGMveGVuL3Njcmlw
dHMvYmxvY2sgcmVtb3ZlIFs3OTNdIGV4aXRlZCB3aXRoIGVycm9yIHN0YXR1cyAxDQo+IGxpYnhs
OiBlcnJvcjogbGlieGxfZGV2aWNlLmM6MTI2NTpkZXZpY2VfaG90cGx1Z19jaGlsZF9kZWF0aF9j
Yjogc2NyaXB0OiAvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrIGZhaWxlZDsgZXJyb3IgZGV0ZWN0ZWQu
DQo+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTE4MzpsaWJ4bF9fZGVzdHJveV9kb21p
ZDogRG9tYWluIDE6Tm9uLWV4aXN0YW50IGRvbWFpbg0KPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2Rv
bWFpbi5jOjExMzc6ZG9tYWluX2Rlc3Ryb3lfY2FsbGJhY2s6IERvbWFpbiAxOlVuYWJsZSB0byBk
ZXN0cm95IGd1ZXN0DQo+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTA2NDpkb21haW5f
ZGVzdHJveV9jYjogRG9tYWluIDE6RGVzdHJ1Y3Rpb24gb2YgZG9tYWluIGZhaWxlZA0KDQpJIHRo
aW5rIHlvdSBoYXZlIGEgbG9vcCBpc3N1ZS4NCg0KQ291bGQgeW91IGNoZWNrIGlmIC9kZXYvbG9v
cDAgZXhpc3RzID8NCg0KRGlkIHlvdSBjaGFuZ2Ugc29tZXRoaW5nIG9uIHRoZSBkb20wIGxpbnV4
IGNvbmZpZ3VyYXRpb24gZ2VuZXJhdGVkIGJ5IFlvY3RvID8NCg0KV2UgYXJlIHVzaW5nIFlvY3Rv
IG9uIFJQSTQgaGVyZSB3aXRob3V0IGFueSBpc3N1ZSBsaWtlIHRoYXQsIG9ubHkgZGlmZmVyZW5j
ZSB3aXRoDQp5b3VyIHNldHVwIGlzIHRoYXQgd2UgZ2VuZXJhdGUgYSB3aWMgaW1hZ2UgdG8gaGF2
ZSBhIHJlYWwgZGlzayBpbWFnZSBpbnN0ZWFkIG9mDQp1c2luZyB0aGUgZXh0My9leHQ0IG9uZS4N
Cg0KU2hvdWxkIGJlIHBvc3NpYmxlIHRvIGRvIHRoZSBzYW1lIG9uIHlvdXIgc2lkZSBieSBhZGRp
bmcgdGhlIGZvbGxvd2luZyBpbiBsb2NhbC5jb25mOg0KSU1BR0VfRlNUWVBFUzphcHBlbmQgPSAi
IHdpYy5neuKAnQ0KDQo+IA0KPiBFdmVuIGFmdGVyIHJlbW92aW5nICd0eXBlPW5ldGZyb250JyBm
cm9tIHZpZiBpdCdzIGZhaWxpbmcuIA0KDQpUaGlzIG9wdGlvbiBpcyBvbmx5IGZvciBodm0gb24g
eDg2LCBzbyB5b3UgY2FuIHJlbW92ZSBpdCBmcm9tIHlvdXIgY29uZmlndXJhdGlvbi4NCg0KPiBP
bmUgbW9yZSBkb3VidCBoZXJlLCBjb3VsZCB0aGlzIG1hYyBhZGRyZXNzIGJlIGEgZHVtbXkgb3Ig
YWN0dWFsIGhlcmU/DQoNClRoaXMgaXMgYSBkdW1teSBvbmUgeW91IHNldCBmb3IgdGhlIGd1ZXN0
IG5ldHdvcmsgaW50ZXJmYWNlIGFuZCB0aGlzIGlzIHRoZSBNYWMNCiBhZGRyZXNzIG90aGVyIGRl
dmljZXMgb24geW91ciBuZXR3b3JrIHdpbGwgc2VlIHNvIGl0IG11c3QgYmUgZnVsbHkgdmFsaWQg
KGFuZA0KIG5vdCBjb25mbGljdGluZyB3aXRoIG90aGVyIGRldmljZXMgb24geW91ciBuZXR3b3Jr
KS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBWaXB1bCBLdW1hcg0K
PiANCj4gT24gVGh1LCBBdWcgMjUsIDIwMjIgYXQgMjozNiBBTSBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiBPbiBXZWQsIDI0IEF1ZyAyMDIyLCBW
aXB1bCBTdW5lamEgd3JvdGU6DQo+ID4gSGkgQmVydHJhbmQsDQo+ID4gVGhhbmtzIGZvciB5b3Vy
IHJlc3BvbnNlIQ0KPiA+IA0KPiA+IEkgYnVpbGRlZCB0aGUgZ3Vlc3QgaW1hZ2Ugb24geW9jdG8g
a2lya3N0b25lIHNvdXJjZSB3aGljaCBoYXMgRlNUWVBFIGV4dDMuIEd1ZXN0IGltYWdlIGdlbmVy
YXRlZCBpcw0KPiA+IHhlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQz
Lg0KPiA+IEJlbG93IGlzIHRoZSBjb250ZW50IG9mIGd1ZXN0LmNmZyBmaWxlDQo+ID4gDQo+ID4g
ICAga2VybmVsID0gIi9ob21lL3Jvb3QvSW1hZ2UiIA0KPiA+ICAgIGNtZGxpbmUgPSAiY29uc29s
ZT1odmMwIGVhcmx5cHJpbnRrPXhlbiBzeW5jX2NvbnNvbGUgcm9vdD0vZGV2L3h2ZGEiIA0KPiA+
ICAgIG1lbW9yeSA9ICIyNTYiIA0KPiA+ICAgIG5hbWUgPSAiZ3Vlc3QxIiANCj4gPiAgICB2Y3B1
cyA9IDEgDQo+ID4gICAgc2VyaWFsPSJwdHkiIA0KPiA+ICAgIGRpc2sgPSBbICdwaHk6L2Rldi9s
b29wMCx4dmRhLHcnIF0gDQo+ID4gICAgdmlmPVsgJ21hYz0wMDoxMToyMjo2Njo4ODoyMixicmlk
Z2U9eGVuYnIwLHR5cGU9bmV0ZnJvbnQnLCBdDQo+ID4gDQo+ID4gSSBhbSB0cnlpbmcgdG8gbW91
bnQgeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4dDMgdG8gYSB2aXJ0
dWFsIGRldmljZSAmIHRoZW4gd2lsbCBydW4gdGhlIGd1ZXN0IFZNIGJ5IGNvbW1hbmQgInhsIGNy
ZWF0ZSAtYw0KPiA+IGd1ZXN0LmNmZyIuIEJ1dCBmYWNpbmcgaXNzdWUgd2hpbGUgdHJ5aW5nIHRv
IG1vdW50LiANCj4gDQo+IFlvdSBkb24ndCBhY3R1YWxseSBuZWVkIHRvIG1vdW50DQo+IHhlbi1n
dWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQzIGFueXdoZXJlIHRvIHVzZSBp
dCB0byBydW4NCj4geW91ciBndWVzdCBWTSB3aXRoICJ4bCBjcmVhdGUiLiANCj4gDQo+IEl0IGlz
IGVub3VnaCB0byBkbyB0aGlzIGluc3RlYWQsIGFzIEJlcnRyYW5kIHN1Z2dlc3RlZDoNCj4gDQo+
IGRpc2s9WyJmaWxlOi9wYXRoL3RvL2ZpbGUveGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJl
cnJ5cGk0LTY0LmV4dDMseHZkYSx3Il0NCj4gDQo+IE5vIG5lZWQgdG8gY2FsbCBsb3NldHVwIG9y
IG1vdW50LiBKdXN0IHhsIGNyZWF0ZSAtYy4NCj4gDQo+IE1vcmUgYW5zd2VycyBiZWxvdy4NCj4g
DQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gVmlwdWwgS3VtYXINCj4gPiANCj4gPiBPbiBXZWQsIEF1
ZyAyNCwgMjAyMiBhdCA4OjA2IFBNIEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNA
YXJtLmNvbT4gd3JvdGU6DQo+ID4gICAgICAgSGkgVmlwdWwsDQo+ID4gDQo+ID4gICAgICAgPiBP
biAyNCBBdWcgMjAyMiwgYXQgMTU6MTYsIFZpcHVsIFN1bmVqYSA8dnN1bmVqYTYzQGdtYWlsLmNv
bT4gd3JvdGU6DQo+ID4gICAgICAgPg0KPiA+ICAgICAgID4gSGksDQo+ID4gICAgICAgPg0KPiA+
ICAgICAgID4gSSBhbSBwb3J0aW5nIHhlbiBoeXBlcnZpc29yIG9uIHJwaTQgd2l0aCB5b2N0byBr
aXJrc3RvbmUgc291cmNlcy4gRm9sbG93ZWQgdGhlIGJhc2ljIHN0ZXBzIHRvIGJ1aWxkIHhlbi1p
bWFnZS1taW5pbWFsICYNCj4gPiAgICAgICB4ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC4gSSBjb3Vs
ZCBmbGFzaCBzZCBjYXJkIHdpdGggeGVuIG1pbmltYWwgaW1hZ2UgJiBjb3VsZCBzZWUgZG9tMCB1
cC4gSSBjb3BpZWQgIkltYWdlIiwNCj4gPiAgICAgICAieGVuLWd1ZXN0LWltYWdlLW1pbmltYWwi
IC5leHQzIGZpbGUgJiBndWVzdC5jZmcgdG8gIi9ob21lL3Jvb3QiLiBBZnRlciB0aGF0IGNyZWF0
ZWQgYSBicmlkZ2Ugd2l0aCBiZWxvdyBzdGVwOg0KPiA+ICAgICAgID4NCj4gPiAgICAgICA+IGtp
bGxhbGwgLVNJR1VTUjIgdWRoY3BjDQo+ID4gICAgICAgPiBicmN0bCBhZGRiciB4ZW5icjANCj4g
PiAgICAgICA+IGJyY3RsIGFkZGlmIHhlbmJyMCBldGgwDQo+ID4gICAgICAgPiBraWxsYWxsIHVk
aGNwYw0KPiA+ICAgICAgID4gdWRoY3BjIC1SIC1iIC1wIC92YXIvcnVuL3VkaGNwYy54ZW5icjAu
cGlkIC1pIHhlbmJyMA0KPiA+ICAgICAgID4NCj4gPiAgICAgICA+IENvdWxkIHNlZSB0aGUgeGVu
YnIwIGludGVyZmFjZSB1cC4NCj4gPiAgICAgICA+IEFmdGVyIHRoYXQgd2hpbGUgbW91bnRpbmcg
dGhlIGd1ZXN0IGZpbGUgc3lzdGVtIGl0IHNob3dzIG5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnkg
YnV0IHRoZSBmaWxlIGlzIGFscmVhZHkgdGhlcmUuDQo+ID4gICAgICAgPg0KPiA+ICAgICAgID4g
WzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBpNC02NDp+IyBscyAtbA0KPiA+
ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiAtcnctci0tci0tICAgIDEgcm9vdCAgICAg
cm9vdCAgICAgIDI0NjUyMjg4IE1hciAgOSAxMjozNiBJbWFnZQ0KPiA+ICAgICAgID4gWzIzOjQw
OjE1XSA8R3Vlc3Q5MDQ2PiAtcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICAg
MjQ3IE1hciAgOSAxMjozNyBndWVzdDEuY2ZnDQo+ID4gICAgICAgPiBbMjM6NDA6MTVdIDxHdWVz
dDkwNDY+IC1ydy1yLS1yLS0gICAgMSByb290ICAgICByb290ICAgICA4NjgyMjA5MjggTWFyICA5
IDEyOjM5IHhlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQzDQo+ID4g
ICAgICAgPiBbMjM6NDA6MTVdIDxHdWVzdDkwNDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jIGNo
bW9kIDA3NzcgeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4dDMNCj4g
PiAgICAgICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gcm9vdEByYXNwYmVycnlwaTQtNjQ6fiMg
bHMgLWwNCj4gPiAgICAgICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gLXJ3LXItLXItLSAgICAx
IHJvb3QgICAgIHJvb3QgICAgICAyNDY1MjI4OCBNYXIgIDkgMTI6MzYgSW1hZ2UNCj4gPiAgICAg
ICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3Qg
ICAgICAgICAgIDI0NyBNYXIgIDkgMTI6MzcgZ3Vlc3QxLmNmZw0KPiA+ICAgICAgID4gWzIzOjQw
OjE1XSA8R3Vlc3Q5MDQ2PiAtcnd4cnd4cnd4ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgODY4MjIw
OTI4IE1hciAgOSAxMjozOSB4ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQu
ZXh0Mw0KPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBp
NC02NDp+IyBsb3NldHVwIC9kZXYvbG9vcDAgeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJl
cnJ5cGk0LTY0LmV4dDMNCj4gPiAgICAgICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gbG9zZXR1
cDogeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4dDM6IE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkNCj4gPiAgICAgICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gcm9v
dEByYXNwYmVycnlwaTQtNjQ6fiMgbG9zZXR1cCAvZGV2L2xvb3AwIC9ob21lL3Jvb3QveGVuLWd1
ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4dDMNCj4gPiAgICAgICA+IFsyMzo0
MDoxNV0gPEd1ZXN0OTA0Nj4gbG9zZXR1cDogL2hvbWUvcm9vdC94ZW4tZ3Vlc3QtaW1hZ2UtbWlu
aW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+
ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBpNC02NDp+Iw0K
PiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBpNC02NDp+
Iw0KPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBpNC02
NDp+Iw0KPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBp
NC02NDp+IyBsb3NldHVwIC9kZXYvbG9vcDAgL2hvbWUvcm9vdC94ZW4tZ3Vlc3QtaW1hZ2UtbWlu
aW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0Mw0KPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5
MDQ2PiBsb3NldHVwOiAvaG9tZS9yb290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJy
eXBpNC02NC5leHQzOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IA0KPiBJdCBsb29rcyBs
aWtlIGVpdGhlcg0KPiAvaG9tZS9yb290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJy
eXBpNC02NC5leHQzIGRvZXNuJ3QgZXhpc3Qgb3INCj4gL2Rldi9sb29wMCBkb2Vzbid0IGV4aXN0
DQo+IA0KPiANCj4gPiAgICAgICBXaHkgZG8geW91IHdhbnQgdG8gbW91bnQgdGhlIGZpbGUgc3lz
dGVtID8NCj4gPiANCj4gPiAgICAgICBBbnl3YXkgdGhpcyBpcyBub3QgcmVsYXRlZCB0byBYZW4s
IEkgZ3Vlc3MgeW91IGNvdWxkIHN0YXJ0IHdpdGhvdXQgeGVuIGFuZCBzdGlsbCBub3QgbWFuYWdl
IHRvIG1vdW50IHRoZSBmaWxlIGxpa2UgdGhhdCAobGludXgNCj4gPiAgICAgICBjb25maWd1cmF0
aW9uIGlzc3VlID8pDQo+ID4gDQo+ID4gICAgICAgV2hhdCBpcyB0aGUgY29udGVudCBvZiB5b3Ug
Z3Vlc3QuY2ZnDQo+ID4gICAgICAgSG93IGRvIHlvdSB3YW50IHRvIHBhc3MgdGhlIGd1ZXN0IHJv
b3QgZmlsZSBzeXN0ZW0gPw0KPiA+IA0KPiA+ICAgICAgIFlvY3RvIHNob3VsZCBhY3R1YWxseSBn
ZW5lcmF0ZSBhbiBpbWcgZmlsZSBhbmQgeW91IGNvdWxkIHVzZSBpdCBieSBoYXZpbmcgc29tZXRo
aW5nIGxpa2UgdGhpcyBpbiB5b3VyIGd1ZXN0LmNmZzoNCj4gPiAgICAgICBkaXNrPVsiZmlsZTov
aG9tZS9yb290L2d1ZXN0MS5pbWcseHZkYSx34oCdXQ0KPiA+IA0KPiA+ICAgICAgIENoZWVycw0K
PiA+ICAgICAgIEJlcnRyYW5kDQo+ID4gDQo+ID4gICAgICAgPg0KPiA+ICAgICAgID4gQW55IGlu
cHV0IG9uIHRoaXMgaXNzdWUgd2lsbCBiZSByZWFsbHkgaGVscGZ1bCwgZXhwZWN0aW5nIHlvdXIg
cmVzcG9uc2UuDQo+ID4gICAgICAgPg0KPiA+ICAgICAgID4gVGhhbmtzICYgUmVnYXJkcywNCj4g
PiAgICAgICA+IFZpcHVsIEt1bWFyDQo+ID4gDQo+ID4gDQo+ID4NCg0K

