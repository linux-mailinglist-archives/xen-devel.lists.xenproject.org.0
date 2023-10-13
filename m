Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C47C8F9B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 23:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616904.959229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrQ65-0003Lv-31; Fri, 13 Oct 2023 21:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616904.959229; Fri, 13 Oct 2023 21:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrQ64-0003K0-WE; Fri, 13 Oct 2023 21:53:29 +0000
Received: by outflank-mailman (input) for mailman id 616904;
 Fri, 13 Oct 2023 21:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A4Z=F3=epam.com=prvs=465081a231=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qrQ63-0003HM-J2
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 21:53:27 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee7b92ab-6a12-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 23:53:24 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39DKQRN5014316; Fri, 13 Oct 2023 21:53:22 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpt07kany-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Oct 2023 21:53:22 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8903.eurprd03.prod.outlook.com (2603:10a6:20b:5bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Fri, 13 Oct
 2023 21:53:17 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.047; Fri, 13 Oct 2023
 21:53:17 +0000
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
X-Inumbo-ID: ee7b92ab-6a12-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NU6S3w39L/TbxzPMaj7b6Ocd2i2fDuWli/Fpm8DM7U6PfRuNYBNjFOZAEr2BMCBnd+fJ4CBi5b2nH1Mo08SU4/27T0oxxqOmosr+200LxFPiNloyRS6am7LatgT1zpeyn8qihxVFWup2lSg+wd8ElHTY8greNMQRRkw2ts96A/8dor1cxnD2hkpawJSrQW39zmTuXGh2/QAJaF3qCaaqkPZ1fWXyv3is3aI5Y+cQfi4+IfZHyo0jMYBAAYsUyMDrYNkKx8RDkr4iHELOu3BbtDUhEU0zVNdsKDkkrlfzjc5D37CA54V+km0C4qTe4ua+uMo8fxaoV2PtuBA611niTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkDXv62vU7QOL51zrmxi5pP444Uf8Z4Ol+Y4bvu161c=;
 b=dpepRbpzni7kIDO8LfwGB2aSpe6y1i/uZn8XdnWYPQqHi3jfLREKgAwk1ligeU18OVlDCD69ezPss2Cf2jKn/pHzB0ZTmOCgE6zZwKX4ssECVHsH98T0f3kcbmUHprIYg519aoKAIXSZTXCiLHQzuQQzKtf/6YlM+5yxE2kcfzuxOtbTsLEvgNWKoVtLphTkG0XOcU8IjuR6NAXoTPBGPOenDoR+u1NCftnwQzyFPxaIk40Le5wRELDfhHeqy+zQ3F6mbG+aZaiOjpNY1jmRWAyBWhOvyii4Yd6UOAVzEC8XMKOKkJA8r9NjkeY9nGUhJ4ICp67iVflY4mDgv04A/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkDXv62vU7QOL51zrmxi5pP444Uf8Z4Ol+Y4bvu161c=;
 b=BCSgErXY9bRPwoGhWNrQA4nvhoSVW9hf61kaIin84SBCjwv7si+D5iEc4f+WKgP9CQIldjkykXkIc2lnZvS1McfqM3+RiJYaJQMqqV4Gl3oUE648vZd1rHsttczDn4N1/zxxcjtdOsNC4ArtvO6WJ7sheqE9D3AUsL9lPGBQLcd/1DDflF5rmRt+Dv2hCYSIQXqjkHYsw+IJ6jKzEe63h2QJ1aoFVJlFEans+gCEZvlW3HElfVjDUqf04gIAoEgU5w3u0Lf0Z2McrOjyqhIMBHtSzGU+Vtzc6djS1gDbKgWa8pBabv4xSzzsYTYjGsSottSb8266la0uVqiZr8dN0w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHZ/Vi+sHqpo/XMzUSHL9PkKFM5oLBIRGIA
Date: Fri, 13 Oct 2023 21:53:17 +0000
Message-ID: <87r0ly6vg4.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-13-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-13-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8903:EE_
x-ms-office365-filtering-correlation-id: 961c878e-e2ec-4dfe-9bff-08dbcc36ceac
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CsKe0jMupCmSoDwixHsrgjVjxQ2KVR9fuMbu3etwqo9wRnLj1Ze2fELV8T+lwFGk4F6VftGva9FZfndAnV8YIxH5uWkrU5zECy0aPE5oIUFjgpxm7Kun6Q/qkIcx7AlZHKemkTDiSXL7PoCmjLEOQxNL3UkIojuqwv+r4802c5U6db1MHHNdm4AhL0O5B4j+S1x+cHOs0l7u5BcSampv+L4l33OI6FigueoYmPAyagbAP5YxGNdWcEreA3YFcPzDsvplP21b8eTgBf4MnISK2UTpotrQT0mCr7uArWqZA0WTPhxMZG82CrgmfYKP1SGU6ZFBybQn6avcKAIfrUPhYQEupcK7zYwiA+sHJ1w3Y3YJwGNBpxkkFrDRJj9bhZ50I+ZLCxyoJtxXh4RO3rRc2vksIrkcwS0wux360t1Xt+Hk350bnS1iHZXmFXHy4Q6ugM1NNIkXhXiQg3QXsdHlYU7O9OybPD2zbpLHpnOau2ikmqqTB/rKT7ZGdS7d1yDnH52zSOSVzao1OVoWBEH3iB3t33/WF9Tr9IFztNPlQfZrGIJ00LNd86O+w+kc2J83OHzxM8R3aqoW2rk0wdUoN2OPJAH1OugCpebcO5OnF1EolCAK/2QjU5kmp1JEkXU9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(8936002)(6862004)(8676002)(4326008)(71200400001)(6506007)(76116006)(66476007)(66446008)(64756008)(6486002)(37006003)(54906003)(91956017)(6512007)(66946007)(66556008)(38070700005)(478600001)(55236004)(26005)(122000001)(2616005)(5660300002)(83380400001)(41300700001)(316002)(2906002)(36756003)(6200100001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xr1U4uqYswWmJKbEUe1X8jwUFjDWPx6uvMXjXWPPVlr5Fn1RWHUJQ0gF+n?=
 =?iso-8859-1?Q?HdfsOT8j3xBEE5CFwwh/LU+6oV6ATZBlkTChxj/vE+39tJrHxenU4vVLCT?=
 =?iso-8859-1?Q?gNshAITua54Y5gtge3h60v1parEsnS0rclBg9KZuFn8kZLfa7PHc3BJ3xe?=
 =?iso-8859-1?Q?Ok0j6/tLQlz4L0Fdn8McJLIFRxo62bqV3rkKwU1zVjjTUpnlDCaiyBtCqt?=
 =?iso-8859-1?Q?f/pFcS2Z0OARp5T6N2KevGAi9qLhsuzOBJHbzPz4ACfTQvkGVcbM5O1p51?=
 =?iso-8859-1?Q?mYDYPeJX8WHsmpn3Kbo4t53zs/cwJOdkCSxJus/wvbOZUpTXMISp6fRhT5?=
 =?iso-8859-1?Q?5hex9On1igi5XrKUFrBfPkkhL79AgnE4C1i/xdnJbm75EAt/DfpEuQrfXL?=
 =?iso-8859-1?Q?bxykFsi3YNzHQQQgqwmFD4NULZmwelw2tubs7dCk6qfiCNL0Tnbza2S3fs?=
 =?iso-8859-1?Q?6fHU5pCHmuwr3wh6n6knsuYX8/yA6PKWu4J0kQShtoMTikFFfA8YqnRuD0?=
 =?iso-8859-1?Q?5Tug1UjZ/RCHObfxL049GhJpcGCXPH+dozUR32SrDpzaPeOMsvzUIcaxKF?=
 =?iso-8859-1?Q?I0YgHbgNXm+JwzVh1AB01MBYcSC5Cu2w2PKRyHDouvnxDUxuViLwiiUaQ/?=
 =?iso-8859-1?Q?tvbVv3pSfQFfYnR4SISPCVFS1cUnUr6OOahXHEJtJkN7rtkcV00slmYIjm?=
 =?iso-8859-1?Q?rSBA6nZ1HaSNtAUnLt8tdbYZq+UdF1z0kyRwMUgDEbEwj3Dl6spPu7F3RA?=
 =?iso-8859-1?Q?Gghoh7OZ6gVzSFIR3wi25fdBUW4FQYzNP3UCEMgVISnU4hlfrwNOFb06IM?=
 =?iso-8859-1?Q?y0exdIpa6m1K7PKE2z1Gh93SE1/Tvi2JxUThKE/87uBwjjwRNWUf0SM8WH?=
 =?iso-8859-1?Q?GECdSw9jfox54HBakNwodQSzNV+Sz+v+RxBZ7tCN98EAVQARcY0pWFc0pY?=
 =?iso-8859-1?Q?Nlmq1yRG4nugP+h22Vs6MQI//Xt4AkoaFAjlbBF92wSopXmkEPWvUPXYhY?=
 =?iso-8859-1?Q?kZwAJdXZdkGYpjjKmbo3FQguoq6QqMmt8S3E7gRhi72cj7WMGW2OYFiioE?=
 =?iso-8859-1?Q?yJWiB7XxB+qilfmg1Ozmm9lPJmYGh23NKhanuskV1nJf5UoRo4HXYCf0Qr?=
 =?iso-8859-1?Q?MaJm+1sbM9xSN3etlxf3a/JFMhVh/lwa1ZMacIlNh953Un30X71l2nzm2W?=
 =?iso-8859-1?Q?5FXqI0zyzFn73x9QOAwuWX9Hsonm0chApS1xf5zHyQRrGzQao2JjnTRDL4?=
 =?iso-8859-1?Q?PU21tENOCpETe9xESGupvO9Q3kY7RYWQDSi+FcQnCx2XoxAxEphpRMoyxo?=
 =?iso-8859-1?Q?DiD4k/CQJ/HVXt/7Wby1hBYfXkm9Toe+i+eN0fPQ12Kq46LriuaqLiJelt?=
 =?iso-8859-1?Q?Yrw2n36TYsDIoE2LzT0i5FSYIVJe4DUAUUtmBOobkfksxtBVX6xgZWOHQx?=
 =?iso-8859-1?Q?ZxpOHQ8RsLsxG8neyMiZIZG2rL80i5FeIgUsgi67znryqy+nGuMnv6rfPx?=
 =?iso-8859-1?Q?QEL/drkzt9MZ/iLYbYp0kfMRszl1WT4NyKXDMxQdB1yFMz9QGP7RV6+KX2?=
 =?iso-8859-1?Q?g5nxAAfM1rkQ2IBiFO8gf/Jrk7os/krCECroanstSsZf0BgBphszkItL++?=
 =?iso-8859-1?Q?tjAUXpF5/cCZTE32BVn3eLCE4dNLWtRJQ53+WOl9pXotHvcI6I7Gxesw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961c878e-e2ec-4dfe-9bff-08dbcc36ceac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 21:53:17.0538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/dI5LwLcMpAg+xCDoCekKTyYvBai3VopCe9wFo+tYxsqmQH+wFPXtDN39GZedo7tzu1YAyCybgtBHNBms2icKmi6c27U8lSCwS92iUa6VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8903
X-Proofpoint-ORIG-GUID: Sh8Ht7mX0bHKbH9DvRuhR3OCshz_pxwq
X-Proofpoint-GUID: Sh8Ht7mX0bHKbH9DvRuhR3OCshz_pxwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130190


Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> writes:

> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
> guest's view of this will want to be zero initially, the host having set
> it to 1 may not easily be overwritten with 0, or else we'd effectively
> imply giving the guest control of the bit. Thus, PCI_COMMAND register nee=
ds
> proper emulation in order to honor host's settings.
>
> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> Device Control" the reset state of the command register is typically 0,
> so when assigning a PCI device use 0 as the initial state for the guest's=
 view
> of the command register.
>
> Here is the full list of command register bits with notes about
> emulation, along with QEMU behavior in the same situation:
>
> PCI_COMMAND_IO - QEMU does not allow a guest to change value of this bit
> in real device. Instead it is always set to 1. A guest can write to this
> register, but writes are ignored.
>
> PCI_COMMAND_MEMORY - QEMU behaves exactly as with PCI_COMMAND_IO. In
> Xen case, we handle writes to this bit by mapping/unmapping BAR
> regions. For devices assigned to DomUs, memory decoding will be
> disabled and the initialization.
>
> PCI_COMMAND_MASTER - Allow guest to control it. QEMU passes through
> writes to this bit.
>
> PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
> access to host bridge that supports software generation of special
> cycles. In our case guest has no access to host bridges at all. Value
> after reset is 0. QEMU passes through writes of this bit, we will do
> the same.
>
> PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
> to be generated. It requires additional configuration via Cacheline
> Size register. We are not emulating this register right now and we
> can't expect guest to properly configure it. QEMU "emulates" access to
> Cachline Size register by ignoring all writes to it. QEMU passes through
> writes of PCI_COMMAND_INVALIDATE bit, we will do the same.
>
> PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. QEMU passes
> through writes of this bit, we will do the same.
>
> PCI_COMMAND_PARITY - Controls how device response to parity
> errors. QEMU ignores writes to this bit, we will do the same.
>
> PCI_COMMAND_WAIT - Reserved. Should be 0, but QEMU passes
> through writes of this bit, so we will do the same.
>
> PCI_COMMAND_SERR - Controls if device can assert SERR. QEMU ignores
> writes to this bit, we will do the same.
>
> PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
> transactions. It is configured by firmware, so we don't want guest to
> control it. QEMU ignores writes to this bit, we will do the same.
>
> PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
> enabled, device is prohibited from asserting INTx as per
> specification. Value after reset is 0. In QEMU case, it checks of INTx
> was mapped for a device. If it is not, then guest can't control
> PCI_COMMAND_INTX_DISABLE bit. In our case, we prohibit a guest to
> change value of this bit if MSI(X) is enabled.
>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> In v10:
> - Added cf_check attribute to guest_cmd_read
> - Removed warning about non-zero cmd
> - Updated comment MSI code regarding disabling INTX
> - Used ternary operator in vpci_add_register() call
> - Disable memory decoding for DomUs in init_bars()
> In v9:
> - Reworked guest_cmd_read
> - Added handling for more bits
> Since v6:
> - fold guest's logic into cmd_write
> - implement cmd_read, so we can report emulated INTx state to guests
> - introduce header->guest_cmd to hold the emulated state of the
>   PCI_COMMAND register for guests
> Since v5:
> - add additional check for MSI-X enabled while altering INTX bit
> - make sure INTx disabled while guests enable MSI/MSI-X
> Since v3:
> - gate more code on CONFIG_HAS_MSI
> - removed logic for the case when MSI/MSI-X not enabled
> ---
>  xen/drivers/vpci/header.c | 44 +++++++++++++++++++++++++++++++++++----
>  xen/drivers/vpci/msi.c    |  6 ++++++
>  xen/drivers/vpci/msix.c   |  4 ++++
>  xen/include/xen/vpci.h    |  3 +++
>  4 files changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index efce0bc2ae..e8eed6a674 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -501,14 +501,32 @@ static int modify_bars(const struct pci_dev *pdev, =
uint16_t cmd, bool rom_only)
>      return 0;
>  }
> =20
> +/* TODO: Add proper emulation for all bits of the command register. */
>  static void cf_check cmd_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *da=
ta)
>  {
>      struct vpci_header *header =3D data;
> =20
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        const struct vpci *vpci =3D pdev->vpci;
> +        uint16_t excluded =3D PCI_COMMAND_PARITY | PCI_COMMAND_SERR |
> +            PCI_COMMAND_FAST_BACK;
> +
> +        header->guest_cmd =3D cmd;
> +
> +        if ( (vpci->msi && vpci->msi->enabled) ||
> +             (vpci->msix && vpci->msi->enabled) )

There is a nasty mistake. It should be
                (vpci->msix && vpci->msix->enabled)

> +            excluded |=3D PCI_COMMAND_INTX_DISABLE;
> +
> +        cmd &=3D ~excluded;
> +        cmd |=3D pci_conf_read16(pdev->sbdf, reg) & excluded;
> +    }
> +
>      /*
> -     * Let Dom0 play with all the bits directly except for the memory
> -     * decoding one.
> +     * Let guest play with all the bits directly except for the memory
> +     * decoding one. Bits that are not allowed for DomU are already
> +     * handled above.
>       */
>      if ( header->bars_mapped !=3D !!(cmd & PCI_COMMAND_MEMORY) )
>          /*
> @@ -522,6 +540,14 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
> =20
> +static uint32_t cf_check guest_cmd_read(
> +    const struct pci_dev *pdev, unsigned int reg, void *data)
> +{
> +    const struct vpci_header *header =3D data;
> +
> +    return header->guest_cmd;
> +}
> +
>  static void cf_check bar_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *da=
ta)
>  {
> @@ -737,8 +763,9 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      }
> =20
>      /* Setup a handler for the command register. */
> -    rc =3D vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_=
COMMAND,
> -                           2, header);
> +    rc =3D vpci_add_register(pdev->vpci,
> +                           is_hwdom ? vpci_hw_read16 : guest_cmd_read,
> +                           cmd_write, PCI_COMMAND, 2, header);
>      if ( rc )
>          return rc;
> =20
> @@ -750,6 +777,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( cmd & PCI_COMMAND_MEMORY )
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEM=
ORY);
> =20
> +    /*
> +     * Clear PCI_COMMAND_MEMORY for DomUs, so they will always start wit=
h
> +     * memory decoding disabled and to ensure that we will not call modi=
fy_bars()
> +     * at the end of this function.
> +     */
> +    if ( !is_hwdom )
> +        cmd &=3D ~PCI_COMMAND_MEMORY;
> +    header->guest_cmd =3D cmd;
> +
>      for ( i =3D 0; i < num_bars; i++ )
>      {
>          uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 2faa54b7ce..0920bd071f 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,12 @@ static void cf_check control_write(
> =20
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /*
> +         * Make sure guest doesn't enable INTx while enabling MSI.
> +         */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);
>      }
>      else
>          vpci_msi_arch_disable(msi, pdev);
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index b6abab47ef..9d0233d0e3 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -97,6 +97,10 @@ static void cf_check control_write(
>          for ( i =3D 0; i < msix->max_entries; i++ )
>              if ( !msix->entries[i].masked && msix->entries[i].updated )
>                  update_entry(&msix->entries[i], pdev, i);
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);
>      }
>      else if ( !new_enabled && msix->enabled )
>      {
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index c5301e284f..60bdc10c13 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -87,6 +87,9 @@ struct vpci {
>          } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
>          /* At most 6 BARS + 1 expansion ROM BAR. */
> =20
> +        /* Guest view of the PCI_COMMAND register. */
> +        uint16_t guest_cmd;
> +
>          /*
>           * Store whether the ROM enable bit is set (doesn't imply ROM BA=
R
>           * is mapped into guest p2m) if there's a ROM BAR on the device.


--=20
WBR, Volodymyr=

