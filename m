Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B6801973
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645841.1008355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En5-0005Jc-CR; Sat, 02 Dec 2023 01:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645841.1008355; Sat, 02 Dec 2023 01:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En4-00058M-MM; Sat, 02 Dec 2023 01:27:30 +0000
Received: by outflank-mailman (input) for mailman id 645841;
 Sat, 02 Dec 2023 01:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9En1-000272-K5
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:27 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f243ff3b-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:25 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGv4008549; Sat, 2 Dec 2023 01:27:16 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:15 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:11 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:11 +0000
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
X-Inumbo-ID: f243ff3b-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB4bd+G5qUD75eQXMR/lOkFVQEOzoQ5eKGuoPzBsWir2qx7GHtukzxUwADNZtGDG+UmF+FWK3daHfJCuXfn+HiseQ3n/0EU4P3dIyeL95VoL+gGwgmhpyjEvW8k2W6hUdcK5O12/hjqewdi3m/tnn4Lix+WLlNF5wG3o35s4QZ3p93TKqBzhqjsCo7tIvw0aZLKlXoEzanULa5wXnvkJ8hWGwtCrbjDdzjXo/zRrYHk4jC7KsYK1NByJ9vKnmgFzh/no3/yg23U97acQWh92pYwihksmVWeQ94zBo3oqxVB34Df5MQKvohw7lUuEf6PDWuNkIkN2q5MFYdMkVWXAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22ltegJ1p7Qot1PJ9ShhvDH8ZaJL6Qo1XKi3VZAv5vo=;
 b=a00GlAtIWWE1HPHzPyWKQHaqSTEc+DeDbtSdWUpYNPgofTixJMAKF8n+qYpoEU2keqQRPcJDjzxMjMwTvWM5xt6n3CREwQ6VwP4u6bxdo7aovD9XL+3WvVxYQXueLR7Yxx3fSbsqSkQ3VrJ5PdAM8c0sEUHoFLK0GDixgnAVjmY7fLwCx3YArYMW7wqFZeQcBYIKD19/txSUFb2zndPb2yHXLyBwpmM/+yETGH0T0ijpH4OKAOr0VknWytxGMBUqVr/uZAnipjm+7dEkjU9FGs5bOWoWdq8An6OqAqDvSDP4jg+biCWZeOHkDorGMirvBDUPX/cPELv2wRMJ1RJIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22ltegJ1p7Qot1PJ9ShhvDH8ZaJL6Qo1XKi3VZAv5vo=;
 b=K/a4cXricBvqbwuH5aFCGNR/d5bLAS5NHDy/mULx7lwCWK3aluRhm9ZlQFRcceEWBKrfjz5VTbx4bbDAc9xYhLEsADL8HnLJDUiMWTuAkgY9YkSP1sceVTAVdkiiNlh97ma1RWvEmU7txdVVcou9/XCgG0GjTyjBGCBaUPQpszD0XspmI+ifgRUaLWoYcYYQ35Hn6oTidY20DAW0fYfJf8fQMln2G9TZF+lyD2GjptWDUTyJLubJCiIrhcqYZg5xsMgxkdl1jrCdHX8XgG/4JDoI2NlJWHQoRaEc9xZXtQdBQaH7+YDgGTvU0Lf0wOMX1mxyq/UHMNi4KSKJgq/5bA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Julien Grall <jgrall@amazon.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 15/17] xen/arm: account IO handlers for emulated PCI MSI-X
