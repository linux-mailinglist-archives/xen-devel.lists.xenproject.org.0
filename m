Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC774EA33
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561640.878102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9Y0-0002Q4-P1; Tue, 11 Jul 2023 09:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561640.878102; Tue, 11 Jul 2023 09:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9Y0-0002OD-K3; Tue, 11 Jul 2023 09:20:40 +0000
Received: by outflank-mailman (input) for mailman id 561640;
 Tue, 11 Jul 2023 09:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pXgh=C5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJ9Xy-0002O4-Nq
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:20:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3192cfa6-1fcc-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 11:20:36 +0200 (CEST)
Received: from DB7PR05CA0052.eurprd05.prod.outlook.com (2603:10a6:10:2e::29)
 by VE1PR08MB5584.eurprd08.prod.outlook.com (2603:10a6:800:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:20:33 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::3e) by DB7PR05CA0052.outlook.office365.com
 (2603:10a6:10:2e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 09:20:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Tue, 11 Jul 2023 09:20:32 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Tue, 11 Jul 2023 09:20:32 +0000
Received: from 16eb10e1ceba.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F439925-1CDA-4B0F-A7BD-C5948D314B7E.1; 
 Tue, 11 Jul 2023 09:20:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16eb10e1ceba.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Jul 2023 09:20:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8449.eurprd08.prod.outlook.com (2603:10a6:150:81::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Tue, 11 Jul
 2023 09:20:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:20:11 +0000
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
X-Inumbo-ID: 3192cfa6-1fcc-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Xg82GYLftfnYo90G4mlxEZRxddvRh/BcVLFO9jcQr4=;
 b=urUW1Ra3KymW6JLR15gsZEpUKiGvwqrqiMuRH9SXkaKUyewSHRgFK0vAS348MABlRLY64S5BlR9VZIUKAnpOAakQ5NqhiCA4ndw72YCHCjs1Kq9MZ+HDMf/eIu1MTrx7ugkyhwCnv5VEAKDmttBEODhiyyY91+Tf+VG5U8LhiXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aae796f89b4a8226
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkVmjIQ1ptSSqMC3o7wTARKGYTd/LoFLhNX8TU+XPj+wy8tha6xsLw10eykp2yyi/qwgYzDTqn4BtOvm1bhNQdgTmqcUUrtwXdgJ/7AE8ME8EJN7ff1f+H5dqUtzYo5PpIp6McdrYZYTDUlTkV6pGs+m06OB8nnck33O8sVTcWprYKpR/A9X5+xweBB8L77eFMDi8gGaftBjq8CS6kkMl1DaskA+97CB8MTA5jDShOvMAYbs9qrr75NNkN0aMR2YpvxV7GufLpGEgQSX08zltDVRh11YvWo1+1cKj0ZqSowo5k+/+APgR/nJMynwPkWlIDcf3zvExuXEvDgvQi4t1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Xg82GYLftfnYo90G4mlxEZRxddvRh/BcVLFO9jcQr4=;
 b=eaOsXZiFBR1RwJNtxKFXmPn+0WOrpFnglk4wpUeORnfdadeXWUu65crwgsJ8hx4ompSRju4eJSd8bdhjVMLCg9elvoinNXjMAYzsU7w0XYdr9SwmbPmeaMJleJ6HQCgK9Bi9oF0GkEEgrFkNpikELdfnVux/OtYGPFn8JXQShzc8A0XO50ZaY9ZWUqISVcn82m3wIMMam/RLxcwUugwsGLC+Lb9TRa6OsivX24GYlHv8KFRRYRu3LnEjs76oo3nebX6uHhncItlS8+8XJo5AF/PRfIK0Tb5MF3ryUj91yUC/09AWqhUoCHYNAYaQTiIPcJjgL0kTm5mT2NCSGVKltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Xg82GYLftfnYo90G4mlxEZRxddvRh/BcVLFO9jcQr4=;
 b=urUW1Ra3KymW6JLR15gsZEpUKiGvwqrqiMuRH9SXkaKUyewSHRgFK0vAS348MABlRLY64S5BlR9VZIUKAnpOAakQ5NqhiCA4ndw72YCHCjs1Kq9MZ+HDMf/eIu1MTrx7ugkyhwCnv5VEAKDmttBEODhiyyY91+Tf+VG5U8LhiXA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size
 separately
Thread-Topic: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size
 separately
Thread-Index: AQHZs9Hujc48aRyGZk6yzyef9j5Sia+0ShiA
Date: Tue, 11 Jul 2023 09:20:11 +0000
Message-ID: <FF0724DB-6975-469F-998C-A22D0990E7F4@arm.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-3-michal.orzel@amd.com>
In-Reply-To: <20230711082931.5402-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8449:EE_|DBAEUR03FT062:EE_|VE1PR08MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b41694e-8da2-4251-c635-08db81f013e8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6gcDc5f2tLFuUKn784SKGS10dXr9nEpy00U+T6i6zrDg3Ctel/rAB7Qg+6NB0UIRHijA6MI0oNMCPR7LM34+qt/02eM+FmfsfkXzCLaRjX/cyhAuX8qgqV1beF91IpnAZ/U2APDCT50VPjE58S1m1pXgTwp6V1SkEBoDgSb+LQYvY8dVpR+GMPhfqFBC55nIIM8r3X73xL2YJSaf/70K0X17LaNCzYfBcVLMz9400rm/2PyC0N6FnwxBMwWYUgeM/UNOkrL513BqK+pWKV95GDGJOjnyHGb4pdqBx/nFza5kY4II5nyzxTvPQys8Vd5Ei/IeM3MjomrzXiqH4V2SHgB3n4/DowXw9aCVsK/dwMml0PGz9os22rnTS7/8fd2qZ+AScSWE7xXkAIeazDuhTZ9cNe2/pc6RcrBny4/ZkEsb3duJphSREi0a2sZ+kfLqiYMOmZAlyBvFsNFaIOHFfNvyKa3gej1I6bpbLTz7mCpUBU9W4HMNt1LJjONobWouJRlnV6eauZH5E2cfJ6BLYxm/gVZyr4J/iXVUv0GXckr1UWs8y84xh5T9jWMaDKSjUoh56eSbV/gInvtwkm/lYmvPTHA7OIB1T3R+z3In7jNad1ulp+lwXy+wtV+gGmPoXpXXqPquENCur5tW4cIKnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(76116006)(6486002)(478600001)(54906003)(71200400001)(91956017)(2616005)(83380400001)(36756003)(86362001)(33656002)(38070700005)(15650500001)(4744005)(2906002)(66946007)(6506007)(186003)(53546011)(26005)(6512007)(66446008)(38100700002)(122000001)(66476007)(66556008)(316002)(41300700001)(4326008)(8936002)(8676002)(64756008)(5660300002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C1AD5ACF7ED1EF4785E38F4CAA0C1871@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8449
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb68dae1-0a87-4b23-25dd-08db81f0074f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sRwltAwShH9a8toeWmhSGKh75yOijD5OVgSeqJD8S31wxAgl0j0mijjU6MJms9Vnc63rlyfH38QtBzzdCPM0Q39SMhVCQnHcUOSkXnY0DWPAiOs59LEatMheiF5akKsx98WztWE7kmHLUAyZcR5xEmA3x6PHlM9LzEPQ1URZjzHMwoszVAh5wlYZ7jKtarqEZrne28CgHsmeqncBspRvMdWlls72ALTKQ7CWCUntuY4mxubhvQ/4fVrwBhrAjRHKIvOnpS3Dye8SSCRmhqSk1ehk54VtATLHpjodngPZPCvtARJFaSP0K7CkOjgKkAyFquvzE30vkzn7ZBInIDcEDM6DGx/ZZkRp4DqrLr8tGsMnomnVrNYba1pyW3wh7+ahTVW4oOZ1f6NqjS5ezIodCRu8QaHdlaCZShdMDKtefjZMD19Ucw4vupX0WLIz2vZdbduftQkmke2L+69GhR7qXNmxZo5z6yqQitx5sQPOk2A5dBMOcjTmvMPpVbxIQxy/JwydBghi83uRk2L6lUk5CLDRROjVb+dtkt4HSUFbYsoe/HPIQDCxu+hpveeSpl1thaeHagO7Y9ZGN8hdwRYrv/gUpvPpiuB0ObKm6auKKk8PMuY3SVfIzRqAcT/VVC77RUiBn70yR1cVVZ5tai3ET+Ijg32Kx8/AfbAEJdtiDgPw7WWYCiMeCYrvAQWxH8+ZeEebw1pMSDoVppu3PlcuN53YR8OlEeGvFnQ+xl+BoSULVJ7TV4WjhygJsOB6G90C
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(54906003)(6486002)(478600001)(26005)(6506007)(336012)(53546011)(70586007)(6512007)(107886003)(186003)(70206006)(4744005)(2906002)(82310400005)(15650500001)(41300700001)(5660300002)(316002)(4326008)(8936002)(6862004)(81166007)(8676002)(82740400003)(356005)(33656002)(40460700003)(86362001)(36756003)(47076005)(36860700001)(83380400001)(40480700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:20:32.9057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b41694e-8da2-4251-c635-08db81f013e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5584



> On 11 Jul 2023, at 09:29, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, we limit the allocation size when creating a domU dtb to
> 4KB, which is not enough when using a passthrough dtb with several nodes.
> Improve the handling by accounting for a dtb bootmodule (if present)
> size separately, while keeping 4KB for the Xen generated nodes (still
> plenty of space for new nodes). Also, cap the allocation size to 2MB,
> which is the max dtb size allowed.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



