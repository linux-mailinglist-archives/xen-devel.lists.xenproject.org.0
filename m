Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D0801971
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645836.1008305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emy-0003p4-VG; Sat, 02 Dec 2023 01:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645836.1008305; Sat, 02 Dec 2023 01:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emy-0003eZ-MP; Sat, 02 Dec 2023 01:27:24 +0000
Received: by outflank-mailman (input) for mailman id 645836;
 Sat, 02 Dec 2023 01:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Emv-000272-Rw
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:21 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef9d9905-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:20 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGv3008549; Sat, 2 Dec 2023 01:27:15 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:15 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:10 +0000
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
X-Inumbo-ID: ef9d9905-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvyuZRmdhw+QyvsQKkf4y618fBcDryLJKYr+YkBBxcpgN4e8nYCowiY3YaUfMPKQ4qK7KqEkJEl/5dXkCJuSKeUyVmfPNg86vFEXZg3pvxmKutREuq4oPVNISaHTmkVy0r/j60BkPYbVbBsQkOZpGsBpWcoPSpjxyUWnuAd1X84okxsb2ek54BLo6iaZk7VE4KMdmHMUYsrfnFL693bdhM3bnFk2uWPAg+SMiaUMkLzLyN94jl3d9vVsXU3J/B6fcfyIahbwCZlH9gcLZO6613bVgIo49tJu84uPnOBffkHFtjWw2tGYT+ehCqBS5On8dKe6zpCDyU+yQkyxNeyAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvwRYk1bAN4JyImy8c8Ch0HVDpPVv8XFVfUhLtLPGZo=;
 b=N0ghPJuqaihdkMY5ANVKJgaApu2BwpGeX+3PoSeA4iWcyLKu3kh41XcwKUoBQD+IBbAi+C7f/8JQ0Cu+WVAEmV1HQvbMlBpkLb6bq7o2DxSThzG44URwmbKG2LltzPEz5a0yNPpq8s3Ap5G/gClvqIzAtZ58FzJ3dc4Qhlk8suD9BY3tmjZNYUv262cd6cwj83Hk0hjo4Qb1nf/fmL1/PqQpqtdkLWZdz+PWMt6zRit30+bpLShWZdoU85zOAiGzD0zcPhs8RBWgEuNWhwD/qxmvAHkWp40TvoOnhIun6b1swTYpK2lGOOD/xy51suhTng0CoboeLVXREBMUisMniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvwRYk1bAN4JyImy8c8Ch0HVDpPVv8XFVfUhLtLPGZo=;
 b=rJWgxohtDRtBX7h1BrpXHOJmdg27x+FIkzuU/FO8vnYYogUJ0ubiOQ5eujW5PdvNRYvoZBqdYI71DiEf+eGEEo4R2rxnarCbC2Ph6P6rNbGEknkdSm6K2vf8Gi5C77e2CWbaKz3QtBD9DYimZc56CmpAK60WzSr+vfovCA2Ub6koynpBAL3UjRR9VGGrhrQEwTlCueF5HCjuX2gFwab4pQKuR2alcN0zlKd5PlloYi5LsD5DIQ3h6GcCKadJ8MNpgCVXbn+v/+opmC9xNUH2Lh5C46nbsQF87SPJqm9qMbSBsApvgMAgWDh3AyQyEH/o0P+7MG0V+w/irLIOb6EBcA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v11 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHaJL6puZ1COBY1lkyH/O/4FVoj/g==
