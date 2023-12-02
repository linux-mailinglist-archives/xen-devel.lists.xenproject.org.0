Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02A80197C
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645834.1008290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emx-0003KV-DW; Sat, 02 Dec 2023 01:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645834.1008290; Sat, 02 Dec 2023 01:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emx-0003A8-0E; Sat, 02 Dec 2023 01:27:23 +0000
Received: by outflank-mailman (input) for mailman id 645834;
 Sat, 02 Dec 2023 01:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Emu-000272-Cp
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:20 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eec6a01c-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:19 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGuu008549; Sat, 2 Dec 2023 01:27:09 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:08 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:03 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:03 +0000
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
X-Inumbo-ID: eec6a01c-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DslJoTQFHmjSct0YQDC2OWdL/+ojFYhj50ygnLXpLNQkPqhLvS7MgjVyHoZZN60d7wABqDUxELiDd0vxybFBAHi3Y6W0R1avuDYL6ROEPLcWFL9T0M1voeZGo/s1j8WTWwwOpEID2QlkIKXQ/GUEX7ZWAc+Mo9e0l1EQqAnkAtZJNmnWqyRWbv7olqssLTYIub1SOSfhzXgmTQyrSmT6aNlLRWHZGdMdlF9MAl71K+OTMkISX4DO4/hLDlO+ZnNOH92zRXc0XcE7ZiObfQkuOjcfPBB6qTKk9gChMIsz1JFjHKzG4ZR3+rI384EA9cjw19Pf/UyAM2V5PqpDVbCU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G495MYzvuMQHdmRAHaXxuT/rdye2JvaiP/jgpIr1+U=;
 b=jMLzmViePie6sO8v8VzBFTePUfPA5N24JKZ+JXANlJP2tX1DyLJrXrrA5QBKFjxIc5hszrjAs/IxIMTeVCrCwQJptagBXScMliC4n57vr0UgGFb044tH+W43D5Bnl7NvRHT3GjEua1mJtsjwQDIg8gmIS61WKxfIyyJ4K1LyPBIj1uwYlfbEuPGHGbJpo21BLSS1ZJljxnPovvBGuDuU38ZAx3NHdK0iA1gIpmrip6VXZpJHJ5XRuMxmeWmTUxJz5cpDyzDpsgnl7L3WdjLdPNmNaI4F3vAJcuZv81qcauSrImIxR+VQNlXQrvMNkudRCzEt5XKTM1hmQp6ZmLl8YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G495MYzvuMQHdmRAHaXxuT/rdye2JvaiP/jgpIr1+U=;
 b=IIr6XWQPw1Hrcb/D6C5jn8eWkaa6+NCHKdZmvcJG380Q8zKEl2revyJhNkfnoInRWtrbxZn4ELTAHphnTva6Tx+7aaxVm940XfngN3jK+iVDM7OW9EJ9Awxlf3wxhtNgfELFDNisfMthVE53AbFt+VQQFkYp2rkFKCX4G1B/eDdDS3eRUJP8LPE6EGcnRxo0lYcmeRVEcJqZShJ7VZ4o08SaK95B7tpI0Bf7vWG0OaoKbTgOOAPs0Pr8Vx2z3V19ciT2J3fDdCMYj/jmnZctCzXOiUaCNWcCdGDPKb6jvSJc9Yks5+LY/01XliWfsUhOfSmkK4Bx8SRfxFQVSs+wkQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v11 01/17] pci: msi: pass pdev to pci_enable_msi() function
Thread-Topic: [PATCH v11 01/17] pci: msi: pass pdev to pci_enable_msi()
 function
