Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A777A612E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 13:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604610.942079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYum-0000ao-Bm; Tue, 19 Sep 2023 11:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604610.942079; Tue, 19 Sep 2023 11:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYum-0000YB-8T; Tue, 19 Sep 2023 11:29:12 +0000
Received: by outflank-mailman (input) for mailman id 604610;
 Tue, 19 Sep 2023 11:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kB+/=FD=epam.com=prvs=36266dbb07=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qiYul-0000Xy-1j
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 11:29:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf3575fe-56df-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 13:29:09 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JB52ct013085; Tue, 19 Sep 2023 11:28:57 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3t6r9ybe6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 11:28:56 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB10084.eurprd03.prod.outlook.com (2603:10a6:20b:628::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Tue, 19 Sep
 2023 11:28:53 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:28:53 +0000
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
X-Inumbo-ID: bf3575fe-56df-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieJ4QmfS1xy2WTpNRc9b54WaSU4GHuzJkW9od/a4IzOXoOBV7VM5spjm/wgCT4nHQL2toJb+7tA/Boy76HDDUxcyzY/kVMQCuE8NQWma5A4yibmuWjwfYnBvfcttFRQM+IEVZRygcuUsLdDEd2I9k4CxDb92u133aiuJbqwUoeNMc25h0T+EapGc3aPuB1jQP1goGCjVzlLlr4Nr/J+/4yzH0/JaLJ6MoHG6NEXzK6k8lcqyzBx+qCrMmiVj3RErSbLclThWsxZryNYpjJTjZsoYtN46kKJIrPgWCPXVqrKB1B/r71hML5sEtFg7FDqQMCH+m6jA91xwufzoUV34ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0H3frrl9g13QRlBhjKELhzhQ8gNK15RDH5chBknLJ4=;
 b=jGFn51KWeALqbshjBrRyz5R3d9rhS6xwy/2wo8bB6Dk4GNJYwvMOeOzzKAcDcpDdR1KPiuHQg0iF5oekJ+eIcoO3jy58AYADd4O2K6tQ6ydYn1Rk+MYC7PwaQEb8jmMfOxeH5ouKbPwniWHYA8WO6/eXGOUbuuCOaWkRj5HLKHs3dc1lwzfA1+JQCuHHWzn/7bnnLkVFt45cNObReY28hTVCwWs256QBgjWAyPXtRWQEHZnkLesxk3Y2y5I8qOGQxPIXvku7yHa5HlmiKtXeYICxmV2/eiZIksHglIvoV8GLczJ4euForNdhGK+1YkL+Op5/ChK0YnUShZTlt9LiEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0H3frrl9g13QRlBhjKELhzhQ8gNK15RDH5chBknLJ4=;
 b=af5q84uBXD8/uwduezc5DlyUBW+hszfgQKabbl1OLjhZNMZ4X4aZZRl1lfayuRuWtx0JXKbNIy0XASpTotxNkr1JckWX2kqMypuNSKWnQr6q4if60a3OLDRale29pVIJOLJvXeYW8MGIuJFLjPCVLM27kFAxgPGfwtGwIoNffR86cX+nRdMfJIcyHcI2G1D0EFBv0fgL6zxopXPte9xBpyH8a4XIRWZCm+6xYeam5wXSFqMoGXLdZmvHpysf3mL+DYnG6xPjscFNzgDEJzVbdxvh3yrzMRI7vVJM7u/a/8IxkF3A7WMtXaaLXcZYXl636nVxhn4AZ3dWlyX4TpsMlg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/3] ARM: ITS: implement TODO and fix issues with cache
Thread-Topic: [PATCH v1 0/3] ARM: ITS: implement TODO and fix issues with
 cache