Date: Sat, 2 Dec 2023 01:27:06 +0000
Message-ID: <20231202012556.2012281-14-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: e9759de7-86f5-4474-9989-08dbf2d5ce14
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZOhTyIlegJlSD1VDS6nSnSk0omMBd+/gus4217HcRldMHDbaZI0MMFcaSFGKffzubV5PNFs7OP2RI2P8+JOoUGweDytdonDY+S5S/DXmdd7Yl68hQpwItp0p0ueZ/X3n3YZh1r0gTc40ElQPbtPiouNOXbC5SuzkycVsdH38bLXcPCmbJCKcr3BzGquKZCG6UYtUfvSGkIw4Fpoodz3wcIp7nwCgaULZb8sv26mT8YbtJQuo+CBOVqGJkE7FiN3PBqMJpv3YdZjIHepjnlOd9VOb914ia74GLWNW/8eaAICUNu48BCJwdYztqMV9B5yNX4z9zEBXRYbX7dviDNPtnA8DUkYaJP52kSuGPB1c9RRiLBTkJs0Z49rCKlPYUy0kiF2+FMZFEwAG92Fe7DKXtFD8qn+Kb6A0fZs86PaLqU8szf3BL1c236/ZbAEJ5te2EJNjwycWpnZYubdNCDvUX3HzIaG6LfVWceeHkBJc71nlwHboVxNhZUVrU4vRng/fkq494fVuezw0cghv0QDDtLrLBiz063cMSgDSEKFBwCZEYWAU1Ns2W8L8AQLIFp7cKPso0qU/XzTHAgMWRRc0mPMqxMtAeZT3nDK6AqLYBbPCy5DbN0qcGhlmyPeo20Jl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?27JXlJA5kQiY1dOUVSa7gw5Ne8UFGK41GmuafqHi7DCJELezXt0CjgkTDa?=
 =?iso-8859-1?Q?6lW8cXibcMdqbllSaaWE6/P9LMZLyyixCg4TlNKDc8a0+L57QIio17hYQR?=
 =?iso-8859-1?Q?FrVmFHLonzF1n89dlh4tfHlQl4pP9DWwufDHWnfrzk/pR/enwOFPzWi1WT?=
 =?iso-8859-1?Q?BBXy0emx1UZhZVzCzUDMZALxEKipFuc/W/1hNIkMe06iLw0QGmfkGN+AAc?=
 =?iso-8859-1?Q?KyRu1gZ6fUIQ5V4wR1peTyMoDHGWbjFKyNvlI4hT7s7aSx+T8UalAfySBf?=
 =?iso-8859-1?Q?E61UgCweeAY0mUH8UGFaFJ2B5Cs/Y27qPNlxUQzetZfEHQkaZfLtDFS+UD?=
 =?iso-8859-1?Q?WoSfUdAQCAoK94c4n/CVmb9NJJhh5VJYQxpRI/fE2tZ1zovea5KUJqhYYA?=
 =?iso-8859-1?Q?omGPPEWPk2qtoJaD1WPfqqi+PaFL7WGpHI832y5DEce8Xtwf3n64gobEeL?=
 =?iso-8859-1?Q?DOYi/LNJVS+Rz1/amyUFK4M4e3vDELZGtk/iqFnBbL7lI8rZJEI2afIDEz?=
 =?iso-8859-1?Q?OCx1qPikyRvAzNGY9ZUfEnBxGOBJgdMQyTOCLM0GEB6LgXa7k+GGT8a2/g?=
 =?iso-8859-1?Q?+gDMiPMotFPdGN86i7VzM2xZQKzPUIw5v6Kq0XzQ67L0axDLzgZX5Glvd4?=
 =?iso-8859-1?Q?ws/4QeZdOVuPcAAh++8FyQvR/X626og7Myg79PpKtUvbJFsxx0fePaeBEq?=
 =?iso-8859-1?Q?3IXjbiEgSd+JiqoNMP0FEtbQB4UICiTc2YlFCDVqvdb4BgJkGa2kzWaglG?=
 =?iso-8859-1?Q?qdZoFxryC/Bqvo/+Y47Flv0Tg+Mps338I+ZF0NZ4AmcPyNTDUAn7Q170OQ?=
 =?iso-8859-1?Q?7W43mOyJzaXcKOBDtAbE7CkClWczMX7uj2q/+hDOvKbopBxtbsxh4ASRbe?=
 =?iso-8859-1?Q?N54Ad/7xxq867SRpoNXgAG/GaXzh5TOHhnyvUTXCjpuWge2/RGOxz+oHm+?=
 =?iso-8859-1?Q?seU2yvaHfNqJ1Gn/ck5Ta/E7zYmj5Rilx/skxnRCBvYDtcwcotE9OxkVif?=
 =?iso-8859-1?Q?9YAee4Rx8+NqUF7Vw7W66H9G01T1U8WSA/lU2aF8JQZfm45vjpE+mySwnC?=
 =?iso-8859-1?Q?RdFl9L0BtmWyEGTOxGd5soWzACKVcI/ENCoB2/XpOnZrH+4OHjJ1H4+KI5?=
 =?iso-8859-1?Q?tRYQ2gCSw7qN4LlV9Tsluh0nubY8MKs5rIG6w+UB6GVN8Bdgm1hTizm85y?=
 =?iso-8859-1?Q?7MheNcsU9Z9PRoMtqCRAZ4fNcbT/GnqwbZnuEPssDRlrbjfE0DO2ogkBf8?=
 =?iso-8859-1?Q?4O5lJ4AwULP9G7ewYQCdjAPK6VCPkCosqzeWZyvCJ2JtUwgSc5lsR6EMiX?=
 =?iso-8859-1?Q?r36CUriq9JkUmZj6IIL1ByE5rb4Rj7LJW3/A6pwLGugMOsSQYha2Jqqcif?=
 =?iso-8859-1?Q?EH0qdBlHWDlGsBt7aHPGEGpw2AmQ0uTMlXLG+JH7HAfgrG53SVUXzTw7vk?=
 =?iso-8859-1?Q?0ZTRB6CJ+be317fZFvgEBz/dJmtfgN4LtYP/aBinwwXib+AGsLlod0XVGZ?=
 =?iso-8859-1?Q?qGDq5rpq/tKnwednD/Hmc8LxRuyoYDRJD5uNNnkf8dD0IRKhPLGWctNgYS?=
 =?iso-8859-1?Q?bYcF7FDr3ThSF76SB24R9b/YkaaSF7JpU8U/GkebHal0uAnSQ2ogMXN2lt?=
 =?iso-8859-1?Q?rX9nSeix3tBvusb2qN3n8kLc9mbnOJllPCyPkWn87BJ/dxrvv+22stBQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9759de7-86f5-4474-9989-08dbf2d5ce14
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:06.2020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yk+rGzhWAGivMeF6OYzcCrZ+u8ebLTEu2HIM/mvTsStgFPOKrL2vvuJEHH1bJtlgxlWjcv4uzZmsWX9euIg44NXC+egOBi0eOiqr6l7x1fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: WTwQsomRv3Z7QJzM_Y3WrHyo2UHSYsYP
X-Proofpoint-ORIG-GUID: WTwQsomRv3Z7QJzM_Y3WrHyo2UHSYsYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Assign SBDF to the PCI devices being passed through with bus 0.
The resulting topology is where PCIe devices reside on the bus 0 of the
root complex itself (embedded endpoints).
This implementation is limited to 32 devices which are allowed on
a single PCI bus.

