Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEDB511357
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314506.532579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njcnG-0002Ft-KI; Wed, 27 Apr 2022 08:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314506.532579; Wed, 27 Apr 2022 08:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njcnG-0002CV-Gw; Wed, 27 Apr 2022 08:13:02 +0000
Received: by outflank-mailman (input) for mailman id 314506;
 Wed, 27 Apr 2022 08:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzB+=VF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1njcnE-0002CP-JO
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:13:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d988b941-c601-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 10:12:59 +0200 (CEST)
Received: from AS9PR06CA0735.eurprd06.prod.outlook.com (2603:10a6:20b:487::20)
 by VI1PR08MB3952.eurprd08.prod.outlook.com (2603:10a6:803:de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:12:55 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::6f) by AS9PR06CA0735.outlook.office365.com
 (2603:10a6:20b:487::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Wed, 27 Apr 2022 08:12:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 08:12:55 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 27 Apr 2022 08:12:54 +0000
Received: from b202a583f085.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BDEF377D-C5B6-413C-A6D2-C47681B6D1E9.1; 
 Wed, 27 Apr 2022 08:12:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b202a583f085.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 08:12:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3371.eurprd08.prod.outlook.com (2603:10a6:10:4c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 08:12:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 08:12:47 +0000
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
X-Inumbo-ID: d988b941-c601-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TDG9eJQLD7B2HVr4adVIuOlKU16Z4nIRqeafqwlrp4yxe4fWeAE0Qnjl54h0H4n/ClFfQKNFmWU/Vn+o7AheddgADTL2W3JokuNksWRq53mqiyIWtjyMlsNsAUHZRAvGD/IAj/TyzzzwDLS6ayKdfekiwVYnLRl3DTM03XxQY24HTaYfzXeKN9zwV5kRio74iIrnb2W/+XHTujwWMdlJZ7Rb+pSN38BdCF1XkxfN1SQqUepMQqapHeNoX+IK87TqHBGam02Rz6otsXMoy0hGxJU8/rO3M7K0i6jxMs+lI7fGnqMr7VbUsUuaX1oj5vsz0z4O3FdOCtarflWHXEvKpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnDFM0XdNufK2hfUh6YAx6J7z9vdXM9v7Wi7AfxjQ98=;
 b=KfvASQUXcF4INvxBc1KpsbRNe8iF0sqfcfEB78Ap3d4yWsWTyntXKnAJJ/Tw03fd+yS/oang/da81VZNdvbJ6X/Wg0sbcbNeTjhOta+WrFX4zOYLNrnmfSRoP+26YV8Wz+e9ZTxilSHtPjwd9OSR+T4jtEl46jQGcff4uWbVJj6jyOBxTBmau1NWqcpaleHCswwKlPzM3Hv+Jayy9WVWt+6/wlqO33z3n+v8g1Lr586BCI7wS85LbKucvA4FdFCUqeA4Fhm41QoR4IlIuqpeMoSFV2EtZ88cNhtqvCN/4PErKNzc+sMEFdGjXwRq/YiXz5Zjr0pQxzjROk2TI2rzbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnDFM0XdNufK2hfUh6YAx6J7z9vdXM9v7Wi7AfxjQ98=;
 b=ik6P/St+osZohU08MlAP7jEs1x0Y2BYShM0PlNV0qd9Cbl9FosZ3A+iqFvB7tKkYM8MtkR5I/1qELP8EP94mrIOMwOxzMpRLSwb9ksJXKSdBhLYVHh6ewlw+fpOB1fA8Pk2hkFeIYJQiw+viuxhitiuvZP6wO8Mjps7ueHPwmFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: aebccca3d5444551
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJ3sU7cobiYEQ6y0zZaIuCIB5rOMCinIvfLebmm0rMEBLwfh5pNyT7ds5j77F+lcAzyLonI+6U4jB7zVDuGFBVvmViJi8wPK3hVRv0mYkIN3LDjyNcQ4P5P9G0brmzT91rS2MUGKXZJjDhm3PZRolRWDpEscUVEuLC09Wbr3+sQDEtEf93z6sAsQmEgn8iYh6XiaA3QKc+D1pre9LslTnve09DitCp9awHkDQwjP4BfNcqlG/OsBQ4KncMgonsTKUX/PRfa/aOVQoYEcLMbljAWTLMIca6W4+a+0hBHX3NdjrwAfz/pK2jSHiuGqYKJm6vATL8HU40FC2+j2kPUihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnDFM0XdNufK2hfUh6YAx6J7z9vdXM9v7Wi7AfxjQ98=;
 b=Cb4speQYZD8KRYh/43PcDeSCzhF7k7gCg0oBbqSOuQn4ipeyfCJrp0Cmdr0pZo8PROeC5RJqbWcxmn5h/hNHa6tFs2WLiTLtX4+tcOsiHmuO4tJSvHi71tEcrHcAFduatyMOi2k+sjWJV51WBleeLv2sdRsemFUhR8iP3rmxIolXFdVtHslBzha7YorpfCS8edocDsarZassl2ytBSAoG8zYKFzlX0BdcM1MY4omBgvTrBWzr6u6AkrEDE5rvwzEHMyeH/pbfaeZUqe20GdCblVwxEB7Tcy8cgYDDjnbLIecRqHnAV4P+wVU5IA4dwMKI7Ml5l0g4s5O/s5JYBUNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnDFM0XdNufK2hfUh6YAx6J7z9vdXM9v7Wi7AfxjQ98=;
 b=ik6P/St+osZohU08MlAP7jEs1x0Y2BYShM0PlNV0qd9Cbl9FosZ3A+iqFvB7tKkYM8MtkR5I/1qELP8EP94mrIOMwOxzMpRLSwb9ksJXKSdBhLYVHh6ewlw+fpOB1fA8Pk2hkFeIYJQiw+viuxhitiuvZP6wO8Mjps7ueHPwmFU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH] MAINTAINERS: add Rahul as SMMU maintainer
Thread-Topic: [PATCH] MAINTAINERS: add Rahul as SMMU maintainer
Thread-Index: AQHYWawa/Ktd+NEW1kSyeaDQHfVyLq0Dac8A
Date: Wed, 27 Apr 2022 08:12:46 +0000
Message-ID: <FBE32543-4BBC-4416-8DE5-364D3C380D0A@arm.com>
References:
 <alpine.DEB.2.22.394.2204261323430.915916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204261323430.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bb54c42b-5bf7-4e83-c1a2-08da2825bb8c
x-ms-traffictypediagnostic:
	DB7PR08MB3371:EE_|AM5EUR03FT062:EE_|VI1PR08MB3952:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3952FF817A8296ACD00E4D329DFA9@VI1PR08MB3952.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0rg6lHDrRzYDn+WsmszzkIZ8v3L1OMFGIPIacxKmoRcFxky4QvOJkgh2jLyI1fxTpDMD6YU9u3Kdt6ygb3kQYsMPZAc9J/pmtkAMCx0woAii8ssgZpD6nhgVQKT8NrjwwE2axhJ30SMw+jckZrXQ/Rvbl2EU4MqqYhlUej41F3peHAcyGQY3e3I7/lgpQzbTdmqzFQc8guDVXnME6Yn6VzXCm9Nz6kxkkxG9Z/GjA9lCPcZrblDoNWJco385EMlkufSOCysPl7bPUi2/UGg2vG0be/OfCUSEe2bGMtiHXSfIifRoM34bDiW8AZfR3klQB7CYzz888WswbuoHBOEx0TmqL83HGaistFKJsLX+mEUilSRUjiF5O+FMUMImGJZd6HhKM0NStNgPDeONgAku86BFmsiOW4Bi4Z3IJ0TFDVEUeRSubwdjeb4l9pqAFfAT5G913E0tgrVbSn4T8oJOdSDYTuTjSO1Htev1+4fQd8kRc+aXDn/v/oggj3wDC0DcRvP4WoO+eocMdtyZ7VPjtTmAw0R2sNTHEpXQDHFjkgdOwLGivUuuPXLrqYK+KVVRMWt5hi4Pxi2+6F0WO5qvemp32PimtDQ+Xh9NanYQRAMI+2CpxOahaR2Q60ezJzALhv6bnesGIjQ25xFghVUb8tjCmFrRp1M2L0SYWXb/InSl3LOOuxxzwSBeMd87Gwkm/EoGxYXuwxsH5Viq048S2ggQ1p3IrCstYbvtv/qd+ncUIRTdYgpMo1UQEZS3ID7U
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6512007)(186003)(2906002)(2616005)(53546011)(6916009)(316002)(86362001)(54906003)(33656002)(36756003)(508600001)(6486002)(91956017)(5660300002)(76116006)(26005)(71200400001)(4326008)(122000001)(4744005)(66946007)(8936002)(38100700002)(38070700005)(66556008)(64756008)(66476007)(8676002)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9AF8F93789B8047877423B25BE8EA47@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3371
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8eef5ec-db05-4c26-5618-08da2825b6ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lA2o2/dF51JY1PcOJCN1SKnz3o7z72yMXVQN1m0fH4j4Pjh7Ge8G6uUOeCgclSfXGmdQXjqZ1wjLn7Gnj4pYMlf2RIYzGV89RPL21CtpcFpOlNwAfjBZjH/MkjLmyf/+AjhSgXrSwsQLdx2I9qQ4g707v45ic8xlKBSOFOTE/WUpQ+ja3i6Ue+RfOxtwSg/W+LMddLLWRV1Wt08q1DwH2sQBwplgDA0bSmcIqiVG3N5Bl2K4YAkthfjeqsumUO5FHBsj9cdi/tFhCVMh78ouZkFChZxQ0Ej/6MQK8wddMaZ9D7SuK5Hgue99H8FSHr3jbZpME0OnlWwCWNPX0xMIwyp7IIeP6cj1iVP3i07US48nOe8EpIP5wIB2kFBKnF5RzqPuhEtsxYuanrLSHex3mQIMr6iZ3LHqzEfJvGt1vCaOfbSDxfIlQFCJyzU3oTi3poNrae7mfB3eQp7pWxRoU+CEKJVTLEQqtTLC7ieJ/DDUZcfWDLiHxLtZKtEmuLELF+yahSNStbu0uQOy51aTpjIYF7mZDbtKmJ71qjOHt6om1gMICk7Tf5/FcvPPzPK02m+bPYdiShgmAfw4LU8nLLFeJtiDMXeP/Ga4hfA/0vfszpOetAaCD4jS3v8t/ibMMMSw0keXsBzXceK1k2BZzag8/Uk5pgnwFZwdSR/sR4FQ2jA7To5+4GXk7vZUv8kD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(2906002)(6486002)(508600001)(4744005)(70206006)(4326008)(6862004)(81166007)(70586007)(8676002)(356005)(40460700003)(86362001)(54906003)(8936002)(5660300002)(36860700001)(316002)(6512007)(26005)(2616005)(36756003)(53546011)(6506007)(186003)(47076005)(33656002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:12:55.1182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb54c42b-5bf7-4e83-c1a2-08da2825bb8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3952

Hi,

> On 26 Apr 2022, at 21:27, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Add Rahul as ARM SMMU maintainer. Create a new explicit entry for "ARM
> SMMU" also with Julien which is the original contributor of the code and
> continues to maintain it.
>=20

Thanks Rahul to step up to handle this :-)


> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2a47fafe85..ba0d1c0c1b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -248,6 +248,12 @@ F:	xen/drivers/passthrough/arm/
> F:	xen/include/public/arch-arm/
> F:	xen/include/public/arch-arm.h
>=20
> +ARM SMMU
> +M:	Julien Grall <julien@xen.org>
> +M:	Rahul Singh <rahul.singh@arm.com>
> +S:	Supported
> +F:	xen/drivers/passthrough/arm/smmu.c
> +
> ARM SMMUv3
> M:	Bertrand Marquis <bertrand.marquis@arm.com>
> M:	Rahul Singh <rahul.singh@arm.com>