Thread-Index: AQHZ6ux4FORtu5j2eU+vaSYICEUQjA==
Date: Tue, 19 Sep 2023 11:28:53 +0000
Message-ID: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB10084:EE_
x-ms-office365-filtering-correlation-id: 9d81a06c-8640-445e-773f-08dbb9039aa3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UPEvL8weTDQQH7T/NfYIclsa1K6pRF7BYooBihXPm6OYivvCLDxmx2cHyzweaMpM9ZSbhsiVeWuxwEIekgJtaKkPl4guP/dphTrJpeAh8ZJm61BlG+Vepch5TwLdORhR8R5sGNDSOU6VuErKXQthjX81vlWN2EMtjy09bZP9bZSCrz2uEjcFJbfSOfq6/m2OMGn6cuFjfdcDzZHbkdYbR5Iklv17ab4qZMWkiZNa6duO9C6iy11xeHMuM4izWTx5RSCC2ccgfc3WPW+29QRJLO1ngt0yLqfqeeZ3i7Q3BHJQbX29yCZjlBuun9tVep2fMSVpbE2yAB2EhcDFk6iz/eB4rUvUah+ZqyuWG/0Y2c1fHdIafpVL6Pez6ngeDZp7dRxc4snOVtuDul5FzAiz4qUt+7NnMmHw67A4EI3XBggKsB/zFmarfuURIwr/xFTQNBi7uyqDW+XLBiUSF1TX56DeTJ/HuwM7133J9P3FMSWk4Gc01TgxJgC6B9lSNKGFaL47XKf42sYSVe9lGbVUuyH9lOz66KAELvTHjnbNSHxDgIr0Jg8BjeBsc+JdMox/Y2cMUMrgEJ2DJPT20LNiiYdLWuOZ3Job7YyDxampwhFE8+NYfXSlLEE8AdDJfFxm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(186009)(451199024)(1800799009)(66946007)(6486002)(66476007)(6916009)(71200400001)(26005)(107886003)(316002)(2616005)(1076003)(83380400001)(54906003)(41300700001)(76116006)(64756008)(66556008)(91956017)(8936002)(5660300002)(2906002)(55236004)(4326008)(6512007)(8676002)(66446008)(6506007)(478600001)(86362001)(122000001)(38070700005)(36756003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DLu49/0jXt6i6hiB9iweLvoYkqFFR+GIhhIY4IOr+LdOncwGj3+OYSLZSR?=
 =?iso-8859-1?Q?HRWMHLoAEj9xgvF1NSpw97u+Lfy4ftwtkfTPcTY1c/R55vU6adr7/WHA/V?=
 =?iso-8859-1?Q?ge0SKJoFvqX6CUCPP6iHh4nQtD1ddM9W8Alhn6nXhtX8AQijgnouv3oCLL?=
 =?iso-8859-1?Q?+bDw95Pj7/Lzsq8yyw8jq0CToEfBQTQ1FVCCo8wr0aLZYlGJUU6WE9mVcG?=
 =?iso-8859-1?Q?dxluDuKz7MlTJOp6m01L8USgbWUL4T44fw5sJsy5+XRfVInA7h+6bSOYQ0?=
 =?iso-8859-1?Q?T7hhzKx8e5JOXl7sjxbemdbYkMJzuPFRCfaXHp88DSx9Oq+Rcz/KChL2ZX?=
 =?iso-8859-1?Q?5YXOSuWmXk7MZGVwGJwsVAi96IaFSpKGDwlysDpucG9RJdWGtkRxjQYGpf?=
 =?iso-8859-1?Q?JoYzGM+FBCoohLCI8qbFUw/Wy3rcEMa0yCvolPguLpusVH5XJzQ1tUZy/E?=
 =?iso-8859-1?Q?LtzA5P3fNGea6Z9U9S22fI49TRu4uPV3KrsUM9BMsa1kyJaZXLYotjIYQH?=
 =?iso-8859-1?Q?01fREsWsu6hENiQk3dSUaUYZa64QrVEAg4YBoKj06To5AM/pU9gHv0Q5yr?=
 =?iso-8859-1?Q?4oNiGJDPyZr947ElqcxOxSdcaqQSeBxdFeFAIbvn8zhXg71dGHdg1cTwh8?=
 =?iso-8859-1?Q?u7B3mc7acs3l6m8T4qx7oY4Kt89w7BPcgUzzpRdFxFj1jGP9oes/zNKHi0?=
 =?iso-8859-1?Q?qjGc6idMsI5JtSZ/dNnl31uIdWoxedFUENz7CApWfXN/IdPhdX0JOikss7?=
 =?iso-8859-1?Q?eFw6lRur1CaLokiVIWbjaXwvUCYzG6uvOkYaqwuyPDcl65V8KEovEOCkh8?=
 =?iso-8859-1?Q?qzQVzo79/GlPBtif3/Skxu4fz7f61E33PjsBs8RfBk4GKz9V+zKkwXEBEO?=
 =?iso-8859-1?Q?l/pzXADYdn8lQzBwx/ihlhCB/xXSany8SY5j901K2OSisudESRUcfaEcpg?=
 =?iso-8859-1?Q?G1RQ9kHpQ7ULF4S0q85iP+07vlo8wk08q1prHGhJgy0iMG3b4/eo7NOOOG?=
 =?iso-8859-1?Q?vqbusfeFNXwrBoN7mMzGgeOrYNXgB9q+N1TuegqDUB+3D8oIASXkeUL8uz?=
 =?iso-8859-1?Q?JgiE7e5zp2No4GJilefdyiZo+ZnnO2w52QKPcc5etCinc1fIedmMwGhpRc?=
 =?iso-8859-1?Q?aV2U2Nf6dpTaiX2Yu0hXowZ2p6LjTTDHkZG5q57ua8w0Bg1K1Zdd+KBf4S?=
 =?iso-8859-1?Q?b4EV1feS0KZx5fawW0VLEUENehMSk9Q/zshKKyfYoRui/VZiMU6wpWhTjS?=
 =?iso-8859-1?Q?rWAAUB2M2KHVWasR2ugWLS9CZZDPCa+TX/m9J4y0NXB7a0i7k0HjGxVSOS?=
 =?iso-8859-1?Q?vGpsGcTz9dYVRGeTLZEc0eEmST0rXl6zMUe13p/BYoI8nrM7By0PO9ar8q?=
 =?iso-8859-1?Q?qV3qQDVi6UvJM7E/qVBJaVUUNenaUAojh97t8YTVEc/HrxaK0E3RIctySx?=
 =?iso-8859-1?Q?ngvRA8yd5MRZ0PoxfwMP9iB2DUToPG2otwu6u0JvcblzCzWMXJHvlT7juQ?=
 =?iso-8859-1?Q?BCVVYeTAOeb2qqpTLD0d9YvcgNbjqNS7TdMEE3QJn076G0qxbVjumgs81j?=
 =?iso-8859-1?Q?qzF39VU2XOCMZmV74eoJYcWI/T5qD3NL1RDzqKzkb1tWJCpQ8X8zBIafy8?=
 =?iso-8859-1?Q?Urd8+gyDzQlzkbt8izQH3cVwyc2ntC3qXryOibAdih+hFhhylyfRIJZw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d81a06c-8640-445e-773f-08dbb9039aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 11:28:53.3456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bi4dyUnFkmJ+D9xm8lRaQeeWzkhJQmpQBEjNIrhorahAhSXkkcFGqvD4yYmEn9YtJZWJsBKSQ14NgmAa764hNre/6QuCCzOh4o96LNkdCYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10084
X-Proofpoint-ORIG-GUID: CAkP-c2AXg_QKyXymFbOk9zzPkM_k72Z
X-Proofpoint-GUID: CAkP-c2AXg_QKyXymFbOk9zzPkM_k72Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=678 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190097

Hello,

There were a couple of issues with GICv3 ITS implementation in
Xen. From user perspective it looks like no interrupts are
delivered. I observed those issues when experimented with SR-IOV on
Renesas S4 board. In my case it wasn't a 100% reproducible issue, so
it took some time and couple of tries to fix it. I wasn't sure if my
fix addressed some hardware quirks of S4 board or it was a generic
solution, so I postponed publishing of it.

Later, Stewart Hildebrand had very simmilar issues with his setup. I
shared those 3 patches with him and they fixed his issue as well. So,
I believe we need those changes in Xen mainline.

Second patch ("ARM: GICv3 ITS: do not invalidate memory while sending
a command") is not strictly required, as it just provides a small
optimization, but I believe it would be nice to have it in the code
base.

Volodymyr Babchuk (3):
  ARM: GICv3 ITS: issue INVALL command after mapping host events
  ARM: GICv3 ITS: do not invalidate memory while sending a command
  ARM: GICv3 ITS: flush all buffers, not just command queue

 xen/arch/arm/gic-v3-its.c             | 27 ++++++++++++++++++++++-----
 xen/arch/arm/include/asm/gic_v3_its.h |  2 +-
 2 files changed, 23 insertions(+), 6 deletions(-)

--=20
2.42.0