Please note, that at the moment only function 0 of a multifunction
device can be passed through.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
In v11:
- Fixed code formatting
- Removed bogus write_unlock() call
- Fixed type for new_dev_number
In v10:
- Removed ASSERT(pcidevs_locked())
- Removed redundant code (local sbdf variable, clearing sbdf during
device removal, etc)
- Added __maybe_unused attribute to "out:" label
- Introduced HAS_VPCI_GUEST_SUPPORT Kconfig option, as this is the
  first patch where it is used (previously was in "vpci: add hooks for
  PCI device assign/de-assign")
In v9:
- Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)
In v8:
- Added write lock in add_virtual_device
Since v6:
- re-work wrt new locking scheme
- OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
Since v5:
- s/vpci_add_virtual_device/add_virtual_device and make it static
- call add_virtual_device from vpci_assign_device and do not use
  REGISTER_VPCI_INIT machinery
- add pcidevs_locked ASSERT
- use DECLARE_BITMAP for vpci_dev_assigned_map
Since v4:
- moved and re-worked guest sbdf initializers
- s/set_bit/__set_bit
- s/clear_bit/__clear_bit
- minor comment fix s/Virtual/Guest/
- added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
  later for counting the number of MMIO handlers required for a guest
  (Julien)
Since v3:
 - make use of VPCI_INIT
 - moved all new code to vpci.c which belongs to it
 - changed open-coded 31 to PCI_SLOT(~0)
 - added comments and code to reject multifunction devices with
   functions other than 0
 - updated comment about vpci_dev_next and made it unsigned int
 - implement roll back in case of error while assigning/deassigning devices
 - s/dom%pd/%pd
