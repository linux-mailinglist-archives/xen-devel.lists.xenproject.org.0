Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2C57495F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367182.598238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvOl-00007o-Al; Thu, 14 Jul 2022 09:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367182.598238; Thu, 14 Jul 2022 09:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvOl-00004u-7R; Thu, 14 Jul 2022 09:44:43 +0000
Received: by outflank-mailman (input) for mailman id 367182;
 Thu, 14 Jul 2022 09:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lagp=XT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBvOj-0008WS-E1
 for xen-devel@lists.xen.org; Thu, 14 Jul 2022 09:44:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94c46c9b-0359-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 11:44:40 +0200 (CEST)
Received: from DB6P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::18) by
 AM0PR08MB4977.eurprd08.prod.outlook.com (2603:10a6:208:163::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 09:44:38 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::2b) by DB6P192CA0008.outlook.office365.com
 (2603:10a6:4:b8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Thu, 14 Jul 2022 09:44:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 09:44:38 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Thu, 14 Jul 2022 09:44:37 +0000
Received: from 9f68f10db1ff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 578A68B4-DDD5-449D-8CFA-D18CCF5DEFE9.1; 
 Thu, 14 Jul 2022 09:44:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f68f10db1ff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 09:44:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3820.eurprd08.prod.outlook.com (2603:10a6:10:7f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 09:44:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 09:44:28 +0000
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
X-Inumbo-ID: 94c46c9b-0359-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AQHD6kAe3dRlH8ApfSR83BtEx/yUG3FZYmhNLUFFbUUAW6Ch5aLjh3dZMt2AnPUm4j9ELdE+PTlbuH4DAbdyHkHNtfphXHGx38UeB4vmLowIJD/BCOTpJyASRc5vmLuLjPztDEJJMC+WZDQGJy2LCGJJFejuiGpY8usTyqp+wRBy4UPn13u/Vs83cF6Z7tSeR8gzYeuhe4jJK4UdC2YsH4PRrYR7XGDV2TYDf3Ei1wnm7wk+8LDSGR8CNccw2wZ/uHunic+DyvgZMqtSR+oTSN1pdmY2bhv9KLoy3981DQgdYvpiA4xnO4SXX5vT7voOfeuz4LjqP08OSsOrr+aCjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S36hyEWjsytbeUC8SKEf+oYA+nwYUEcZ7pFbvyOdqgs=;
 b=oHP1hXGyML4U3AMRh/oVIt/1wte8wPPIfJr3xJbsNUbNZwJBp96yCI60ZgQnaKmHZfcvaJl/F8D0y4cstpk42te8vurnXAtQBGAfo3892FfXWTHkUWigTE/6dLzRzUJFgxm9G4R2KTVXq/nBiP5MaA4mXBkQe4jXtmNhMuw5q8FylpppszpFwZ/zeLdXjkT/JZZx3qYamxw6TRjXy1bNuVAR6UxGkGmVbZr63z/xj78tLR+db/VEdFUjOeqsARW1ipzFxi6ky8M7IOHan9ZJpHYtZuZq52cgMSDnSgR4MD3TEAigS3HLap+bsqAt+zxM6JMMnmOIc8HIELeJXu/dVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xen.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S36hyEWjsytbeUC8SKEf+oYA+nwYUEcZ7pFbvyOdqgs=;
 b=sPWuXmIbef/SRI3k00nJt6xP3enLM6EhseqzTCm+rRNjxnGPM0kUsxXlkjDMlI8EcGgpwI6f+3In+1TI1JafmOGO9LxA3diEk6CNzUGifIs9Ulpghm/BDKmkzy8+K5DZZvh6E/U+47WGmGgS3pzk0HfM6Yn0uxpIyrOKbKv45Qo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4bd34dce404285c6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoBnZ/aVVfbwSCALut2qQN5PwJq2o/MORRySJ5kEuhd6PgYkAMzqpUl8KkGhqtEUCVM479KjhhKaRJjTHDN9EWa777v0+Z1AvD1zQZWytRfWp9l/1uzbonNiBPFmePh2SqEzRzJ1hBjmtlbbpaE7wMHMAJNDmCVMlVe6ShFdcTTekQ6VV0zS7BZgnJ017tvMaoeRPTG+QCa3TwQJ+qXuScLv9wNCk3Dt04rmxUsvVlIwI/MEhMAT03/SnNaQyRw5rcI/rglxDWKHGAJ5Akc81wdRFEh+sGiX7j/ENHTCF5T8SZeLiR6YmO1fmuBW959ZGlUBxvLDtsVUhYyaZwj5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S36hyEWjsytbeUC8SKEf+oYA+nwYUEcZ7pFbvyOdqgs=;
 b=E5CFFXBpAo9Fc3SS2h2QEdpRTeBut/JqAdTDMwB0rSF8quyOERGJx+fP7R9+BN/pCb+ns6DzQh3/RifZrD1NiRJwR1CespWXStq/10A8pNiXaS48GVdGbkCCO91C4P8zrmVCLYE/gyUODFlaprOI4/FEdV1vsEr3Epeglln3+aT7FH1s0Dhee3dHPNUXE6bFsPqIXqop1LJKlMYCaaDDSHMjAW/WY3tY4rI/R+W7LFR2xL+dq4VqHhJFUGpCjqIGynyRmLT/XvWs0CkOkyKkdrpTy0mxIlcIj4+wFKlS0o/ByLC6hk0/jSnZ1FwU7OGo9uapfnI3UbmDCXyQOTXUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S36hyEWjsytbeUC8SKEf+oYA+nwYUEcZ7pFbvyOdqgs=;
 b=sPWuXmIbef/SRI3k00nJt6xP3enLM6EhseqzTCm+rRNjxnGPM0kUsxXlkjDMlI8EcGgpwI6f+3In+1TI1JafmOGO9LxA3diEk6CNzUGifIs9Ulpghm/BDKmkzy8+K5DZZvh6E/U+47WGmGgS3pzk0HfM6Yn0uxpIyrOKbKv45Qo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Brad Churchwell <brad@cachengo.com>
CC: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: Xen on rk3399
Thread-Topic: Xen on rk3399
Thread-Index:
 AQHYlaRzw0VI/DSwq0Ot3R+564rcea161i+AgAAPUoCAAANZAIAAA34AgAFZWwCAAAjiAIABUr+A
Date: Thu, 14 Jul 2022 09:44:27 +0000
Message-ID: <3E15C816-7A02-47A1-ACA0-BF2B106CF482@arm.com>
References:
 <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
 <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com>
 <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
 <ECBAC842-3E20-4956-BACF-CB6D8CE708F8@arm.com>
 <CAMdBLPOXnHuXyC9pqN=w4i8nD9aLXtBBhXL1JuUe-igsPkBwYQ@mail.gmail.com>
 <81265FD0-2D00-48D7-ACBA-0F7A4FF3DCAA@arm.com>
 <CAMdBLPO8YZbti9x-w2WEm-s8LTUmQPLJmZRsHStGTGCHFjPrFQ@mail.gmail.com>
In-Reply-To:
 <CAMdBLPO8YZbti9x-w2WEm-s8LTUmQPLJmZRsHStGTGCHFjPrFQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d819271d-f600-4c0c-1ea5-08da657d77b8
x-ms-traffictypediagnostic:
	DB7PR08MB3820:EE_|DBAEUR03FT031:EE_|AM0PR08MB4977:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XrOYe/FpuZYQxK4z0Fppyl2jKRPp2tZhxka4vPxNL9XmxZBPq3bma7cRXPMApcGHrUTpzNtU+W85VQz9ncCfjaKXj3X6CWgox3ELoxnm/zsyyOwOF1ovUhEHjBDCd55dVtXgRWb7ycjBwSzp41DVknMSIASjZfAgNtUjS+RsgtKre0WLvELwvj2tvlQjh7QHksz67PHXUx/lAWb3vugKZvWWggUVrN9j71kJtQpOBCiUWU51g9+iZFi7wAhqeqXuHpr5RuNe+fqHFLNOulSG4WG1qfa/5YfVR04XjCDvuyq1BB3HoKaJM5zAI2uqY1JBzzQ9moTY3wESdhdGV2AclTx1GNVUGgq4E2aqj7ofDDG0zAZlnfPD+KD8ghH8iCyOcjRtFFV2mWPsqRfkEyy252OS4evohrwb8x8pRCMeMg4rCWBBWx/0CQP+M4QjekFh908hFji4V1266NKmiUw8+NTWGILi/OLj93nvNiGDI6ianMplWo2vGe9urrnBB9CpUmOdYR321iltTYnFINoVEXpoJCtpfwDUx7Yx2EKqQa2FLdWuogqRvEm/aonSKnvv+Bc5Vb8ZO6pfUEKRW3aEnzStNzD+5mklmSYgmvnyUlJPSgg6pZGEyFmRK5BZ14NpcG6FYz5eQxVjZY2yU7Ehxrc5zOXzqak7urYjv/feyOYVepZ7QlNJmoLSCfYI59Pdo+uE5C0Bp0+f45W1Yfrt+6yFngyJe95inCjNmNNfs9XUEiaxyHuspvZPJzcRUW2xTiAQ/uHRA40sG9HiGjY6vfAvnjNWv7WiAFZ20NRm57eYSbkkUjJEiEFDQAiECnQCVv/hBkR3x+4hH6ioAcviJV8i1BmiUkqhqhZFdXOyxu0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(478600001)(33656002)(83380400001)(38070700005)(36756003)(6506007)(2906002)(122000001)(6486002)(5660300002)(7116003)(8936002)(66476007)(64756008)(91956017)(6916009)(86362001)(316002)(4326008)(8676002)(66556008)(66446008)(26005)(71200400001)(76116006)(6512007)(53546011)(2616005)(38100700002)(66946007)(41300700001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6CFF211B2A897942AE99E71F20E197C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3820
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3b29fe0-a98d-4a8f-0d2d-08da657d719b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TiH6b62jkTlO/osy230bxHK1KOeu6/R4FajaegbHaZ6u3uim7CepfDGBQSfY5d8vQq/+ZD/ix0ggGzQJYmzT1ftnJGnNFXTurQs3UOs4XltqgEvbTJRjOnqUIKlC7bCT0vwC+96jHMpnMkEeqZRSLrW38hSrgXHveoBSnQ986E8gsCsqiR5aPeCuKYPe34t+wWEIxXU6nlYhzkaaLrCNmXr6uPGY1RvEa6vwO5SY4ow1eYQrU0X9s0Vr7pO+N8yisKBzFBSj7T2Ai/lInomMppDVVTw+8U4mbF6heQ44JIKwyUXnlD3S4JCGD5+WQ9SEFjNdW6Rx2wTFfXr/5uI6z6kn9ZpAMcfPyuJHgFSCj5H+3o9X6W6feB48/MNYsNaD95AcnsrMEVV6nY6CQaIkmPyfPhf7RABO9o7Jx8H5KaiGSvUQW+KfTtTiiZzHXwkvVO9j7Pi5GWgbKA7MpzzzgcWWqqE6ye3EmifrTXafTSyl5aPJ2IPOeo0/GVopll5lEZiYeZxwfKADnxm09IDhvXAP01RLOiqGvx4A9NILCHDcSP19n0mEi5uC9mGQXt4DxktP2tGEV+ZkNn5p8tPHyWo9j6rlMUn7e92QmcWraSrzsHcAgmLoLbbPl4KddbZknv5+VTVnqUOVCUIuEt5TyiZj5YIBGSaoK+Y/6Zd4SYS/MHG0kunUzxrJZpI+CXl4+o1ZeUHjLRLbZF+6yDSloYQOCjneFtC69xL8uJxt95KLSW4jI6c/UHsR2PXUswWyF8LV/iI434sbC3HLk6dHTe/vTEhwcjJo1YNeJw9IVtyDIsj+sGp9t8mO+wsj+y4E
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(40470700004)(46966006)(83380400001)(5660300002)(2906002)(186003)(6862004)(8936002)(86362001)(2616005)(47076005)(336012)(82310400005)(82740400003)(356005)(40480700001)(40460700003)(33656002)(81166007)(26005)(6506007)(478600001)(70206006)(70586007)(36756003)(4326008)(8676002)(6486002)(53546011)(316002)(41300700001)(7116003)(36860700001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:44:38.0219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d819271d-f600-4c0c-1ea5-08da657d77b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4977

Hi Brad

> On 13 Jul 2022, at 14:32, Brad Churchwell <brad@cachengo.com> wrote:
>
> Hi Bertrand,
>
> I did this yesterday and it does indeed silence the warnings saying to di=
sable those cores, however the IRQ errors still remain.

Can you check to which domain it belongs ? If it belongs to the domain with=
 little cores this might explain it.

>
> I think I made some progress by changing "interrupts =3D <GIC_PPI 9 IRQ_T=
YPE_LEVEL_HIGH 0>;" to "interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;".=
 I noticed when trying to use XEN-4.10 that it said "IRQ only through SPI" =
and failed to boot XEN where 4.17 unstable boots without this error. Now th=
at I changed GIC_PPI to GIC_SPI, I get the following output:

You cannot change a Per Processor Interrupt into an SPI those are different=
 kind of interrupts (please check the GIC reference manual for more explana=
tions on those principles).

You have a board specific PCI controller and it could be that the ITS/MSI i=
mplementation has some specific parts which are not supported by Xen.
It will be hard for me to provide more support here and I would suggest to =
try to explain your problem in Xen-user mailing list instead of xen-devel, =
maybe someone did try xen on this board.


Cheers
Bertrand

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