Thread-Index: AQHaJL6ns+Jw4l4utUGjbwsXvB/LmQ==
Date: Sat, 2 Dec 2023 01:27:02 +0000
Message-ID: <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: d518bee5-c3ca-48e4-6d3f-08dbf2d5c9ed
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 chqwC0f3SIFfrzc24kdrEDAdU4FEZMZosOlprBGYeT2H5yQmW9RlgRcez5oDbISKg6VDgkupDnQ+Fso9BcI4l5umcGdch6XRQMxnKQAlzh/AOMhihB4nIv+CZxPpdskjIl13eHrZsKVz6NmoegSCSCNMcIMxrbgYSNvIvzT7O6gnb6DKv5YOqVyTvYpdebLa3qEIF7rxf9TnPdEAVivEDvgRbxZxvd9c9F4cQzi3RhqcPx3RJu33apmhkOHcEnfT4Iodw9MG3VeCMteNXHk+F/aXsI0jdfDJ5Bl7i9rpPIl5BoGdzwfs99KrE8brrdUFqg3bVJYrgvVcJFOrrlvUjry+oehykAO9dHz2q9kGi5b1w6WepPz2tRyievD13nwH9FBqvhjbTH1cJVxevoqe96V6BhzoRI0iKav1TukWNcmkHkMz6myLJOEFrCAcxl5QsGW0vDHTkqoQeOCrWN4mLGkrhIEdjCcqUh4oB6GS0fnC+40R/6mv3fziu3UTQNjDt7F+Ku/ta3nW+P4Fkz4mC6kr/4khlFPO/3XUhNe9OCTxbgnRn3UUeg9agjUCjUKSphWT2Ip5o/xqmzQvKVMVMs0lwc9RdtWcabbLtZJ1YihoWzZlXSJL11+iEvyuJ3YK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?zIDxl/XMTKd7aTsYYVC/t5GYEgM0tLTB7BJGmzvLPZ/mgFY163A5F2/Ggy?=
 =?iso-8859-1?Q?xnKBsTi9RkkAx3eXiY1zJ1o/WjHKDBtsVmVKv58AhPHbrxZ8hg7xYlQsAs?=
 =?iso-8859-1?Q?sJvpzNzzUG1jdHoYNMmR+hnTSEJOEsXgG9fR8SP2kx480Y9aKIGmc/MjKZ?=
 =?iso-8859-1?Q?g0kxVYnPx/Ho/0A1bnA2kZQrRw4c+CTuF8n3oqSSBiSxHgulHB/VaAerI5?=
 =?iso-8859-1?Q?RQedl4TJdFy3DcxHGxVvCkFauqOOFZEDotvmK7o0sg6eokUcORZtunWuWS?=
 =?iso-8859-1?Q?KrMD13hbfkJigE8XeuC/6BYefX9TD4+rIOAhA46HUjo3s6jGoFM+fsOsxH?=
 =?iso-8859-1?Q?m5/jqonXZAh0CZI5rnQ50wHysW97ruBJpRdnLWGLWZr3+2bYCNtz/Rdm7H?=
 =?iso-8859-1?Q?h+aO6uROKE3ZDa0aEj1vnv7UdzQ5mn7oZG5FtPXIfOtGJ2FRZfwLf55LQl?=
 =?iso-8859-1?Q?8IwBjQGPChkyPX9JDJXv+yxy6M3gyfS6KebumsCug3vhyLEvVv3YPlE7j7?=
 =?iso-8859-1?Q?DSoZ+TkaVi5xXPBztI4XF+3USZ8ge9Jw+P1o+sBmM1FCRorCEdXGQxMfOF?=
 =?iso-8859-1?Q?lLN5Yoscad3cIiRMBBcMDvdg/TFD9ZRYkVxQRyaHTePqp7lKBTirDz5Ueu?=
 =?iso-8859-1?Q?Qdc0yG7aYv/sUrbAxe9H0rxbHJITuwXLndjPy9/XoCxYlEJuZbXs7Z3naw?=
 =?iso-8859-1?Q?5LEQIWwlXN/ieE4j9h7U7JvHi3cumH6ruAAjOI4WALWLUMkYj4WeDeBWYD?=
 =?iso-8859-1?Q?p92Y0FgT2GiRdh2UE2ZgmZDhslhu0bIxgZzYR47wE2Zv+1Xqe7LsZY1w1y?=
 =?iso-8859-1?Q?YTXQ09cW6xCka1Y8zJwwA/ZH4hTHBltnknlpjivC4qF2t0Boqfh4LeV66U?=
 =?iso-8859-1?Q?V9jF+IEkYcnO0A0oqfAxPEUzhRw6xspwm1AexGaRXm9Qz0LvAQS7O+u5R7?=
 =?iso-8859-1?Q?KNyshNOwNuRJT5J3TktvnbGoVAZgj7rclkG4bxJC/3h3v64m7RoD3UunFe?=
 =?iso-8859-1?Q?dkIG6UPupY8ZhkhvNqK7eU5LCmz046AVgQm7NAttTKVNroMy6qn0nv5EhP?=
 =?iso-8859-1?Q?cg5UMxtNoP2ZsyS/KobXFDm6MAY6z6UELJeYCHCgk0/3K8OtJ4WNaAsX4c?=
 =?iso-8859-1?Q?hitqZKfe7AfohrFTPgIxkxhu4bNu73YtpaCuwqwo6YdytcMEiCzc2Ti5cV?=
 =?iso-8859-1?Q?uPAmfjq+tg6TQJPI3l+HhbOsZNu2LHmcY+mr43CjQVRJIeDSy0fJRnXcsq?=
 =?iso-8859-1?Q?2oN6Vhixidzob3JHKOpHuB+WXMD0l0mRdr5FrMJdJsaCbj0Y5H8ZPCq5ob?=
 =?iso-8859-1?Q?UfLJWF8WTtRahsS/cQvXX45c5LtYtBG7YTRrvWXkjJU3EgTlA2G+IQXb+1?=
 =?iso-8859-1?Q?q80p9pjr3SCKBa1Bt5lyGe1aOroggdcagJnca28nS+HJpeuOZoPOkwG+W3?=
 =?iso-8859-1?Q?Pe0tUQUCYAbC38qX2VUmu4/D4Aicoc0mTMdg0p3SJxiuL81/LVAEHkZ4ei?=
 =?iso-8859-1?Q?wQgoivJotPI/IoK/ZKzEqdsIMf1tzKse1GIpxDvlMsnFIelMNKEyeC7F4u?=
 =?iso-8859-1?Q?1zlEk5nyGo9EW7wTikggr/066qpNENIXjOoXswC64mcB2mr6CzXwcXhJq8?=
 =?iso-8859-1?Q?Y+eDh4MHnw0Jw8/eiPt6n25GREmSnDZwMl4RK2ae32EZFpMgkiqAvFCQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d518bee5-c3ca-48e4-6d3f-08dbf2d5c9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:02.5985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fTZhMk9O60ROip8imXIkZbsfZv6URjP/oouUUWSXhonpxYcA8WlB/63TL7vcPT4aIgoHMxKXbW5FbzcPMP4gnS5e2ket0AdIhUaT/CKjow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: VsgJcOmBAdO4fmSzjT8sVc2vOJro-q6x
