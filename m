Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A2809F29
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650472.1016044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX4M-0004ay-Iw; Fri, 08 Dec 2023 09:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650472.1016044; Fri, 08 Dec 2023 09:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX4M-0004Xs-G2; Fri, 08 Dec 2023 09:22:50 +0000
Received: by outflank-mailman (input) for mailman id 650472;
 Fri, 08 Dec 2023 09:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBX4K-0003mn-Sg
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:22:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a5385ae-95ab-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:22:48 +0100 (CET)
Received: from AM5PR1001CA0049.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::26) by AS8PR08MB9598.eurprd08.prod.outlook.com
 (2603:10a6:20b:61a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 09:22:44 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:206:15:cafe::fe) by AM5PR1001CA0049.outlook.office365.com
 (2603:10a6:206:15::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 09:22:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 09:22:44 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Fri, 08 Dec 2023 09:22:44 +0000
Received: from 1a9faf8ba2fe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7C09C63-B628-45A6-9BF9-7E82D3BC38C3.1; 
 Fri, 08 Dec 2023 09:22:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a9faf8ba2fe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 09:22:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9948.eurprd08.prod.outlook.com (2603:10a6:10:3d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:22:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 09:22:29 +0000
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
X-Inumbo-ID: 5a5385ae-95ab-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SiznOqqOvtTynslHUI8oyTPEHUVg2g1fTIDPNwj4tZ7z3SOM/LE22JcqGAopXNJuu8FFtafyzBPbFQFhuF5K6R4tcmQ+jI0Zj334YYwxUf2lIc2svHAB7p0U2KQkz+jcD8DYfPikHZFLrRSNnMMPLabZ71DIoxyMwQMxa3vMulmgVm7jJ1v4ruaSaxrW3jy2B1ofIm7PJXMQGMdU5D2GV4jrecO0uepEIsRz1/GirTGpZtWHFdbZMoy9ieoe9CbyHNRMqrlyoJe0I4cxK2pVKjGnq8WxeJFiX6nLoi1nxVpXYdyiYWqu+U0ZIOPyLvibSIpnnxlqz7sjk4K8fTPUDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7jhkCerzc1dSsHNWiFnOkH1nm3A2VSRvV2aTGf4/S0=;
 b=dbqfFwQlShnxgou0R0DJb50p9vglkqrveollMV6S9Dr3DH/1U32q/w0ELDapx3pwtXOXjK1OSt3l/u5L5RwK2lN/VHZtgHMkc5+mq+J/5GRAHnbaTLuTGFD3cSx6sOqsUbttrUExtG+4O4eUQuf6aDOxZ9J+ibnQiXnQ5DcTCxW4poX7Yn3Tlt/62uUciqWqMjIB/5UQYSluR+8wVpbUo2Ua31lFbnnFtDGbb6+uKvYecOwLU8mGymCP2TiXtRkE95H3EifjR/elboRhQZUNSt+w+EcTM38aKwuS8J3+O06PhOcVUxmfyT/0NBcicL1/b0WjqjC8oJj0IqFyNU0jlw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7jhkCerzc1dSsHNWiFnOkH1nm3A2VSRvV2aTGf4/S0=;
 b=t0pmEi9l6rNcCapcuJ6TOS08uocGUX+MiU9oZJoUKpB7CafoW6ZzaK3ohs8UteeA1U2suBt7/4PW+HxnImD8q8QQsUI3Ju53T3eSle5ix2nWZP8F5VGPVRW1w1wflx60V71OB3pTBP09avnkmoQhiXYk0Hkz8DfWLf41gtpirbk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17b8501377842298
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7a0xq0UN704RrU9bssxqfdmzWGDtB1Ahmz3vakl36Dc3g+MrlFTsRNSM954dfR1PGvHZ7wPQYCkBZ44yICq2Uxz/FaWyS0N5ocG6f9BSWVED9YUeru4DSno/NfyCuZFGdqx73xsyVoCE5VwjciE4PrRzzP2niXCOuDVHYqbgbXn02uGWm1YobTKMFaDSCgFq+2MwQnD37rf3+zIE2xE2G7ySrjBrUTA/nh5nN9YpU3uQweF5BNxrYhbrPPjwRGVDadppvmkZYWfB6G/F83lxr2ELKoIlVtAWjBYzYFzo+N9A5y2K2CHyD3RRJ0+raa2ctpA/2SUzvRrCgN32nS+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7jhkCerzc1dSsHNWiFnOkH1nm3A2VSRvV2aTGf4/S0=;
 b=nH7Tevkaop2t3b/jy8yWGMBZdH4EAyiU05V+FcfOae8q8ZbFr74kbk/YSnguonNBJoLJyMXr4KksBPSN9EKqDufCEHgrUNlkuw+inGp8HXLPKr9KjpCxFIE3RAg4kO8COZzcmjghHA2xnSKFyJpmfROCUV1YW5gJOLBxIy1N/MBP1HXUBspdaapyQFuM0kkks6zIK8FT9XHwnyIdBrlWgtLDHmgGUaM2cxWM0KQDcq/HdCu7S8TmLYFaHtZnral2zkMeIohM9p3TanMdmlQrnxxGVRiyKS6PAOBO81Q8UeYBKYGTC95SPk7+dMm3JmRGSKnckeVz8KGU9jnowbvnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7jhkCerzc1dSsHNWiFnOkH1nm3A2VSRvV2aTGf4/S0=;
 b=t0pmEi9l6rNcCapcuJ6TOS08uocGUX+MiU9oZJoUKpB7CafoW6ZzaK3ohs8UteeA1U2suBt7/4PW+HxnImD8q8QQsUI3Ju53T3eSle5ix2nWZP8F5VGPVRW1w1wflx60V71OB3pTBP09avnkmoQhiXYk0Hkz8DfWLf41gtpirbk=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v2 5/5] automation: Add the arm64 FVP build and Dom0 smoke
 test jobs
Thread-Topic: [PATCH v2 5/5] automation: Add the arm64 FVP build and Dom0
 smoke test jobs
Thread-Index: AQHaKZoDMKx6KwMfaE2hQqJt20ATC7CfG/yAgAAA5AA=
Date: Fri, 8 Dec 2023 09:22:29 +0000
Message-ID: <4DA31B14-8652-4DB6-955F-79FC8A685C4E@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-6-Henry.Wang@arm.com>
 <8c420801-9fae-420d-b4c8-b30a0e5cb024@amd.com>
In-Reply-To: <8c420801-9fae-420d-b4c8-b30a0e5cb024@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9948:EE_|AMS1EPF00000043:EE_|AS8PR08MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f926c4d-a49c-4ce2-9ee9-08dbf7cf3c3c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WcFuOUG/1tc+PkMwSE6oWH6bNQWX/+IO4Ig6+fHQAifZmUkvUcMGlNrHD/kuYE/wn53P58lgSVPvsYeZL8Hiz1C+jPtlNGstdUjutlwGhsFu6KurVFncISMgy9qr2Rymf8rAic4gf/ouC7OuD1bBEK1sgoCSwq2TjGc0JD9kTnXPAFIE9uAWx8IFjb8Qt6ydmdgsR5KygFUlSv728w4lM4wGQmmawv9xZmNXQ8522gqxxrfXEoF7ZGiI5L9GdUcHBp3xcjcU8J2r06QdFAvsEFmzlXPFR0xVwxrY1/acS1EqZjf2AVBSy2tSRTxueEt4N0SmeADvmbM8VrIRMTLykXPJsxE4LtVLlodK/X6370bGv+x34tyQ/UR9/WSvz+UrfkhIzznRiVtLFIjUM/QHEGFGBPyysVKsUvNQN6eMZcTSVFR/38uOUXl6l7tzFmNK96tbrQVGIGVX5T8cbKVdQWf4zJJHxeqaHh4cxuZa/V8+S86mSzedznfHmCZLwK4L2+e/ifIxKicSHWsl6Qc2CT9ZaS4eRUEvq6y6WuQleo4JCasTKwSgeVbh4I3dayl2J354nmU8eAkHnq1WGv5HcbzawAxpHvItXbc1lijx2q8kZ3LkOLJ+l2cnbZohjMN+BlNfLYtsAAfrzrnmUFrf+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(5660300002)(8676002)(8936002)(4326008)(86362001)(38070700009)(36756003)(41300700001)(2906002)(33656002)(26005)(2616005)(38100700002)(122000001)(66476007)(66556008)(64756008)(66946007)(66446008)(91956017)(76116006)(54906003)(6916009)(316002)(6506007)(53546011)(71200400001)(6512007)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F1272B03FED71E44B23E998A5107BD8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9948
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b5a76769-a7c8-4371-d029-08dbf7cf335e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HR1ORAbsjuYGo50ADEUhkTRDU93N4N/4v9n3k6VS+ZcqoRzM4rjUrALwYgGVs0TKVYiFwe+CV/5fpCajU/+XnVxtC6weJyEkfTLmtlp3kYyyKPuSawRAidgj15LltBsXDxq2X9QNMgx+JOrGwcLDJt8pDTPmLtisKpW2ZEmMaUgbwHbtxXBmtir9MQDiGji2VC7pPTFGOi771r3wFN7yt2GDRjX3553Ot6LWeSNjf0hX2wkqAcMt4SHeuQz4y5k1bkKsvJSawszeVRwNcBoncCc6t1VqT13bUzrPkKBHz/Dp95xc2O1Cyo+Qi2yIvc6szG3Udr4GF67vWmXmJCIEGppRFFC3ymMztdYHtyhqmQeRZMq9HP+OdbM7tBqtkbPfnz+xaP0ne29R+b+f72g2nW2hegOZyux9zGLAkZYVkiVLpLzcEhi4cBhgOHsBsdh1AVp0aTVx3OI5XMNLsiaRTOJC+8KqwSA08VtKbEK1KRuhqyT+Oh4aePDmGomm7WCsRwp039m6BFvYBsIeswvcLSZfVzQ6QZ5f329IUDFoHgbXQ7qdUDF4RLHX/fPQdI7m9GN1QqIkwKVVySoGYooeN0ZtIGnIrHU7zmCGApfeYldYS0ufUI5SbtnZAmUPtkXF1mXrC3vsLwCmW4liF6NSi4kO8dVxpkob9BwtF42ztyOHRJdbAhPiDe1yKfEPqUPhlpmCxH+/zD//TxB9vOudYFfkmsvdnEAHSa197x6IhKCkPRhgpSTgWSr4DYGxoQt9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(6512007)(40480700001)(2616005)(356005)(47076005)(81166007)(70586007)(8936002)(8676002)(36860700001)(70206006)(54906003)(316002)(6486002)(336012)(478600001)(26005)(53546011)(6506007)(82740400003)(6862004)(4326008)(86362001)(40460700003)(36756003)(5660300002)(41300700001)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:22:44.3485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f926c4d-a49c-4ce2-9ee9-08dbf7cf3c3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598

Hi Michal,

> On Dec 8, 2023, at 17:19, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Henry,
>=20
> On 08/12/2023 06:46, Henry Wang wrote:
>>=20
>>=20
>> Add a job in the build stage to export the TF-A, U-Boot and the
>> device tree for the FVP platform from the test artifact container.
>>=20
>> Add a FVP smoke test job in the test stage to do the same test as
>> the `qemu-smoke-dom0-arm64-gcc` job.
>>=20
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

>=20
> with a remark...
>=20
>> +fvp-smoke-dom0-arm64-gcc-debug:
>> +  extends: .fvp-arm64
>> +  script:
>> +    - ./automation/scripts/fvp-base-smoke-dom0-arm64.sh 2>&1 | tee ${LO=
GFILE}
>> +  needs:
>> +    - *arm64-test-needs
> This would imply the need for qemu-system-aarch64-6.0.0-arm64-export whic=
h you don't need.
> I think you could do:
>=20
> .fvp-arm64-test-needs: &fvp-arm64-test-needs
>  - alpine-3.18-arm64-rootfs-export
>  - kernel-5.19-arm64-export
>  - armfvp-uboot-tfa-2023.10-2.9.0-arm64-export
>=20
> and then reference this in your job. This will be reused by other FVP tes=
ts in the future.

Sounds good, will do in v3. Thanks!

Kind regards,
Henry

>=20
> ~Michal


