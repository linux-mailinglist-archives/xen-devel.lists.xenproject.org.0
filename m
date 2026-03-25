Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKNhCpobxGnlwQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:30:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639CE329D3C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262877.1555207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5S2O-00060i-KN; Wed, 25 Mar 2026 17:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262877.1555207; Wed, 25 Mar 2026 17:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5S2O-0005yg-H6; Wed, 25 Mar 2026 17:29:00 +0000
Received: by outflank-mailman (input) for mailman id 1262877;
 Wed, 25 Mar 2026 17:28:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhklinux@outlook.com>) id 1w5S2N-0005ya-1Y
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:28:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5S2M-006k1Q-Dp
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 18:28:58 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhklinux@outlook.com>)
 id 69c41b5a-e002-0a2a0a5209dd-0a2a4505e8f0-0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:28:58 +0100
Received: from [52.103.1.7] (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <mhklinux@outlook.com>)
 id 69c41b55-5aeb-0a2a45050019-346701072f73-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:28:54 +0100
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by SA3PR02MB11069.namprd02.prod.outlook.com (2603:10b6:806:45f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:28:50 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef%2]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 17:28:49 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=outlook.com header.i="@outlook.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7niL8dK+tae6540T7P32RBaytyVW7zolF8lluf0r4R160iZvxMe8wz0w6vbYtaQIpwAjSMDr+dMe7EGtduuKqfdos64LihelGZuCCOvseUiqQzHnwIqIsGfLAquA+kP1kaJC4nC0Juoh386GRR1UboUJt1ZJpTBqskj9+q4dqEkMD+eo37Daomf0FTM/llT3T+FkOsxf6ip5NsucUlAUbbIKFudkCTIevCZSpHq1zthYC9rHMNAlt+RoZtUcQnHPGPeFUdpTQr5dFiDq9+qd6tmTeP8UAOZQdiObQLazoX5D5aGbLZORgkibaii+N6nHQuWHwzincJVMPUJAS3QKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxHfHViKfT/KJvdZf18l85ejznK+DDKKxrW5WwShbCU=;
 b=UQ+SKI6p0Uxa6vVjtOYIiFTOYBWymNEmhVqJEKQ2Ufm+ODmhzci0x2irjrsmwG64klbVF9J7sj+F2jQoHC3uAGoJ1htf8Uqhz3S0bUayiUYcr4vKyGe+wHmjOkEx2Bs9ConhKsB3+SHH7xSGCfcRuSpMJOlOXtyhPJxAKBwecZrJLzflw7mt7kQKuKe37lFnilDoVuvFx88wLp/3c8C1q9dOsSsCLXX9tPsOz9ZAYgYY6FW08a6ykjdyOCuVGAthPDR7bsWiN/7eC28/QRDASNCgLixtRiDxD1Ru8Ujfxy6iJaisNN5X6xet/Pa5o4QTajUbJcfLdjpiqUHP1Bv8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxHfHViKfT/KJvdZf18l85ejznK+DDKKxrW5WwShbCU=;
 b=GTqwa1eWCRPC2rPEJoIg/aO0mDmO8aFoToC/PtO/QThE7d3SMDxLssVR/NFejVM+Y9Hwv6sZKhwmiGQvkBk7aD6FuxiBXjz01Bs/kDXcuattVT5iNAmikOt+xf1WFvobaERn2DKK4x5pk8fOblaBeuPQUyjxzwIKEksFKdZoX5fiLRr5njHKSqVs83dhBG3WVS2NTYEAtSFViFFeDuHowwM7hPDF4Dz2V2Lr0Lgp3bgpjvIvy2j88oZDVTzm0FVKbEAsmPQKIbfjqEP3Ttr32ZNbLlCvovbwSvq6kJ/xwEg5JXYa7qwEoHLp/iqJjT5UFZvY3jw+p+xihJljvzUALQ==
From: Michael Kelley <mhklinux@outlook.com>
To: Danilo Krummrich <dakr@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, Nipun Gupta
	<nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei
 Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
	<longli@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf
	<W_Armin@gmx.de>, Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Vineeth Vijayan <vneethv@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Harald Freudenberger
	<freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, Mark Brown
	<broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, Alex Williamson
	<alex@shazbot.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Gui-Dong Han <hanguidong02@gmail.com>
