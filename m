Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05EB5EBDA1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 10:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412324.655586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od69g-00056j-6U; Tue, 27 Sep 2022 08:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412324.655586; Tue, 27 Sep 2022 08:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od69g-00053z-3F; Tue, 27 Sep 2022 08:41:28 +0000
Received: by outflank-mailman (input) for mailman id 412324;
 Tue, 27 Sep 2022 08:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HycW=Z6=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1od69e-0004ev-Pr
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 08:41:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50066.outbound.protection.outlook.com [40.107.5.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b45cdaa-3e40-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 10:41:24 +0200 (CEST)
Received: from AS9PR06CA0219.eurprd06.prod.outlook.com (2603:10a6:20b:45e::10)
 by GV1PR08MB7345.eurprd08.prod.outlook.com (2603:10a6:150:20::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Tue, 27 Sep
 2022 08:41:21 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::7d) by AS9PR06CA0219.outlook.office365.com
 (2603:10a6:20b:45e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15 via Frontend
 Transport; Tue, 27 Sep 2022 08:41:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 08:41:20 +0000
Received: ("Tessian outbound 0a0431bdcdb4:v124");
 Tue, 27 Sep 2022 08:41:19 +0000
Received: from f9fefae8df3d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A2F8718-0989-4263-ACC6-9B4B2852ABFE.1; 
 Tue, 27 Sep 2022 08:41:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9fefae8df3d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 08:41:09 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VE1PR08MB5792.eurprd08.prod.outlook.com (2603:10a6:800:1a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 08:41:05 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3475:c78d:9d75:6137]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3475:c78d:9d75:6137%3]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 08:41:05 +0000
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
X-Inumbo-ID: 2b45cdaa-3e40-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bLRdE401+Pb4tjBGLp16vtz3vA7LhynKsVm/A9tztPOawLS/xy3jgdSn9OwFeEvE5fLqcGP6U8PyshpqcRwKu5sjZT4s+9z4dWNs3n4cMgkpHq/SMnIJhlISF7bbcTTpJ+jqGyOVtQCUyG25ATv1Ixa4dwQ9rk+RUnSDvC/Nz5ZhApH/40zM6HPhNHGyWlFYfnxn/sWrfM9jodjbPYNFix0VzJD3L3nxkBGl0XKdvDmnV1Hu9qFK7my3LmFnbWKDZd+q7UiHXEFZCzlrcaCvoW1qbEYGwiOeWZyw9VVMnbrpoTu/9xo+n3JZX9XuzUxbpedkqR4pVWFkQziHgBbDOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/75M5JAtxEaTU4YCeAgolPxjRP7dH5hp0xl3CdEzXu0=;
 b=TJrRZ/YCuttKpCQRl9zKxFBn5sPuaWm2x+0+e/RXXmRLIe6B1Fid4yUN68XN8oy63it8CrHLTRPB9Nkaf+0iKh2+kh7lRh5Q9cTTty+RDoEKhmNyr9Mq2UUCkdBRp4lyOxCq/LlY/OKMSPzQGH1sF5WHM1OJDlVgCAj72jpx2akqKTTgeCP7nNjh1e/+iyPR+c6otryDxPzav6nADdC7sjTr1rRgsN2UuOgKaU/BZhAeujTqMrJfb7/DmqcwoxFGL3JiOW7M9C/MfrLt7UKEx5AHmPLUBm+U8/F1T7S105c0BKPqouldt09PMD2d1P7XF5YVjrwBtvJydLMIVdIfeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/75M5JAtxEaTU4YCeAgolPxjRP7dH5hp0xl3CdEzXu0=;
 b=VZSJOZWvxr+YolINuHX0ndneWf9wYhi8KzqGMZzn3+28fDHAHb0Fy3P1taZ8YEjbdO1ZhN9uXdqV9oOkyzB6pCJm9opQ0aQesVqaXb96evetHm72UQ+KRb7wQN3kKm8AxVLmrC10MNIymsG6qvOQhiwiIGxypV8it49/d4AjLMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6fcec51f874cfbb6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaG0PyajqBLz157c3JREz/snGDA2nTj4XCZrpp2M5XvCzLIav//4zb+fJmHqHoSeMjk1j8momfNVVVJEgIsq8dRC1t7yy0HUhSsd1fKd8CL7o7QbEDzn00liaGZNqXp7gjQBiT1BxyIlAZq8mfjx1nkYGLw7jyIE5KNlXhkZmVMFj7GwBxHuXSAv81NT1TVnzWNis488sqOtTVXi+BdgBzSaAC63NbBrLZq32jkOvZkCMMJIrOHU4LtDrlLHvfEki+xyKQwuuGhyQvywkh8nC/PmqGkGfmHoGKpsLdrLkBFCvcZ5dmMcZN2lRrQ1cCCdtXiUg5vy3d50VcrrHsu7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/75M5JAtxEaTU4YCeAgolPxjRP7dH5hp0xl3CdEzXu0=;
 b=nkBFR/XShsRzA+tOsAd4E6GH6Rr7JVg9VB1qieeNdW4ui/He9y/Ccir0RTmxWgIThmNsdCbkN+0V0siYUzkcQFxJ6vwLMI8tsuKyAAQFBYJ6xN5YQGeFNZj5cT8eKpQ3DXtkYiVuCFFIxFNNnSFOaBg1tu86+lEHQgNFIYZUvMlYIHlbkXXwnW/Xe/DSmEBjA4UtWR6AdHH5n9oPBgc5C8vrJAGuTr0q5sW1InCE591l2dkVOqdPgb1XfBkM8VlzJzKXwwbRm0OI6GBPFSXqaidLN8j2LeqtXT7mf9QrDmf1HrrULe7YNaVCzPVF7Wrllj/xAHgBwZgWDhLRP+KFrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/75M5JAtxEaTU4YCeAgolPxjRP7dH5hp0xl3CdEzXu0=;
 b=VZSJOZWvxr+YolINuHX0ndneWf9wYhi8KzqGMZzn3+28fDHAHb0Fy3P1taZ8YEjbdO1ZhN9uXdqV9oOkyzB6pCJm9opQ0aQesVqaXb96evetHm72UQ+KRb7wQN3kKm8AxVLmrC10MNIymsG6qvOQhiwiIGxypV8it49/d4AjLMc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 0/2] xen/arm: static event channel