X-Proofpoint-ORIG-GUID: VsgJcOmBAdO4fmSzjT8sVc2vOJro-q6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=441 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

Previously pci_enable_msi() function obtained pdev pointer by itself,
but taking into account upcoming changes to PCI locking, it is better
when caller passes already acquired pdev pointer to the function,
because caller knows better how to obtain the pointer and which locks
are needed to be used. Also, in most cases caller already has pointer
to pdev, so we can avoid an extra list walk.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
In v11:
 - Made pdev parameter very first in pci_enable_msi() and friends.
 - Extended the commit message
 - Added check for pdev into ns16550 driver
 - Replaced hard tabs with spaces

Changes in v10:

 - New in v10. This is the result of discussion in "vpci: add initial
 support for virtual PCI bus topology"
---
 xen/arch/x86/include/asm/msi.h |  5 +++--
 xen/arch/x86/irq.c             |  2 +-
 xen/arch/x86/msi.c             | 19 ++++++++++---------
 xen/drivers/char/ns16550.c     | 28 ++++++++++++++++++----------
 4 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.=
h
index c1ece2786e..07b3ee55e9 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -81,8 +81,9 @@ struct irq_desc;
 struct hw_interrupt_type;
 struct msi_desc;
 /* Helper functions */
-extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
-extern void pci_disable_msi(struct msi_desc *msi_desc);
+extern int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
+                          struct msi_desc **desc);
+extern void pci_disable_msi(struct msi_desc *desc);
 extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
 extern int setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6e668b1b4f..50e49e1a4b 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2176,7 +2176,7 @@ int map_domain_pirq(
         if ( !pdev )
             goto done;
=20
-        ret =3D pci_enable_msi(msi, &msi_desc);
+        ret =3D pci_enable_msi(pdev, msi, &msi_desc);
         if ( ret )
         {
             if ( ret > 0 )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 7f8e794254..335c0868a2 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -983,13 +983,13 @@ static int msix_capability_init(struct pci_dev *dev,
  * irq or non-zero for otherwise.
  **/
=20
-static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
+static int __pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
+                            struct msi_desc **desc)
 {
-    struct pci_dev *pdev;
     struct msi_desc *old_desc;
=20
     ASSERT(pcidevs_locked());
-    pdev =3D pci_get_pdev(NULL, msi->sbdf);
+
     if ( !pdev )
         return -ENODEV;
=20
@@ -1038,13 +1038,13 @@ static void __pci_disable_msi(struct msi_desc *entr=
y)
  * of irqs available. Driver should use the returned value to re-send
  * its request.
  **/
-static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
+static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
+                             struct msi_desc **desc)
 {
-    struct pci_dev *pdev;
     struct msi_desc *old_desc;
=20
     ASSERT(pcidevs_locked());
-    pdev =3D pci_get_pdev(NULL, msi->sbdf);
+
     if ( !pdev || !pdev->msix )
         return -ENODEV;
=20
@@ -1151,15 +1151,16 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, boo=
l off)
  * Notice: only construct the msi_desc
  * no change to irq_desc here, and the interrupt is masked
  */
-int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
+int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
+                   struct msi_desc **desc)
 {
     ASSERT(pcidevs_locked());
=20
     if ( !use_msi )
         return -EPERM;
=20
-    return msi->table_base ? __pci_enable_msix(msi, desc) :
-                             __pci_enable_msi(msi, desc);
+    return msi->table_base ? __pci_enable_msix(pdev, msi, desc) :
+                             __pci_enable_msi(pdev, msi, desc);
 }
=20
 /*
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index ddf2a48be6..cfe9ff8d2a 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -452,21 +452,29 @@ static void __init cf_check ns16550_init_postirq(stru=
ct serial_port *port)
             if ( rc > 0 )
             {
                 struct msi_desc *msi_desc =3D NULL;
+                struct pci_dev *pdev;
=20
                 pcidevs_lock();
=20
-                rc =3D pci_enable_msi(&msi, &msi_desc);
-                if ( !rc )
+                pdev =3D pci_get_pdev(NULL, msi.sbdf);
+                if ( pdev )
                 {
-                    struct irq_desc *desc =3D irq_to_desc(msi.irq);
-                    unsigned long flags;
-
-                    spin_lock_irqsave(&desc->lock, flags);
-                    rc =3D setup_msi_irq(desc, msi_desc);
-                    spin_unlock_irqrestore(&desc->lock, flags);
-                    if ( rc )
-                        pci_disable_msi(msi_desc);
+                    rc =3D pci_enable_msi(pdev, &msi, &msi_desc);
+
+                    if ( !rc )
+                    {
+                        struct irq_desc *desc =3D irq_to_desc(msi.irq);
+                        unsigned long flags;
+
+                        spin_lock_irqsave(&desc->lock, flags);
+                        rc =3D setup_msi_irq(desc, msi_desc);
+                        spin_unlock_irqrestore(&desc->lock, flags);
+                        if ( rc )
+                            pci_disable_msi(msi_desc);
+                    }
                 }
+                else
+                    rc =3D -ENODEV;
=20
                 pcidevs_unlock();
=20
--=20
2.42.0