Subject: RE: [PATCH 04/12] hv: vmbus: use generic driver_override
 infrastructure
Thread-Topic: [PATCH 04/12] hv: vmbus: use generic driver_override
 infrastructure
Thread-Index: AQEWuxLbDbmJwzc+SqngUlED+v4GuwG+YWLCtz2FqZA=
Date: Wed, 25 Mar 2026 17:28:49 +0000
Message-ID:
 <BN7PR02MB414825D0532A1DFE16F3B671D449A@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-5-dakr@kernel.org>
In-Reply-To: <20260324005919.2408620-5-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|SA3PR02MB11069:EE_
x-ms-office365-filtering-correlation-id: 3043ded6-cfcb-46d1-33ce-08de8a93fa3b
x-microsoft-antispam:
 BCL:0;ARA:14566002|13091999003|461199028|8062599012|19110799012|8060799015|41001999006|31061999003|37011999003|15080799012|1602099012|53005399003|40105399003|31055399003|440099028|4302099013|3412199025|10035399007|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xDdh4OAArEx6ipBroHecRSDruWPZ8ExFDTLtZ5cfbygyWS3S9xLqnFxe5s?=
 =?iso-8859-1?Q?a+ujbZc8vkR+pPBqoIu5ezFO7ZTQ0YMwUIho6WDhB8OHb5pGXMG44l5HxP?=
 =?iso-8859-1?Q?2vFoGJnVFSczIt6xeqUty9w+A0CzDDQjzi/ah2ScPaReFloPOT9u920x/Q?=
 =?iso-8859-1?Q?to6/PgXLfCt/+1NiOgPNFWZDryyzPWZlQXuPs5B9eLA0b/oJZLe55S1pa9?=
 =?iso-8859-1?Q?Y36FcKSy427n3M2rboUDjlP99+ndwk0CR6mUIm+t+dqAD2cOypVbw879Hi?=
 =?iso-8859-1?Q?XZIuNTaV1JlNfgfQ2T2w8eiG4zIyG1JIFswZ1DeYcdEYrMZauDEI7uGISt?=
 =?iso-8859-1?Q?C3RZ9ey0pFmhuctIIHxHUvs4oS968ub/ml+NRRJm6z8h+FzlC1Cp8KkCnt?=
 =?iso-8859-1?Q?voV3ynhpZRsb6Fjo7N+tiy2Vdvk+7L/rnHwk2/6toeLMDYknHd/nNjFhSG?=
 =?iso-8859-1?Q?6UyvYRI01YvAMZ6fpkCv2wF6CnAfZs0bcZJvXLDOvGsPbp93+DduaG9xGm?=
 =?iso-8859-1?Q?VNmNwcarrgCyoijB37EBaJbfXXLYpiPUrFJ2tWYHgjTmtbDt19IVmwgGcK?=
 =?iso-8859-1?Q?Gy5QSXMYKvy04YgQNa0RiQWKi0F9ECheTBwVoamVN5A/vj0XV4KGHdQgLa?=
 =?iso-8859-1?Q?3Rj1TcVwREklQpnpiFLI320GaEUL8JkxffxhJ8HUC5sPTYaKwwLKp3cj8Z?=
 =?iso-8859-1?Q?iwncBsf9WLRorbM8jkj+jKBb6zWet+qu83dQbCDgs0WXuaWTqnQTvSE5cy?=
 =?iso-8859-1?Q?+tm/BjYApvnbeiGnEbf/xCGzrXL55OcdWW0B6RY0Jadk7DyPAfgedFTiy3?=
 =?iso-8859-1?Q?3k+KbsMfO0zJWK9is3LGC1Vvoe7L9nrGWGQsOQPldv0fHlJaldowbAKDv4?=
 =?iso-8859-1?Q?9WNZYQdcXB4eG4iY0X5grHsh382uInTvK6EsWF4nsumGRenwLfI73pa7HL?=
 =?iso-8859-1?Q?cUP9jrZdOJlkwqHHyqi/bpuaH272HXE+UR5s2YocuLCK69o9dJOQXL1r4T?=
 =?iso-8859-1?Q?f9ObHjpDhoKGIUoEBowjh+YN0hrnlFaKaBaXFHhMhk4ktfvWaouBlSiRV/?=
 =?iso-8859-1?Q?QBwKb0V7oNXWC6MaKJYDN9MExgBx8a9akOy1PyhzXvSlPjBPuvT8dyKhFS?=
 =?iso-8859-1?Q?TMkVJyHhlyaWETFYlmQ4y4/joJuO/fBGf1cDUcsNn5dokg1D5e47+l7AbL?=
 =?iso-8859-1?Q?QKRZx67WyvRLZEzVfZIXyLC/h4GjRDfwqPs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mFtu/wRLMR80m+TtFnxJ48B9YizrMj6EnaIIOgVUnJ0WRooSmL4s/c64+0?=
 =?iso-8859-1?Q?BRUpvbE6jLLeEAcXqx2z4Oia+NoNpzg4qpVdbCK1F33yVfJ0zP37/uCCf6?=
 =?iso-8859-1?Q?dStD6w9DHSf0J29wLC7/fB0Iiw1A4kEzhFThe2gAQuSTaHSMPXVukYVdu5?=
 =?iso-8859-1?Q?0ZEjvHG2Mst9TO4qnhcP+dYVnrARk3WycHxGa98pqk3hMlO41QUhPYyD1S?=
 =?iso-8859-1?Q?qiMDNp3LLTXbcLVc7PkBNSzg723bKdZ9W77OvGgSz6NEe/VWl+YFcp5UXu?=
 =?iso-8859-1?Q?uWyoHtnrwG8pvZsn0GQ7kS5IyNhhZ/0CT2WlfY2vwOYM3zUkJi1WNStsrh?=
 =?iso-8859-1?Q?rEeIiWXucV3wjUiPTz/aVCxMVtn/ayI7vSFfeBMfR0D6UO1E7y2lOh+vYz?=
 =?iso-8859-1?Q?hub3yazex+VoZxOSVu39cQn/yIsTS9/T9SNsjUBnGFySpbcr4IFalfEoIo?=
 =?iso-8859-1?Q?W4yWlZVzYkmIcRmHUh3ZfHAMPQRyUImFPh1vYEa/jcoP1MDvrD9PCZICjQ?=
 =?iso-8859-1?Q?ViOywWR/g3MqPViFUdoiWfR2VlNKAKtHCqzTFtjGap7m0iH7H5Q5OLOCWa?=
 =?iso-8859-1?Q?wTgsyoosfRgaNXvKo8Blw5yxmPDzmfznJCcXqHgC+RobZac3e75k80KtCm?=
 =?iso-8859-1?Q?/ApbKF6+ybIwWQsmEbR2hNcBOa7t+ObJ8WloPHrGk3Bdp1mKuK3kQIJ49+?=
 =?iso-8859-1?Q?wmQ0tOgrN3UVjyI0mFdllicH3BNNTQQkcbVxRkGFW7MrPkCxkevIzQLH+5?=
 =?iso-8859-1?Q?N8tLzVGJXVMIl4H0Q4qgLgYLP+iPV8nHrDcJnZ6K+wpaIiULPdOS/uHLJ1?=
 =?iso-8859-1?Q?tfEdyILZHzwZrK2C2wrXMOVb2vq7gRtsLkHNMVq1lTOpJLowDRfkmaLfLo?=
 =?iso-8859-1?Q?8A+xgwdZry5BIGfYE6Q7NMsfKn+g8rIp8/yamr4R8sgTqAaWBHQESvqblI?=
 =?iso-8859-1?Q?TieTWqxSo5HJ3TDHVgkRXgC63CDxzg2dIKF1J1sKm7boa7ig7Rp84upZE+?=
 =?iso-8859-1?Q?Rs5Xq90tdKxWHNQpe29DvSEwVlQYmqVSx9LGSXuExmKIkiHKcS0Xn4z7//?=
 =?iso-8859-1?Q?lErzUgGK2FNrC9iFQzFGrg584FgJDjKQnITcprs8TI8wtoUhj+Vv8z9IM3?=
 =?iso-8859-1?Q?vFt7aNk/Y42iuZkeYSqFghCstl976KI29cqIl5P0iUo9tokW5Usfe89+od?=
 =?iso-8859-1?Q?na9qZS6uBtNnD8RDxUr2s6PkOUJQ/EhqJtxp6Kf2m2BVGLOjLK/D4E73A7?=
 =?iso-8859-1?Q?SZHPF6ZjZaVF78TnsLE8Jfcov57HBw3DxSgPk40VzlHZwuXya3ffTcEkSZ?=
 =?iso-8859-1?Q?OJ/IWTK++eEIt6tM0MpbZ31JfyDD3jp9XgyWNWJKjren3/fsE6hULgGP8l?=
 =?iso-8859-1?Q?X9qaEoQ7lAXLAsR/ksnRqKJWLh/SiBnTac7kf6PE/qG2TM4OlmzJw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3043ded6-cfcb-46d1-33ce-08de8a93fa3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 17:28:49.5574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB11069
