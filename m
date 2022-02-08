Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B74AE03E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268494.462364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmr-0006oE-Qa; Tue, 08 Feb 2022 18:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268494.462364; Tue, 08 Feb 2022 18:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmr-0006ga-Ib; Tue, 08 Feb 2022 18:00:21 +0000
Received: by outflank-mailman (input) for mailman id 268494;
 Tue, 08 Feb 2022 18:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmp-00068K-Mc
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:19 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f92136b3-8908-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 19:00:18 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EglcD011879;
 Tue, 8 Feb 2022 18:00:11 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3s7e998g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:10 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI1PR0302MB3327.eurprd03.prod.outlook.com (2603:10a6:803:1a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:04 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:04 +0000
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
X-Inumbo-ID: f92136b3-8908-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAv5KCxoc/1kZCawGU4k0QB5b96DvRujLo46YeRZRZ+I1iAxZ5A4MB5mBw1uaNVamq2FyBhs1MaLfe6w4xU1nutw7fO9q6HQjigZwF8NGISQzpkZFzhB/66TkTHFVLt0JtIv3sF3V+nriluGk0NyhWVDL9/EZvVVCbHtKrsq4iDo7pW+0ue9NKNPU9l6Td/OH5OyxXJGr9pb33qKQJcfPtptrzj0Hy/G/x9XDzftAUJjfo6BfroWFEs0qESyU83h2JSH+M1CrJn3L9U5uPB+gVPPOloBAqyqmPfNXNxH2JcbwJr8SdqBrANXvYuPpn0mjXW/iC8o5f0OGwXYg9xbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQNxKQlk50F/d3RxIUW8GHsZ2EThLBH2CQt8NqqX+8c=;
 b=goMVEES9f5CIlmK2GejrzwQTZV9HqN630Zy8qkxCghDpFqxeVWC3RYOyNwzcu25nQhCVNW6gH7iMXFrj1Ag73zx4fBH3dveIQTaTzghzXHCm/8eLkwsgaXcZS5BbZhSA4eYDa82emza5B3Rx33Z1PI2S7f0UgNjeaxjSeEQFJfXIJg+Q6BPweprlNzU14ku9VM3z1ciaYYcIgvzpOAX3HWuifZFq5UYCj8M5mQV1toRS4XDL2OqHQVfEoygHA0gZtOicKrU10AJ681P1dJR1iqZGlZ+v194NQCFpIimMJRKbSzFdjVpWky7xQ+1HU9Ki6u3TFd62wnEppX1qDUASyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQNxKQlk50F/d3RxIUW8GHsZ2EThLBH2CQt8NqqX+8c=;
 b=LOnJ9i+2Z6QvMTsxWKz2cTs9nnS6fGIuu+Kbv82B7xtYo9YfeCzwdir0fpcZ/h2cYvXJM+XZJNBITb00Iego0tJQ/WC9XRGqyyr4SeaqjdgGb88itpymohz5GFAnQ30x5PLXxW/SAfYhw7R05V8otJ4n2XsE+AfJQO3rqjrAr7CRNxHWFwXmv+F7Z4+XyjhiQP1uz0aZy69f4imd59zBedr5N4Wtr2ZAjwE9IeN8VmzkIszGowATEkGI5jHC385N13zCts5IeMWRHfh654sjdm8Vm12uqW3PItUaHyAQSEYeYh1gU63RMpoSiI/x0yHMHSopoQ2a0px6HrsvhesRxg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Nick Rosbrook
	<rosbrookn@ainfosec.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Paul
 Durrant <paul@xen.org>
Subject: [RFC v2 0/8] Introduce SCI-mediator feature
Thread-Topic: [RFC v2 0/8] Introduce SCI-mediator feature
Thread-Index: AQHYHRWziOt6EkRoYUygGUtf3780OQ==
Date: Tue, 8 Feb 2022 18:00:04 +0000
Message-ID: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec057eaf-010a-45a1-b78f-08d9eb2cd5a7
x-ms-traffictypediagnostic: VI1PR0302MB3327:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33276ECDB30028D4C8061079E32D9@VI1PR0302MB3327.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dTxjwLwvtwEZyFXRqj8h9NUTWO0Utv5TM0mzTYUEPs7CvBd+lF2/49de4RKvb97KDEokbbZSekdlNMrckOYzFFQS5Jszg1be+pYqaiVnnPEoF0eC5FAGmmW59iPToTIPGOGNdwhK9k0cfFy9svd66E+MlwEUXrUR9owkzOux+ABVkxp11NSuLE/xPMo54oLbIYYkM6rWXR5rn4NY3ynWdhOIR9u0PAOiAV7drrWPShkaqog+ooLp43r6J2XNAboXCPuwIBHsGNXKmR+osaQA3VbbzuP3itVbMFRzIk6s3mbrMb/pPT8MSn+t97avfrW06dkX8aj2+IRdnLRo3RHLwaEDmeuKuMZoX6ImJ3sQGIPEV9kS9s9apzPcrfNBFwz6caSP31MdUIyfEn7P8bHeaR6YI8NBUj8ldGmZlQgmcb8KaztEdZFB0p7+w82hxoKhMqqlaP4R2Wq0gG2Qyo61AmzLNUFFzKvL6SQEnIYZrq2MKJnIrVIm1XeHx/v0M5425AAHyxllLdEEZRGZ9oIudiAeT4oBrScno+PARghU7GBgMQZtcme8bB1I12prOXMdbP9GwWkVDAJfSxPP/7w90U0NBuuXFd869I0jUmPwqsb9X8UaaqZyegdFVbx1NwEUa6lebbkXo/228IK08SM/ULbDYGOiffhlUoZiXPHjD+QMOHO5KInFQ7DOSdmj4dDmyOqOrGorC/RNuj5ZsOvjFw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66556008)(66476007)(316002)(86362001)(122000001)(6916009)(6506007)(38100700002)(5660300002)(6512007)(4326008)(83380400001)(54906003)(2906002)(26005)(186003)(8676002)(7416002)(2616005)(76116006)(36756003)(66446008)(8936002)(91956017)(64756008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6xdreY4/6ZoOlhm0F0vs1B6PyJGBOUucIF6Jny9kOXh3V67B1CMuXVXUOF?=
 =?iso-8859-1?Q?9F0owIQjVLJkyDZ9L3e46SLqNDhjb6RCs+YVtH4Eo3OSQXfB+Z5jjQngIc?=
 =?iso-8859-1?Q?xvhfpuSeIPQty8r4sUMx8tjpx5h79IyZuSgob9XhlgSIp1DnQjEpjaap64?=
 =?iso-8859-1?Q?wXqfqPgdsY4KfjICFfAttrhn2up3za5Hz68P+bAavCBy1ynHL1NWaAAWFe?=
 =?iso-8859-1?Q?M8XfDqBOoDDigxRdn25zfxW989LuuwmxbaQUbmrMSVmsfuCNZ1tBQUCkhR?=
 =?iso-8859-1?Q?6K5s8zRPxlh+kBmz9a8DXpcNJe1UhG1G15ZhMsA5UoBGJlOaiRGkaa7Xab?=
 =?iso-8859-1?Q?LPAMVdRxuShXLF6BsfRGuCx7zBAuR1MOyeK/YajOoHgB2HjJgJg+Pzk2gg?=
 =?iso-8859-1?Q?OVL0Cy81ZifVAwy/UbYUwH+YtJndc78xiccZ0jX1AoFSfIEBbKPGuX1I3J?=
 =?iso-8859-1?Q?mEo8ZTDEm5pgoezzeg4w+MFB6u8mv68FB50rrUTe2t6l8qJrKkBlb3TQvc?=
 =?iso-8859-1?Q?ANkgiUgC8kPNTh4/6RWmd6XJtCMP0S0oIzi2aAi7d5aTfNuNeB/tKzDhRL?=
 =?iso-8859-1?Q?xu5Dr81ePTjETrrm1zSV5bxamsQhGfkxoExJKpTL5qX3y++oePv5TE4Dk7?=
 =?iso-8859-1?Q?eLwL0xMdSwKRpv+IBBXwEk+T8DkJmQ4E5C0D3UvPx5JGQAmVV0w5QQ6pbj?=
 =?iso-8859-1?Q?cBJZIyadGfLxDHF0LtlU6GYv46a5z/SjiDk0YOm/36W33FcYQP8A16IXR+?=
 =?iso-8859-1?Q?ragc18zoG5mrMMmJVc7cqHijgk6S4sxrkEdvi8D3iV5MKGAQQqBTKWTveT?=
 =?iso-8859-1?Q?Y20Lu5TKqOSJ6RkxOy0eZk16BwmQJrZx/0/wEGvveQwbYXW8ef0mziwgMx?=
 =?iso-8859-1?Q?CB5AwgPsAiMrF6+GdPFSTFE+UToUJo5Pr+x+/nV43+gGfiLr5r5j74cR98?=
 =?iso-8859-1?Q?qKEbpJ9XQGjVfIErK7lsnD8hCliqP2Neaagx6P0QwTwiI/P00/WZ7iNXDU?=
 =?iso-8859-1?Q?OPcx4nky62oHWM1Dd0/M2WQ+MTpNrahau1EMG8hf4xAK6u34YRdmGuCiZm?=
 =?iso-8859-1?Q?vPytBGM3EJ4bAofAd1NXwIvAQyJhaUqPTbTdIwOQKOBGmGI66Q/xNl9eA4?=
 =?iso-8859-1?Q?4+4CcfcCCL+xVWFMhfcApT3f18xT89IkS5IzWKoaXEb081wLqhY1Gn8IEC?=
 =?iso-8859-1?Q?3CRn/fqOPFL7qKIGT2i6R8dEOTwGdhVNkifndoQjj6BWFvhcyIovgs7dVm?=
 =?iso-8859-1?Q?JFuR/rybSZlWQdRKMb21dpDWmxm+VYwFumJNt4uzITWMEFWZydpLfzuzKv?=
 =?iso-8859-1?Q?ZzGlbaD1SKdcmXgnAD7YgXhlkW5VpGmHLAJufwzMsMOmAMAMJY/0s0UylT?=
 =?iso-8859-1?Q?o2N/xGymwdA7XYbmf3YVBMLkqMf/otSyDAgFaR6K+wffUBmLeoOzGldq7N?=
 =?iso-8859-1?Q?Zspn2aGrdCwhUbyoXFilXuLiYKBhOu7I235LW147kyIlsP4xKo2IDtNM7+?=
 =?iso-8859-1?Q?NEqBqjYzYdXKbrQoF650JgEJEdo/nVcwNBtG5FZqDd3HMaZiRhUAB8X4qT?=
 =?iso-8859-1?Q?gRrF1NaQxWwzrEoAvPeTI4mf+v2j9eC6SXnh56PC7fttqvYZ1PgiFUBwWa?=
 =?iso-8859-1?Q?YitKaDvxuOw0qNhZi6Lbmk0DLU3SUrcrFbBH/NKRpyn1UvhXd1/3Tzm2/h?=
 =?iso-8859-1?Q?/EtLgxJ+w9NbL4nGFmOmBRPLauplZffhD6+WRMkq9t8gHkPNF9waWbFIZG?=
 =?iso-8859-1?Q?uihXlgYt7HfewVxaEZ5ZUGnuA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec057eaf-010a-45a1-b78f-08d9eb2cd5a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:04.4169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnUzD1IYqE7Vw+DSZfDrVIPyOFruObbQMvTK9VMmmBnlUK0aQHck+FSPq9Qy34pN2SDmrbGw49wPfjns4h8Ff7VZ3XS/qb92oDx/yEJlz4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3327
X-Proofpoint-GUID: Ewj0VzFITWk3pPweORzYM9SHaFNQTaAM
X-Proofpoint-ORIG-GUID: Ewj0VzFITWk3pPweORzYM9SHaFNQTaAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 phishscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080106

Introducing the feature, called SCI mediator.
It's purpose is to redirect SCMI requests from the domains to firmware
(SCP, ATF etc), which controls the power/clock/resets etc.
The idea is to make SCP firmware (or similar, such as AT-F) responsible for
control power/clock/resets and provide SCMI interface so controls can be sh=
ared
between the Domains.
Originally, we've met a problem, that the devices, shared between different
Domains, can't have an access to HW registers to work with clocks/resets/po=
wer
etc. You have to pass cpg to the Domain, so the devices can access HW direc=
tly.
The solution for this is to move HW controls over power/clock/resets to
SCP firmware and use Linux-kernel SCMI drivers to pass requests to SCP.
Xen is responsible for permissions setting, so Domain can access only to
power/clock/resets which are related to this Domain. Also XEN is the mediat=
or
which redirects SCMI requests, adding agentID so firmware should know the
sender.
SMC is currently used as transport, but this should be configurable.

Here is the high level design:

ARM_SCI (System Control Interface) feature can be enabled in xen_config:
> CONFIG_ARM_SCI=3Dy
Mediator can be configured:
> CONFIG_SCMI_SMC=3Dy

Currently, only SCMI_SMC mediator is implemented, which using shared memory
region to communicate with firmware and SMC as transport.

Xen scmi should be configured in the device-tree.
Format is the following:
	cpu_scp_shm: scp-shmem@0x53FF0000 {
		compatible =3D "arm,scmi-shmem";
		reg =3D <0x0 0x53FF0000 0x0 0x1000>;
	};

	firmware {
		scmi {
			compatible =3D "arm,scmi-smc";
			arm,smc-id =3D <0x82000002>;
			shmem =3D <&cpu_scp_shm>;
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			scmi_power: protocol@11 {
				reg =3D <0x11>;
				#power-domain-cells =3D <1>;
			};

			scmi_clock: protocol@14 {
				reg =3D <0x14>;
				#clock-cells =3D <1>;
			};

			scmi_reset: protocol@16 {
				reg =3D <0x16>;
				#reset-cells =3D <1>;
			};
		};
	};

Where:
&cpu_scp_shm is the shared memory for scmi buffers;
0x53FF0000, size 0x1000 is the platform specific free address, which provid=
e
space for the communication.
&scmi node, which should be copied to Dom0 device-tree.

Device configured to use scmi:=20
&avb {
	scmi_devid =3D <0>;
	clocks =3D <&scmi_clock 0>;
	power-domains =3D <&scmi_power 0>;
	resets =3D <&scmi_reset 0>;
};

Where:
scmi_devid - id from the firmware, which is assigned for AVB.

During initialization, XEN scans probes the first SCI-mediator driver which=
 has
matching node in the device-tree. If no device-tree was provided, then the
first registered mediator driver should be probed.

DomX should be configured:
Device-tree should include the same nodes, described above.
&cpu_scp_shm should be altered during domain creation. Xen allocates free p=
age
from the memory region, provided in &cpu_scp_shm in XEN device-tree, so eac=
h
domain should have unique page. Nodes &cpu_scp_shm and /firmware/scmi shoul=
d be
copied from partial device-tree to domain device-tree, so kernel can initia=
lize
scmi driver.

SCI mediator can be enabled in dom.cfg the following way:
>arm_sci =3D "scmi_smc"

which sets scmi_smc to be used for the domain.
--
Changes since v1:

- renamed sci to arm_sci
- updated golang bindings
- reused XEN_DOMCTL_assign_device logic to add arm_sci devices instead of
adding new hypercall
- minor style changes
- fixed arm32 compilation issues
- use ioremap_cache instead of vmap to map shared memory for SCMI
- introduced memcpy_fromio and memcpy_toio fucntions instead of memcpy, mov=
ed
from Linux kernel source code
- use DOMID_XEN for HYP_CHANNEL in channel_list
- export host device-tree to hypfs so toolstack can access host device-tree=
 nodes
- create arm,scmi-shmem node from scratch for the domain device-tree
- create arm,scmi_smc from scratch if it wasn't provided in partial device-=
tree
- removed xc_domain_add_sci_device function=20
- do not use linux,scmi_mem to describe scmi shared memory
- define static address for the SCMI page in the domU
- introduced config parameter force_assign_without_iommu =3D 1 to domain co=
nfig
- require force_assign_without_iommu parameter to assign non-DMA masters
present in dtdev
- unmap memory after sending discover agent on SCMI init stage
--
Oleksii Moisieiev (8):
  xen/hypfs: support fo nested dynamic hypfs nodes
  libs: libxenhypfs - handle blob properties
  xen/arm: Export host device-tree to hypfs
  xen/arm: add generic SCI mediator framework
  xen/arm: introduce SCMI-SMC mediator driver
  tools/arm: Introduce force_assign_without_iommu option to xl.cfg
  tools/arm: add "arm_sci" option to xl.cfg
  xen/arm: add SCI mediator support for DomUs

 MAINTAINERS                           |   6 +
 docs/man/xl.cfg.5.pod.in              |  29 +
 tools/golang/xenlight/helpers.gen.go  |   7 +
 tools/golang/xenlight/types.gen.go    |   8 +
 tools/include/libxl.h                 |   5 +
 tools/include/xenctrl.h               |   3 +
 tools/libs/hypfs/core.c               |   2 -
 tools/libs/light/libxl_arm.c          | 217 +++++-
 tools/libs/light/libxl_create.c       |  44 +-
 tools/libs/light/libxl_internal.h     |   3 +
 tools/libs/light/libxl_types.idl      |   7 +
 tools/xl/xl_parse.c                   |  12 +
 xen/arch/arm/Kconfig                  |  19 +
 xen/arch/arm/Makefile                 |   2 +
 xen/arch/arm/domain.c                 |  22 +
 xen/arch/arm/domain_build.c           |  11 +
 xen/arch/arm/domctl.c                 |   7 +
 xen/arch/arm/host_dtb_export.c        | 307 +++++++++
 xen/arch/arm/sci/Kconfig              |  10 +
 xen/arch/arm/sci/Makefile             |   2 +
 xen/arch/arm/sci/sci.c                | 152 ++++
 xen/arch/arm/sci/scmi_smc.c           | 959 ++++++++++++++++++++++++++
 xen/arch/arm/setup.c                  |   1 +
 xen/arch/arm/vsmc.c                   |   5 +-
 xen/arch/arm/xen.lds.S                |   7 +
 xen/common/domain.c                   |   2 +-
 xen/common/hypfs.c                    |  83 ++-
 xen/drivers/passthrough/device_tree.c |  19 +-
 xen/drivers/passthrough/iommu.c       |   5 +-
 xen/include/asm-arm/domain.h          |   4 +
 xen/include/asm-arm/sci/sci.h         | 162 +++++
 xen/include/public/arch-arm.h         |  15 +
 xen/include/public/device_tree_defs.h |   1 +
 xen/include/public/domctl.h           |   5 +-
 xen/include/xen/hypfs.h               |  14 +-
 xen/include/xen/iommu.h               |   3 +
 36 files changed, 2122 insertions(+), 38 deletions(-)
 create mode 100644 xen/arch/arm/host_dtb_export.c
 create mode 100644 xen/arch/arm/sci/Kconfig
 create mode 100644 xen/arch/arm/sci/Makefile
 create mode 100644 xen/arch/arm/sci/sci.c
 create mode 100644 xen/arch/arm/sci/scmi_smc.c
 create mode 100644 xen/include/asm-arm/sci/sci.h

--=20
2.27.0