Thread-Topic: [PATCH v11 15/17] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHaJL6p9eGZ4W17RUGnV1K8Sgg+4w==
Date: Sat, 2 Dec 2023 01:27:07 +0000
Message-ID: <20231202012556.2012281-16-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 28609c78-400e-4876-6c4d-08dbf2d5ce9b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BLmX9YE5PDVxL2tS9RtMDUPBEInubQi8eTN8Rlw2p83ZtYKxLnh2rtpIteDIG+Y+ACXeBs7Bg3pFI1Tq19P43g4TIiBHzCBxixmo5cCOcB8Zi83N0FL+jzsNRJQ7sVvrXKsbgItdmx+/L/L6620yU9l2SqJVTckbvut+QVKfU2+b7rJoUdMVkilszsfwXiOcP2F4yXkcHcVYGOQQwAMBOW9wrlFj0Eqt//CCorAvSMe/tk8MFZ9D6jOEvWaHWYEaEvW46zt68yVIIgj9L7C7Vv36Oy4d7eKlVfwqFoVseE2SfFUzdQ/bBXS0vupi6B2wrjiRKTpzYaACYiHczuvWYrcDLULZHBNzetQMQE+rLFSKRzuuq7xzvJqdJKcRittxxeP8gMBfktbEp4DldqYA7ebsxxS9m4ayVAjWZHsuEFNsDQGJM0ZM/D5nMprjMi9ld3vN1uSSI+3pDvjTt8HMZbLTj5v9qU9Wsm9Ef/84XNkyddLFI677Q7RXt5fwxOXQ4N/KA0QDDooU1qKUoHzmMh1BrEAdvipEeLLeD5BAybRJUOkbrR/nvK+OJAxydqiM2/ASMl6ejoUuhic6LOqdCZ05H/937BGV68knZij64BCvkDOsIKCJToRfBirJlR8T
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(66899024)(4326008)(8676002)(8936002)(2906002)(15650500001)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?WcsZYxn3QwWqbDQbQvvMMAJ1lCmdikKYzToszdgjOzmLZjUnckXb6iLpUJ?=
 =?iso-8859-1?Q?oXiYOChFeQDTELUO0CpM6Khe1wflXa4MnQP+KsM0/f5T/FM/1GUtsR4Ohr?=
 =?iso-8859-1?Q?y9DciP7fahj0jTk/ufRG6vyldkUe/DcBJaI5PG1vVrz0ESoXGS0V/wQKE+?=
 =?iso-8859-1?Q?emF1NuKORw+c29GGMPTJ7+zcoXt1Gimp7Eku4Kel8JukEs3aiJoAP0Gt3k?=
 =?iso-8859-1?Q?Xw5zjgyVnoWgca689XjdiRh3lUjovBzeZsThtDLAhi3OXyO+Apl8veoa6/?=
 =?iso-8859-1?Q?LV6l0r/h4PzJ/NOwwPNdYDMz4/izur1ygXFbNs0nAeZ2xOL6LhK8rYA00e?=
 =?iso-8859-1?Q?oUVxZZxjeL7UdZXxUS897vFM80w5jmZ9FQFuNSz33yTpfIe3X/3C5VYq95?=
 =?iso-8859-1?Q?UCXwgw0eAyawGkdqVAX601ahSjUCb54+hpmZdFQhBvLRi38a/G3CKDeTMA?=
 =?iso-8859-1?Q?/vH9AG/ND0x3+WYFMZUf+m59zO1+fZZvsk/LrUaMK/+YgghuE4/LE8qPdD?=
 =?iso-8859-1?Q?RDeEZkXlvYHCy/DNuxDx4JUFEekfYX2QesTHNbuqQiTlYPGWTfMgXt558V?=
 =?iso-8859-1?Q?faEnFz118vAeUJrvGwParkv57f8QeSieGnd/u8XqLSiWsfHx6NtgnL4NbS?=
 =?iso-8859-1?Q?jTXijVv1MIfGo0yBeVlTQgowInLW0i1o9kLm+YGchogxFa8WZc5xpvI0yF?=
 =?iso-8859-1?Q?uTRviuh9MtXTt+YEL3WlenVkoFkVeg5kK+oRk0rS+kv/NWJOb+mL9EEKEM?=
 =?iso-8859-1?Q?bqdACHPaDYrUbTaTqXJkv38O4te7MpQEREvkqsmzmM1Ud5hyc4bm8Q+s4J?=
 =?iso-8859-1?Q?kzevR4hzlOI7v3CExz1+9xFVCdwkWYk10NOb8oFikg/NRAmMs4oSItszcL?=
 =?iso-8859-1?Q?biUaKFh5EmFP3Rys57+FfLyJDPRiJG1I8hprfLTysReN+sjiQZunv82wH9?=
 =?iso-8859-1?Q?QfsPORBEoz7DgAFuVRbdeDoaNXgiU3zh7r6X+q1q0VY8N8I3Aa/7fWQMr3?=
 =?iso-8859-1?Q?VJA6eOJEzCFijUrmQmHpdUY0nqkhtctSbXt8Po1XikR/MWhCoZGv9rihPu?=
 =?iso-8859-1?Q?Z5Rn9AB7b+Z9CjeDl+X8Y1d2DwgZhBR2DfFZCSd752vj3khwbLHxPiP+PL?=
 =?iso-8859-1?Q?R0+DtWKBkIe1JgLlNGHVYebwbRtlvHLBGGbWtOes6xbAlaWNWIXkz+lh83?=
 =?iso-8859-1?Q?EbB896mPwPgguej4yv1da2MqA1DG/wI/X3JAXFpTzkT+nXsvu1teyN97Vm?=
 =?iso-8859-1?Q?SotWkvAJgEuiXZ5E55DHvULJ06mgs6L9dTIFcw/UjAKBNGF8VkRwEGCE9z?=
 =?iso-8859-1?Q?haje3O+//cGXimtGJRRLW1AMxJdTrWhGZnWDWwMSAGnQvyA/Hndiuf6M3A?=
 =?iso-8859-1?Q?KCYX4wj1EpXBkQ+Sb/CFKp4Wq9d6oJ4NKDTrOzJgKHy57iI9GPJDbwdLCx?=
 =?iso-8859-1?Q?jzrBGPJqOgWdzr4PcMXeQ3cYJBRPKn0P8C49FS3PgnsIYsQxUTPeHWv57F?=
 =?iso-8859-1?Q?w/Ml9yiqZlknUXIzRvRkkZ2iv3gxacwcRBNDScRy+5gjSJp1YGZp5p2c1+?=
 =?iso-8859-1?Q?+ouDNyZqLIOdDqa3F/sxhWkGGMLqHZ7oLKFZp/I2V9z3F2kkBHkfCar2fK?=
 =?iso-8859-1?Q?XCeDVHoSrD5LRyV89be/nSPgAPQlP5AgzqlDP/G2pN+ens9B2vv53Pyw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28609c78-400e-4876-6c4d-08dbf2d5ce9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:07.1866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8HnUlaeCbebl0Qk5tIhOKyMGqB2hKDCA1eLKpRlYNDuftGtfHM3s6XMSTXqQ/DBw1OOzmaJtvTyCqwk63/wz8UsLYpwto+Ac2y+VjuqoHus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: _pKyBxUJvXrRlOj-gNFJXZ5EHgRpb6yz
X-Proofpoint-ORIG-GUID: _pKyBxUJvXrRlOj-gNFJXZ5EHgRpb6yz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=404 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 7a6a0017d1..348ba0fbc8 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -130,6 +130,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
=20
@@ -150,7 +152,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct =
domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host br=
idge.
      */
-    return 1;
+    count =3D 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count +=3D VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
=20
 /*
--=20
2.42.0