X-purgate-ID: tlsNG-c201ff/1774459735-81F5D488-FCD1E774/0/0
X-purgate-type: clean
X-purgate-size: 4105
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86
 @vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,armlinux.org.uk,linuxfoundation.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[mhklinux@outlook.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,BN7PR02MB4148.namprd02.prod.outlook.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhklinux@outlook.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 639CE329D3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Danilo Krummrich <dakr@kernel.org> Sent: Monday, March 23, 2026 5:59 =
PM
>=20

In the patch "Subject" line, the prefix for changes for vmbus_drv.c has
historically been "Drivers: hv: vmbus:".  It's a mouthful, but has been kep=
t
fairly consistent over time.

> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
>=20
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
>=20
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]

I've tested this patch in a Hyper-V VM with VMBus devices. Did a simple
VMBus driver override, listed the overrides, and then removed the override.
All the right things happened with driver binding, unbind, etc.

Tested-by: Michael Kelley <mhklinux@outlook.com>

Modulo updates to the comments that I've noted below (and the patch
Subject line mentioned above):

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

>=20
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> Fixes: d765edbb301c ("vmbus: add driver_override support")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/hv/vmbus_drv.c | 36 +++++-------------------------------
>  include/linux/hyperv.h |  5 -----
>  2 files changed, 5 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index bc4fc1951ae1..bc8dfd136f3c 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c

