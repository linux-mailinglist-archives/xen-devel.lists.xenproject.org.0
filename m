Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321345915C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 16:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228977.396270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBC8-00087M-0g; Mon, 22 Nov 2021 15:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228977.396270; Mon, 22 Nov 2021 15:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBC7-000855-TS; Mon, 22 Nov 2021 15:25:23 +0000
Received: by outflank-mailman (input) for mailman id 228977;
 Mon, 22 Nov 2021 15:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AbN=QJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mpBC6-00084z-01
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 15:25:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67835c4a-4ba8-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 16:25:21 +0100 (CET)
Received: from AS9PR06CA0362.eurprd06.prod.outlook.com (2603:10a6:20b:460::9)
 by AS8PR08MB6405.eurprd08.prod.outlook.com (2603:10a6:20b:332::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 15:25:10 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::3e) by AS9PR06CA0362.outlook.office365.com
 (2603:10a6:20b:460::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 15:25:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 15:25:09 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Mon, 22 Nov 2021 15:25:08 +0000
Received: from 0d6075d5e7bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 014CA201-BE8C-46B3-AD89-D1478980A1EA.1; 
 Mon, 22 Nov 2021 15:24:57 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d6075d5e7bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Nov 2021 15:24:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3493.eurprd08.prod.outlook.com (2603:10a6:20b:4a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 15:24:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 15:24:53 +0000
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
X-Inumbo-ID: 67835c4a-4ba8-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/jeV2nVYiJlFJ2o4bq2JF21N2qE9VVCkWudOQCYdJQ=;
 b=c3gBcwBFCWxZvSZPzlC4aXOgGwiBeeCVixYSsXTra/ZBv2l3hLFEDAaiB+IoMhRhTB6PfUkXuMXKV9oWKQy4MPidBMKt+PBvyQjeRT9lxV+VYDvprEcf7CHZ+wh/DZSTz+4a9fUqSUuyVsOXoVYM8JHNESWHQdQEc50QmjGMOwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 159cdd01445732b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca3BYX8MzsTwmpOnWsOinFvKUHdR9fCvu/UkusytfI1DIbzNwvcIxCJoOljEU+Rc0x9EvXtf4+Mu9MFiVNR0qTxr1KUXiuM/4gYLnudO2E+7+GNu5GMJ+4dFqaq1/yGrhOVglfy+/S5afqaQdvKQM6yN5BDUShjqyMhx/YS1LXK0z+LVka1pfriYsztPNCVoXHfkb02P1i+Jinzr6pssB3xM0NKRLTe+dDFqk3bGrRdAkkQAc+GoSiBYgGJ2w8sWgAjOHGovxosRjQbFY5ykV0v2DioN4x+aVdQowc9PKuc7wNmPeaU/gpwzBdekjFozqEEGFtzBTy1vBaJ7vce+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/jeV2nVYiJlFJ2o4bq2JF21N2qE9VVCkWudOQCYdJQ=;
 b=Il4M1tFYZtY+0wxqNLx9WlXlV1kPOhCerZ+RD6zfnNGcpotOCXv3xFFizhU/suTCn77itT6Z+IOwQ78t5J4oks2TzQI+EknQDWhQwlIYRLHfaTGd2fGgvOLjhAlmal8XkB361ywn33gx5SYgUtJp/uotov9DhMNa9r4qw2FCoWcSRyv0WmKdxljf1jft+TUnTsec80N1cXdiTXD8iIiGNQ+6IycM+Eb0V67TSVjbDCXPuaFjqk7YMG/TNl8Et9MqWvYmm0AiixM422/7oZdNhEzb2v2CqR/OGopTexiOvy0XNNaTT+i0wL8XZjzt4wOrsoVgcjtqk5ArcuMUUltpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/jeV2nVYiJlFJ2o4bq2JF21N2qE9VVCkWudOQCYdJQ=;
 b=c3gBcwBFCWxZvSZPzlC4aXOgGwiBeeCVixYSsXTra/ZBv2l3hLFEDAaiB+IoMhRhTB6PfUkXuMXKV9oWKQy4MPidBMKt+PBvyQjeRT9lxV+VYDvprEcf7CHZ+wh/DZSTz+4a9fUqSUuyVsOXoVYM8JHNESWHQdQEc50QmjGMOwk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Penny Zheng <Penny.Zheng@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v3 10/10] xen/docs: Document how to do passthrough without
 IOMMU
Thread-Topic: [PATCH v3 10/10] xen/docs: Document how to do passthrough
 without IOMMU
Thread-Index: AQHX2rPE6jU0b09b40CkiSaHEA3wwKwPtMqA
Date: Mon, 22 Nov 2021 15:24:53 +0000
Message-ID: <A89A623B-BC2C-4150-A5E8-A8B72AA566D3@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-11-penny.zheng@arm.com>
In-Reply-To: <20211116063155.901183-11-penny.zheng@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 97283072-aab2-454b-0b97-08d9adcc454d
x-ms-traffictypediagnostic: AM6PR08MB3493:|AS8PR08MB6405:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB640510BA58F34644BCE4D61F9D9F9@AS8PR08MB6405.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EP8hR+Gi/2WYp0vKDKB9TKam2D7oohcYKkTTIlCi6P01mwSP3VV7reXJ9NG7zls13AVfqBeNReHguUFZJHxMrznDBG7sfVnWU7X5+SpvdP3TOZAtU8JDHrP/I9g5ywKFFHFWLLrV8QzjctpkSzZqaKnUIcFFswfcEHavFjDlf4W7zDQjsgqpB2cCaFRLP6VUsJenLryP+WaBUE9HpzAqJFBH1fglMZjWdNm8Rge+AF12LVCURCZm87VvvOMYNiSVvyPYhp9vCGn+OT3bMRxXy0ybxeDuMcmKcX9ommgz7tQUWKDXB0P5hKOCxtTgJlgpsISGXi0Zy8AkdRyldtOPhNDwROgJEXE/tC85ERU9E0kqIl3J4nfERgFg5lWSL914TlV66yIXUsXEU3iaPa7imWpA1Hntt5SBlJiJUfrmmu66a3GWS/2HiLIq1oQGD7yZbcS6159W53nxmI/gKHyGsta51qp9mpyHmkyBfKObiYoN8k0fMdecY0UHwSGRFp/AgxZafqdGPaCvpchxRYP/eehzsc2MqHZSEA6XrxHKkrnBhVQq33gBtKMYtY+bc/binKvhhy+j0HuLM88oxUEBnSpaYrjYjoYZVVVmyf1+Rg+IJJe8sN3R84Q6hqkBWnRmnKAARCiLPMuBqLD7/dzMQW5AjyLY8Es2s5b5sF2us3Q7ir5pV1UEemuiL0FAGB1De8jEf/dcTd00LR99zAvY4Gam34VHa4Sbq00arxqTtB4uTlvKQDYf9eMs+fGQeUeB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(38070700005)(86362001)(53546011)(66556008)(83380400001)(66476007)(4326008)(64756008)(66446008)(33656002)(38100700002)(36756003)(508600001)(122000001)(5660300002)(6862004)(2616005)(8676002)(2906002)(91956017)(76116006)(6506007)(6636002)(66946007)(37006003)(54906003)(6486002)(26005)(316002)(186003)(6512007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3746683BE6DB904BA59977C7721E2A5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3493
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f17afa1-d688-4565-62d2-08d9adcc3bb6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iIqeEnmKuXTw/UjNmRkNMIkN7ufLY8j711Ppx4NrA8tHm3ApdIMQxxsJoM70Di4GyUQ/1WiMl/JLZF2HiO5WTB19mHttEGZSBuFvcDFT4LUZ34zRe4qG4p9EF8DP/WE6nHA7JH76hLZVAPVGzFHT62956fjnpKmQ+ABfvlrIHocrtOeiiZ6XbEcoKIG2FcSZAwwbqqSD5d08YRe8SAW8Qw4KRFLwE9zExpTxNs1hk4OLWgA5w45agnebusDN3wKAFYcgEQNeTfX0pGPud+R3pVPicN4tk1kbIT952Rbx0PW07F1q+HGtqkSLVhWo95cnopjL1J53GzY8je28wOG05St23G6s+fG+It1M1Dihn40SvEGnXNn2uw0S8pNjF1kRPB/4GC55/awHLju/qz3HO/tblGQwTMehfNdkbh8MXlwPjluf1A3h7YuJGw+jKd+1ysjnXZn2QU9gg/R30sxXsfHIgRm0NnykRnm6P0J0ubvZ3b024IDxzfyYqiZfiAATSpAJ8KD8t5hjZzQoMevzKOVDeLZRQaUL7MPGB9EMEwnZxYTbh3HnngUWvHqrBfoAja4mwgEzcDkjpL7MAZ6sZJNEWwlm3vcAqYZurU9l9z6J/zmmOFshxPINH2y2amoaAgQ/ns78krXVvNiRlDdbboE5a9u5RCO2bKq8CNSoSTdNszmIQdulkCqncg5rdyyFVKxT9jz0qGESyim4v2EfMQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(6486002)(336012)(82310400003)(6862004)(37006003)(5660300002)(2616005)(316002)(36756003)(356005)(83380400001)(70206006)(81166007)(6506007)(186003)(26005)(33656002)(8676002)(8936002)(6636002)(4326008)(86362001)(53546011)(54906003)(2906002)(47076005)(36860700001)(6512007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 15:25:09.6167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97283072-aab2-454b-0b97-08d9adcc454d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405

Hi Penny,

> On 16 Nov 2021, at 06:31, Penny Zheng <penny.zheng@arm.com> wrote:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> This commit creates a new doc to document how to do passthrough without I=
OMMU.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> docs/misc/arm/passthrough-noiommu.txt | 52 +++++++++++++++++++++++++++
> 1 file changed, 52 insertions(+)
> create mode 100644 docs/misc/arm/passthrough-noiommu.txt
>=20
> diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passth=
rough-noiommu.txt
> new file mode 100644
> index 0000000000..3e2ef21ad7
> --- /dev/null
> +++ b/docs/misc/arm/passthrough-noiommu.txt
> @@ -0,0 +1,52 @@
> +Request Device Assignment without IOMMU support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +*WARNING:
> +Users should be aware that it is not always secure to assign a device wi=
thout
> +IOMMU protection.
> +When the device is not protected by the IOMMU, the administrator should =
make
> +sure that:
> + 1. The device is assigned to a trusted guest.
> + 2. Users have additional security mechanism on the platform.
> +
> +This document assumes that the IOMMU is absent from the system or it is
> +disabled (status =3D "disabled" in device tree).
> +
> +Add xen,force-assign-without-iommu; to the device tree snippet:
> +
> +ethernet: ethernet@ff0e0000 {
> +	compatible =3D "cdns,zynqmp-gem";
> +	xen,path =3D "/amba/ethernet@ff0e0000";
> +	xen,reg =3D <0x0 0xff0e0000 0x1000 0x0 0xff0e0000>;
> +	xen,force-assign-without-iommu;
> +};
> +
> +Request 1:1 memory mapping for the domain on static allocation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Add a direct-map property under the appropriate /chosen/domU node which
> +is also statically allocated with physical memory ranges through
> +xen,static-mem property as its guest RAM.
> +
> +Below is an example on how to specify the 1:1 memory mapping for the dom=
ain
> +on static allocation in the device-tree:
> +
> +/ {
> +	chosen {
> +		domU1 {
> +			compatible =3D "xen,domain";
> +			#address-cells =3D <0x2>;
> +			#size-cells =3D <0x2>;
> +			cpus =3D <2>;
> +			memory =3D <0x0 0x80000>;
> +			#xen,static-mem-address-cells =3D <0x1>;
> +			#xen,static-mem-size-cells =3D <0x1>;
> +			xen,static-mem =3D <0x30000000 0x20000000>;
> +			direct-map;
> +			...
> +		};
> +	};
> +};
> +
> +Besides reserving a 512MB region starting at the host physical address
> +0x30000000 to DomU1, it also requests 1:1 memory mapping.

If the guest has some reserved-memory in the device tree, those will not be=
 handle by Xen for DomUs.
I think it could be a good idea in the documentation to mention that any re=
served-memory required must be assigned using static-mem to the DomU.

This could take the form of a comment or a warning in this document.

Regards
Bertrand

> --=20
> 2.25.1
>=20


