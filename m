Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A10473F96
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246485.425101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Co-0007h4-7A; Tue, 14 Dec 2021 09:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246485.425101; Tue, 14 Dec 2021 09:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Co-0007dK-0h; Tue, 14 Dec 2021 09:34:42 +0000
Received: by outflank-mailman (input) for mailman id 246485;
 Tue, 14 Dec 2021 09:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXUZ=Q7=epam.com=prvs=298265c1fe=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mx4Cl-0007JG-Ri
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:34:40 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32e434a1-5cc0-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:28:30 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE8mV6m004153;
 Tue, 14 Dec 2021 09:34:26 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxr338745-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:34:26 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6974.eurprd03.prod.outlook.com (2603:10a6:102:e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 09:34:18 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:34:18 +0000
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
X-Inumbo-ID: 32e434a1-5cc0-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Od2Nyu0aD89TjEpf0m02RBV/r5gVXiXD1wQ/PydO0MYlxrZ1PivvUk3jxlZi1GP/r+CfQ5glALF7/U3+kEf8YyJ9JsfCF5ZTAPD8WKoxgi6BlVbajAY30c8/BYwlEykhuczMT9UGiur5vV0rGCGEFpVSMvtOtSfSRLvhO7QJFuGucyCPsXrWFn2ULVE84SEJ0fYBB9d9rRED59xMkaGnWnNIKpoxUA37GnyffZUzESDOF3X6BVFbzYUnBx/zYOAj+pOicp9Q4Ob8rMd1eP4DFclUoSs54X6x01tfuHnY1CdnqLGlerBYdcCECxC6/M7DUu4Or/fq6cpoUDo4Rt6OAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EqTJdXZja5RAmYmgFwzvD4ulmqLhoeQ2wjok3WMLDY=;
 b=HPVaQJZJmIroGyvzP6dLeQpLx9JdS9MigBnABz9Z8HuxEDWLUAiARuHDvCIgC7uUag0XIE94S8wcJdiC8hfqWRXFD4ODg8rnMqUa3UO/GFCgYVvksrBB3DoWxyNcKBzVAX2PDZ8BKOOdTywF1+rhngSYXaDJSyvkDnKeItEgnNCSJpDOuA5xto8ZCIC0xidxYIMTbBRXNdm1371oJGhbrKlCo4pKyZpJH63ETU0b8+P5MwpOC0QvZOfhXN0+lEHaO40Lt4z6aw5jTJavwrvT6eGjsGlDTm0OjN95efH2vFaN95ONxGBqnTUhaFBxqHfhJx/xdzPSB+PTpQVt/yH8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EqTJdXZja5RAmYmgFwzvD4ulmqLhoeQ2wjok3WMLDY=;
 b=gJ6E57bQzWbFjPSD3pYW6uEJRwzjwa9f45oLg7hmwUWgLvauxTsdJj+tjMhFvnPoSXTHbGy/s+MD+smwBhnSlpEvPL0AD0hr9DlyANpt/uTSmM42/bNLzHbGmYElV6eFDJi7aEKG7MfStgi+lgXC7IneFTKQr5Vw6KN2kCUULWytsCCmN8lrDmabQRtourY1BVL6D7lNwI3aK5YMgHzHDHwGowsP+YzOVbnkMP9LlNtP+4DZ5CzpCZWZ+7Eqg9QhNvoc3PjdW4EBM+AtkouUzH2m9Bd5QOZZnWYNx/m1N9KfSqOvYlhE95kyfgEbImSGCkeHEzuAlJVM42nDzZ5ugQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross
	<jgross@suse.com>
Subject: [RFC v1 0/5] Introduce SCI-mediator feature
Thread-Topic: [RFC v1 0/5] Introduce SCI-mediator feature
Thread-Index: AQHX8M3EbPa1dWpku0ybFf1q9+BnxQ==
Date: Tue, 14 Dec 2021 09:34:18 +0000
Message-ID: <cover.1639472078.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6ae68f5-eef0-4008-bc92-08d9bee4e6c8
x-ms-traffictypediagnostic: PA4PR03MB6974:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB6974008DE65CACC2A8AFAB2BE3759@PA4PR03MB6974.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1JWp60UaE7K/XIcnVguQpxfGvRAZ3KIHPBow3z1e3V8SgW7EX/Se+s03vhg4JUmt79ASSxncOcqF2NzXd1RANS+4PW1s97R4rRaQNW/tOQmk7tytER2NhEyywNbiZHaxmrC8VIbAOLoTcOgztsYwyj/dAAJc6JsMOrF9uq+KOZViR2QRZWlKO/BPIty9MFjpKD93+u1fB/MwbvoVvBnPMG8FMNjfvZSSEAVbEsmEfc4Fn7mg2Fjmdo1lWG06/oKpjNqi9unLFcezQiLt7A8H+ALCfvf5OrPDMQgEZXabnqbj9bJf3N0EOwauJOizVrpogeSWUcVhPR2Cxle5t+F/ccbxx8Pc1dQmjLK5046z5PAWQ5qFJJwxxZuLjI7eUqDABjw58n4OfzBta5pUdB2fudsTA/nwYjXiLRnHIiQQW5kWaSsh8d51Pm8HohbIif48kdn80N2k7jgVT5CCUxsZ2H1IciJNtmaoOBrPUfwS2qY0eHt22vApwL6xwV/NYQec6ZMVKLZbFDBadeunzctkozpQdmWVVhkLZzGmjvextuufvrAeNVMyXHzoxjrI43yr2RBAecBG3K4enL1pwrGyAleQqzJHySseWG82eGRC6UJE0HZKQwnlEhcdkOd1CBbZje5uIQXLwxAPybz7Irg08wbGij9fcP+lCq2UA3gRaolMWUlkKHvMDX9qEokuLHek8RDlVwlg7k3Hg4jgZ8+TqQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(66556008)(83380400001)(36756003)(66476007)(316002)(38070700005)(64756008)(54906003)(122000001)(38100700002)(2906002)(91956017)(5660300002)(26005)(6512007)(7416002)(186003)(4326008)(2616005)(71200400001)(8676002)(66946007)(6486002)(6506007)(86362001)(76116006)(6916009)(508600001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fjVDhljBENyp49/IjJxeNFlzhjElWUmcB87jgE4tRmTyPx7aiRWkYmir7V?=
 =?iso-8859-1?Q?8wb/17rVgoRhwJabMW29iIsdLnR34CSiFKZeAek+wIxaFMXkxI0tij1VLE?=
 =?iso-8859-1?Q?iiXsJabxDi6gM9wIx4rEJwLHvcThsvx9SNzTQ8vasOr4F02zYLSgBKu579?=
 =?iso-8859-1?Q?qlzyZ+HRuT1sjz5pQROqBAAzYhaP3zLneXhDmEHIcJ9PmziajmC3OlMdea?=
 =?iso-8859-1?Q?0UedoAdBEVBRzcf4Pdd31SezYYQkSiiF7g5m4PdNELzJzHfe7WkLN1I5Lh?=
 =?iso-8859-1?Q?jS5OUr0L3H4zwSZdDmThvNzx3W9KB6bhZRAgqG4r7xn0I0uwBB0Rwj9xi2?=
 =?iso-8859-1?Q?igSGBLfAu+f7BYFxyQs6mJmnjGZTTYK9EuKx5jTfDW+JCT+ejbiYh5OKgX?=
 =?iso-8859-1?Q?tXUgetkvZ33KjDhxbLP3DQrmxAvagWSF1vLwfHNoEyhNSgWmKzXw11MSGF?=
 =?iso-8859-1?Q?pMMu1W04ZgpoTI+TPAZf8SG7/DnJi6tRuqXalSYUoB6Smyx2uUO3UVkteg?=
 =?iso-8859-1?Q?QSxHGxctGKPYGOzC50/rzicCaB3k6NcUBbh3FU13vTpprp2eIL/UcfaJmh?=
 =?iso-8859-1?Q?/PCsU8EoqDz7DLWr2ZLjFKjJAKFOO4zzogHQELtgGgN3LO8uLNM4PYpASZ?=
 =?iso-8859-1?Q?fAYBeeclbZ75UKytYN+z9TnxjF1oHkmhHS5xs0rmCjha59piExS4KQA4X3?=
 =?iso-8859-1?Q?ps/mwmkZ7tReve882xq9ba2F3Zg58zFV8+hmonF5oCRKYbtjz8AUPNfecJ?=
 =?iso-8859-1?Q?e/IJCxgV0UjFjqwDPtoU5V8HtzLe43c//J3inqxbqA4AzT0pl0i5VeJpjs?=
 =?iso-8859-1?Q?WPOGilFNQmd6z4O2cD3KN0EiWKy+gGoZKV67cngyGO+bLYgc6fmb2Mpqp2?=
 =?iso-8859-1?Q?qk6KnfFNBV8YExVEflKgiJRr8Iqs28+dda+PgSLmDU5HHfhRZ+bsneDNK5?=
 =?iso-8859-1?Q?q76sIsKsi+NXqyCIAKIXubErNFciONXvv5U/WE2d/+zb7vPWz9KE631HGz?=
 =?iso-8859-1?Q?uYLuA4pLrItPLOKlE3QuZfhAk7Q1+Tzh5WEhASdSwqXYQ64+dWPxuOvxsm?=
 =?iso-8859-1?Q?NocZ50gFACJCwrqIWtbXAwELDJpVdnuJfUnjHkLOLfQ7RgpgljfguGNCMV?=
 =?iso-8859-1?Q?bPVclOtv8pUsLXJANhpw7T4az/USyBtad7ckeRYKqGrDGRKbjOxXLxHCBK?=
 =?iso-8859-1?Q?CtScC8b7Y4CSucyQfrjzZlUpVt0krmi6xMSC0n/IMyd7vVQ//nwyJg9A2Z?=
 =?iso-8859-1?Q?q2zyKnbbTSFw7r+oj8GZ0waINNjSHG7HXDgbPbQgVP6JTIcPqqEM0sb9D6?=
 =?iso-8859-1?Q?5lXuXkJqOkiAwypPQqrwJ2zo80cZQL06XmD2JgjsNoxclzIPhDmSvRHENm?=
 =?iso-8859-1?Q?PdGkwxVJfCafC+TbRB6g1l7x3pBUnzuO19iLe+xhz9tmjXkafwDQEvm4gh?=
 =?iso-8859-1?Q?uwo0RnQn/AaO0uOWHfFh4RSio+ktbwbH5AgOEPFbQovaiRyRQypPGGomcV?=
 =?iso-8859-1?Q?2neEPiMbjsEhe4O7KvVwrQPw4bB3TgEFfFiieOkaSlL6g8X4/pcXxP0AWQ?=
 =?iso-8859-1?Q?t5RBzJMYXxZ7U4J0711Tt7EH336Up8XvefKS7Klyo4O9fZWTyfK0V6hFGc?=
 =?iso-8859-1?Q?c1VmpTPgKwyotZxsrogNEm6FRYJE6QYRFYWjmYnJ8EKudvWwq1ggopfEoY?=
 =?iso-8859-1?Q?K5jGWTyeikoPOuaee5t/6mR0M2k/DsdCZFG9Xm6XE11mX6RKzqoOOnLlfW?=
 =?iso-8859-1?Q?PGtoL2d7ojJ/G6V6/lt+bGvYY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ae68f5-eef0-4008-bc92-08d9bee4e6c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:34:18.2434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cBQEdyDaYtoSRnf2lue6Uzk7aL2OhLtFE8FPjJ84pztdp8Vs0T/zkTL3ZfgcYDz9EP3dGRDfDPEWOiKNcIG27mxcisSWUavmlZL+zEOwB74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6974
X-Proofpoint-ORIG-GUID: rVCIfrHDP6X2UwtYPCTZODOhNVkqlGzz
X-Proofpoint-GUID: rVCIfrHDP6X2UwtYPCTZODOhNVkqlGzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_05,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140054

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

SCI (System Control Interface) feature can be enabled in xen_config:
> CONFIG_SCI=3Dy
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
>sci =3D "scmi_smc"

which sets scmi_smc to be used for the domain.

Oleksii Moisieiev (5):
  xen/arm: add support for Renesas R-Car Gen3 platform
  xen/arm: add generic SCI mediator framework
  xen/arm: introduce SCMI-SMC mediator driver
  tools/arm: add "scmi_smc" option to xl.cfg
  xen/arm: add SCI mediator support for DomUs

 MAINTAINERS                       |   6 +
 docs/man/xl.cfg.5.pod.in          |  22 +
 tools/include/libxl.h             |   5 +
 tools/include/xenctrl.h           |   3 +
 tools/include/xenguest.h          |   2 +
 tools/libs/ctrl/xc_domain.c       |  23 +
 tools/libs/guest/xg_dom_arm.c     |   5 +-
 tools/libs/light/libxl_arm.c      | 122 ++++-
 tools/libs/light/libxl_create.c   |  54 +-
 tools/libs/light/libxl_dom.c      |   1 +
 tools/libs/light/libxl_internal.h |   4 +
 tools/libs/light/libxl_types.idl  |   6 +
 tools/xl/xl_parse.c               |   9 +
 xen/arch/arm/Kconfig              |  10 +
 xen/arch/arm/Makefile             |   1 +
 xen/arch/arm/domain.c             |  24 +
 xen/arch/arm/domain_build.c       |  11 +
 xen/arch/arm/domctl.c             |  15 +
 xen/arch/arm/platforms/Makefile   |   1 +
 xen/arch/arm/platforms/rcar3.c    |  47 ++
 xen/arch/arm/sci/Kconfig          |  10 +
 xen/arch/arm/sci/Makefile         |   2 +
 xen/arch/arm/sci/sci.c            | 128 +++++
 xen/arch/arm/sci/scmi_smc.c       | 795 ++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c              |   1 +
 xen/arch/arm/xen.lds.S            |   7 +
 xen/include/asm-arm/domain.h      |   4 +
 xen/include/asm-arm/sci/sci.h     | 162 ++++++
 xen/include/public/arch-arm.h     |  11 +
 xen/include/public/domctl.h       |   9 +
 30 files changed, 1485 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/arm/platforms/rcar3.c
 create mode 100644 xen/arch/arm/sci/Kconfig
 create mode 100644 xen/arch/arm/sci/Makefile
 create mode 100644 xen/arch/arm/sci/sci.c
 create mode 100644 xen/arch/arm/sci/scmi_smc.c
 create mode 100644 xen/include/asm-arm/sci/sci.h

--=20
2.27.0