[snip]

>=20
> @@ -711,9 +682,11 @@ static const struct hv_vmbus_device_id
> *hv_vmbus_get_id(const struct hv_driver *
>  {
>  	const guid_t *guid =3D &dev->dev_type;
>  	const struct hv_vmbus_device_id *id;
> +	int ret;
>=20
>  	/* When driver_override is set, only bind to the matching driver */

This reference to "driver_override" in the comment was originally to the
"driver_override" field in struct hv_device, which has now gone away. Bette=
r
wording would be "If a driver override is set, only bind ...."

> -	if (dev->driver_override && strcmp(dev->driver_override, drv->name))
> +	ret =3D device_match_driver_override(&dev->device, &drv->driver);
> +	if (ret =3D=3D 0)
>  		return NULL;
>=20
>  	/* Look at the dynamic ids first, before the static ones */
> @@ -722,7 +695,7 @@ static const struct hv_vmbus_device_id *hv_vmbus_get_=
id(const struct hv_driver *
>  		id =3D hv_vmbus_dev_match(drv->id_table, guid);
>=20
>  	/* driver_override will always match, send a dummy id */

Again, the reference to "driver_override" no longer makes sense. The
original comment is a bit opaque in its own way. Let me suggest this new
wording:

If there's a matching driver override, this function should succeed. So
return a dummy device ID if no matching ID is found.

> -	if (!id && dev->driver_override)
> +	if (!id && ret > 0)
>  		id =3D &vmbus_device_null;
>=20
>  	return id;
> @@ -1024,6 +997,7 @@ static const struct dev_pm_ops vmbus_pm =3D {
>  /* The one and only one */
>  static const struct bus_type  hv_bus =3D {
>  	.name =3D		"vmbus",
> +	.driver_override =3D	true,
>  	.match =3D		vmbus_match,
>  	.shutdown =3D		vmbus_shutdown,
>  	.remove =3D		vmbus_remove,
> diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> index dfc516c1c719..bf689d07d750 100644
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1272,11 +1272,6 @@ struct hv_device {
>  	u16 device_id;
>=20
>  	struct device device;
> -	/*
> -	 * Driver name to force a match.  Do not set directly, because core
> -	 * frees it.  Use driver_set_override() to set or clear it.
> -	 */
> -	const char *driver_override;
>=20
>  	struct vmbus_channel *channel;
>  	struct kset	     *channels_kset;
> --
> 2.53.0
>=20