Since v2:
 - remove casts that are (a) malformed and (b) unnecessary
 - add new line for better readability
 - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
    functions are now completely gated with this config
 - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/drivers/Kconfig     |  4 +++
 xen/drivers/vpci/vpci.c | 57 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  8 ++++++
 xen/include/xen/vpci.h  | 11 ++++++++
 4 files changed, 80 insertions(+)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47..780490cf8e 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
=20
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 8865c1580e..c92f2d7bc3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,6 +36,49 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static int add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d =3D pdev->domain;
+    unsigned int new_dev_number;
+
+    if ( is_hardware_domain(d) )
+        return 0;
+
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    /*
+     * Each PCI bus supports 32 devices/slots at max or up to 256 when
+     * there are multi-function ones which are not yet supported.
+     */
+    if ( pdev->info.is_extfn && !pdev->info.is_virtfn )
+    {
+        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n=
",
+                 &pdev->sbdf);
+        return -EOPNOTSUPP;
+    }
+    new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
+                                         VPCI_MAX_VIRT_DEV);
+    if ( new_dev_number =3D=3D VPCI_MAX_VIRT_DEV )
+        return -ENOSPC;
+
+    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+
+    /*
+     * Both segment and bus number are 0:
+     *  - we emulate a single host bridge for the guest, e.g. segment 0
+     *  - with bus 0 the virtual devices are seen as embedded
+     *    endpoints behind the root complex
+     *
+     * TODO: add support for multi-function devices.
+     */
+    pdev->vpci->guest_sbdf =3D PCI_SBDF(0, 0, new_dev_number, 0);
+
+    return 0;
+}
+
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -45,6 +88,12 @@ void vpci_deassign_device(struct pci_dev *pdev)
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
         return;
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pdev->vpci->guest_sbdf.sbdf !=3D ~0 )
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+#endif
+
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
     {
@@ -101,6 +150,13 @@ int vpci_assign_device(struct pci_dev *pdev)
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf.sbdf =3D ~0;
+    rc =3D add_virtual_device(pdev);
+    if ( rc )
+        goto out;
+#endif
+
     for ( i =3D 0; i < NUM_VPCI_INIT; i++ )
     {
         rc =3D __start_vpci_array[i](pdev);
@@ -108,6 +164,7 @@ int vpci_assign_device(struct pci_dev *pdev)
             break;
     }
=20
+ out: __maybe_unused;
     if ( rc )
         vpci_deassign_device(pdev);
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 57391e74b6..84e608f670 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -462,6 +462,14 @@ struct domain
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
     rwlock_t pci_lock;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * The bitmap which shows which device numbers are already used by the
+     * virtual PCI bus topology and is used to assign a unique SBDF to the
+     * next passed through virtual PCI device.
+     */
+    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
+#endif
 #endif
=20
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index a50dad6968..6a06267ef2 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
=20
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
=20
+/*
+ * Maximum number of devices supported by the virtual bus topology:
+ * each PCI bus supports 32 devices/slots at max or up to 256 when
+ * there are multi-function ones which are not yet supported.
+ */
+#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) =3D x
@@ -155,6 +162,10 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Guest SBDF of the device. */
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
=20
--=20
2.42.0