Thread-Topic: [PATCH 0/2] xen/arm: static event channel
Thread-Index: AQHYzzvwz5KfzY5FpEi922tCq9+On63xpAUAgAFXRAA=
Date: Tue, 27 Sep 2022 08:41:05 +0000
Message-ID: <F4D3022A-EE47-4178-98DB-9E221BED49C6@arm.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
 <D0DBE432-5636-47AD-B6B6-CCC1D636CD19@arm.com>
In-Reply-To: <D0DBE432-5636-47AD-B6B6-CCC1D636CD19@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|VE1PR08MB5792:EE_|VE1EUR03FT043:EE_|GV1PR08MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdd0fc5-eb03-4db3-c7f1-08daa0640d4e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g6DZlUXe5YS5FEUIDXOge4GjNEMYkTWuRADm8JsiliOxlSCMQ84cybl9UVd1mKw/7OBChbY4/cbrGFc8y5OZ+TzsaLKlbN1bAngmuxzMTW/zjU9NTa+Y0aBMqG3lcUwjB2zGG9t3fxJK5FpT1YkOfoTXC+z5h37rG1p9urfSKUbV3AAY49kQJFBqZ1bSvWeVrUTGNMoa+ovM3SGPsAo7d6Nw3OsdHuGsrgTAKNQ17uWbVNWQqhBUwT2IVM6opZyfSE1DqqgS+UdHyF7aAcwUXMr6QG9uYkbN5FsdW1CtZA1IvezLFeX8wQnVZVB1eiUD9CpoIXuk2ZJJ1NupEsC6vyrxKmhgk3nl+APVi6JuDsx/U/B+0NQUGlVAEdE3nfuwQtRx6G939CoTsqOYsQDWAqZnh/14I+a+2CNJiF+gKuTeSi3RFg5tb70I8A/ZmLh7OOQ94Yxcv9f6k6LmjpiiVPayzG8t37irCILATgJsHgj/i/mYx4mSTwCaXGxLzhbEmWOb9o9Tb8SXyY4YeNkQLGx+4xE8RjkAmGriXQoOu5s0cJknb8EqxwMWouej7VlIotwQYFITerJfjhfLx7hvgvOheK3W0P6cdnh64XfmWtq6akdyxq2yqVMOZJUZ0TARI/CGkGgWhEcan7MPPIPAjfZQ+HB+gswA3zzv4HWa46GsAm40y6Xu8DZADPAFNbXGLli6P0KytOOSoYGClu6fxti59YN4bcZRRSr9zZTDhTrRSq2ugSY2pbbD1Ad13EHNyCmy9cBDrnEZesg5736ZKiDyyGPihvMWXn+gwM7S3jA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(38100700002)(122000001)(86362001)(33656002)(36756003)(38070700005)(6506007)(186003)(5660300002)(83380400001)(2616005)(4744005)(2906002)(478600001)(41300700001)(53546011)(6486002)(26005)(6512007)(37006003)(4326008)(6636002)(54906003)(66446008)(316002)(8676002)(66946007)(76116006)(6862004)(91956017)(8936002)(71200400001)(64756008)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6BDBE3FCC2E2054CBA0BDB62AEB79D9E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5792
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95c6e3b4-d4f5-4cc9-f370-08daa0640428
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jzyUUbQUhZrU+eqps59lTkjg78PGxQtUW2PIS9HJ7zc5iBbngPpIYT6tvhY1eD+NuB5j/LPplO19hqif/NxHGZBSN7rIs1xbG3ROibviSF3mk9LwBBFbN6nkwNol9duhUk+1AtBG6XzSQXzfx9EjKGq1ApoRW2cM6mybxc8Pg7igFt4i7jg7T7/Xioj6MgnL9/YYS5TLd2w2XrwmSDdJt5n5htq5cwwMcaNkUTlTWqXBiJrMNMvJkAAUXE2R6HcmahHjGA2WjTUO8MSlYNY3167R58tLpcltHToFRN67FWpjhwp1LdJo7hzlt8ffCMg/6EUZbMPe8pTlwTcIvXOXYC/wffcJUnRPnms4NJ/UFjc/tU80xp/IU5vSAOgdtKOMMpnjk8Qmc1cJLzhCs4gPAPZBfl0Vex5w3qDPhtcN2MTM/4WDQiawIoMtyOswL4Y8f+UO3r/Wk/SRFyNq4Gffs8UojXk3EfePUqsDt4OF6AxXUIDTD5trmLPt+E60xMnYAhK1IGtm0bi1TRqvKc5VCT7dJqU90qq719nnXOQwTo26goQ6XOO41LHjF6cbtFptbZ57gu9hER097QBsh2QPpAlrS68gH1ALV8mwAbqAqUbW1NEOsU8+s0N85JxpzT/DYRrys83HCl10+TK0ZF3PfqDrA/unbKGr0LxF2FBPbTbohME09DIH+q0mKRFvTRFd1ykLLelkCR4QbaeqSJWhWHqiR2+ri77kac792pIDOSrggRTZuM6Fl+obM6B0tIC4z7vGBgbOLf3+xsllvhOZBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(4744005)(36860700001)(6862004)(8936002)(4326008)(5660300002)(2906002)(8676002)(41300700001)(37006003)(6636002)(82310400005)(70586007)(70206006)(36756003)(26005)(82740400003)(6506007)(47076005)(6512007)(356005)(478600001)(83380400001)(86362001)(186003)(6486002)(40460700003)(2616005)(33656002)(54906003)(40480700001)(53546011)(336012)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 08:41:20.5599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdd0fc5-eb03-4db3-c7f1-08daa0640d4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7345

Hi All,

> On 26 Sep 2022, at 1:12 pm, Bertrand Marquis <Bertrand.Marquis@arm.com> w=
rote:
>=20
> Hi Rahul,
>=20
> Please give the necessary justification for inclusion in 4.17:
> - severity of the bug fixed

The severity of the bug is high as without this fixed system with ACPI supp=
ort will fail to boot.

> - probability and impact of potential issues that the patch could add.

As we are not supporting the static event channel for ACPI, it is okay to m=
ove
alloc_static_evtchn() under acpi_disabled check.

Regards,
Rahul


