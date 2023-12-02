Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58B801979
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645828.1008236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emt-0002Af-TS; Sat, 02 Dec 2023 01:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645828.1008236; Sat, 02 Dec 2023 01:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emt-00027S-OH; Sat, 02 Dec 2023 01:27:19 +0000
Received: by outflank-mailman (input) for mailman id 645828;
 Sat, 02 Dec 2023 01:27:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Ems-000272-8U
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec92fc62-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:16 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGv0008549; Sat, 2 Dec 2023 01:27:12 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:12 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:07 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:07 +0000
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
X-Inumbo-ID: ec92fc62-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNOrBjonGpoY9DN1gCwVwR2d6NwrLJyAara6IXSLX1N5WHxSxrCfy7ZuXI25PS5qO30S8xvMYOEc6g9hc3O41mg91O047itZA8NFTLdxay0HpFAlX8mH2azn7fGnI2DE9biI9Rniu8SyVTo3Cqbu1SSZCtsPY9N2JecLL400Pqk42hK4p/GtB8WTM7cp3insIxEd2tIdx6+I4PGRyXpR8qBJkIlu5lA8d2u1yKR22jnQIAJvbObSaKq+RGUOUpHxLtesg59Dv5DdejCz4EU7RPAgmt9m6QmLxv+SPGXChkkcwMapMTMs3c+gUokWDKAjVDzUA48k8aw5V75KnV0H0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCAtQkOh1LlRj3VEXjXrBI42f2r4sRFKlSbnUPHqVJA=;
 b=BH+U/AlC8xu908Yx+05uXx85l7StqHYXsUWum4OGSKeYcPTF0qQzAs1TbbZACbZQHTOgQZ3z1EJBnBlpVw38cGuDMvI000QHsLorwp55sdHq4NF21OExLgssXuBsF8Zc32oDVAjZE1FktPBzIWNApfjRrXP0Agoles9EJulBBs4vUPI6Fq88PzJfOw1WrTB6NSaplEvMbZaQwWBYsOfRRqVreUBGD+b5LFdalNWM1LVbKldJRJM4kvcURtLFOLtSxfWQ7UoMATBZLMhGqEL8cdNbjOxiswLd826oZyHLqLzgsDLLA4+2OoTl+fvyeSkbyb22D4R83pMdR6b/BgdEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCAtQkOh1LlRj3VEXjXrBI42f2r4sRFKlSbnUPHqVJA=;
 b=J/LuqckK9XcohCSzJGtJvEEQFCu3cPWCBA9fg6MreZWdkXJh71qKm2u1sNXZg0IpCUV9c8HCd5nlrjbzgXSIqKAPZF9LX9Kg+FjfBjWqRmLR4uAyU++adIOrdrbftMhkG8m6Fi/v2Gz0U00SjbdP4X4dZwY+aAxsBbYDJicu1ZLNrNRSAMeeE2+zftUWLdhKMdaHlxWyPV7Ex6kNOTwl07Eqerq31dfWADXJkrCUuX5JDgolcSOwUYBYMzqRAAczqck0AvOgIeGrTjs19WqS3ekXuWpwLj0tiw7XWjcbGt0I8yUPk82u3d7cXZEiPx3po4jj27FLDrubQrXqmO6e4w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 07/17] vpci/header: implement guest BAR register handlers
Thread-Topic: [PATCH v11 07/17] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHaJL6oqjV1cLv4e0GmK4Y233LkQA==
Date: Sat, 2 Dec 2023 01:27:04 +0000
Message-ID: <20231202012556.2012281-8-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 4096a790-67a7-4017-985c-08dbf2d5cc65
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bZ/mq0D5DD02n0TzDj21sjIrPTrc5BYS8fSHsWsO/PBomx1RvJstm182hO1w/+JDII4pXOJlM2XINppKZQxEezv+wbTSDKhxqx1vvpPEq7t4QaeghGUylzetrILD9eKf07x9nNMF2WO15UP87MOTwMYEdElLCtQw9iAhxlvsxt4n3OeVT3j7krqTSS3MM6sUUz2Vn34FU4npSCMCXAf8Lz7AGehQeg/cC47evwLyOIjlpiU736OyTmCqBGe3R6xnMJhO2sg9nfU4a2MbVUlGXTXU8PJ87+XeMi3zVZV3scfJ6dENAFYriwj8kSPeNC2Mev+vWqgSulBCcFyJgHcMmsOxW6l7L8mimQFVL+LScUQNHvEIxF3vKa3nHcIgQjySSdjrrMQ+mmcrmt2yH7IhymE1c3nOmz9c2Dga5IGqjV+8TXRC9jfIRmrIj+Wzd6WT2FLwcohrEbe9mBqGyxcOd8H1HLZMFX//QLot34Z5oJr7Ke/2yJUJ7Of1Tmrv5Me6BpogTYkmflKpQxnH6L+uqxlX3SN8994d+03jikhgLsVzthNONokwJ+K+EVn1tM+0AHrtdtQYWdtt49WRlag/NKK8aTs7hmvnnEEooHmMu6eKgHObeIYlmRPfipQ17a7u9CIO4YI7DDobKeFYCuxFxwBxFOS1SVCdXPW83JEQsrQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Htiq+dBpyQVuNr6YzmL/BOobwv5XoY6X8QAQQm3GTyYklzxwMl4QitTh8g?=
 =?iso-8859-1?Q?pnQzFVCXOOmjf7jxAUASsQaqWSbPMM63nvufSu/OJmsQo8XXP/kCuL796W?=
 =?iso-8859-1?Q?ymhrskc38JiUMfeGtnV5kBy4hRm1cVOW37iyCiwNWytLx2zBbbyM88IOgL?=
 =?iso-8859-1?Q?jT7NWN+6s4gf6+VEbvX++4atJbcdNQh+zucmmPcSX1+P9J2AtuH4APFhMf?=
 =?iso-8859-1?Q?edIUBfpQuUyNHiqNbsTf8Rg5dfkWfBaBAlTyamkEB1Oa1QRh/CeqriMcvg?=
 =?iso-8859-1?Q?d5fJIkgZeJufkUsgr8sDplces7RZdqJ1Z7HTXhJUOHrvhsbTy5tMvDawXy?=
 =?iso-8859-1?Q?XAmilu+xhbwtxDRb75VlyIUVxblSx4JgrG7hqOwQAfqtbINRATlxqj+coI?=
 =?iso-8859-1?Q?CijCAYqWadwzfTaKbzakCH4HfHu5+BGIWlw5Pg2qljB+JS01fHzL4Wtvup?=
 =?iso-8859-1?Q?Lv965uIvMEyW4R0ewRalGVTvsLq9PLycww5apkQzId76DKo6kk8hMUJY8D?=
 =?iso-8859-1?Q?0B4qOGIWuIXAcFctuw1TqDTU7AUO08/D28bJNHiqF+72PXK9fbW9S1NfHD?=
 =?iso-8859-1?Q?ePLUHlIlyk3kgZhFtqoo230pn4jHMRme4RUncQu3/OufS/CKrqAtIqygUM?=
 =?iso-8859-1?Q?WssLtGCcJXzFiabygOK6YuXX79g2H6AngZO7UuZfsbwq2zGdM+IU4h73NY?=
 =?iso-8859-1?Q?8uS7bBteH7zdHq3OOEe79k16bwKn5pNxsmR3637rHeJKGFPrD0qJYMdHg0?=
 =?iso-8859-1?Q?Tq1Khx85TGNyxRS6LnZ0T4R5IiwtQkirbhms0BhzVUu8TC0ajqlBPfu03f?=
 =?iso-8859-1?Q?uJJp/Tg9qekbN36YQSgzddvFzkZuMv79DKqsQShhj7OB3Pv4SfU1zagho+?=
 =?iso-8859-1?Q?tJ7kTirJCWeJZ0fdrfEG45BLCRfFq2a125GfHCtKbs0e1tJKei1fTHh6iV?=
 =?iso-8859-1?Q?9IhmmSVD66+UDGzqBRypy1n/AEfxycJagudOS/OuThSOYwX1XxmwJFdoaT?=
 =?iso-8859-1?Q?Snzee0pLZdEo/AQYuefvFkv+tEQ/dJQy1HOU6zllCwmPZubEpXBJf/rhAC?=
 =?iso-8859-1?Q?YgtrAF6WkG5E33+yVc4njFzwhvK21+VvoEGSdZO7oUvA+boAV/fT9Azunj?=
 =?iso-8859-1?Q?rIDkXnhhSfsRt21kR/v6VE5O181o5k3lD1KbTBoH+q6S6LVABfxLN2tKDb?=
 =?iso-8859-1?Q?0NEyD4vSu4LkTtWC9YrPEFQy29c6MtMJ5yvbMtg9qRgWXi0FFdTk0W4amJ?=
 =?iso-8859-1?Q?Y9m+1y93OyQ7WcxLrmplnvwRa+Wm39OQX1P4wmKI/bBlwJfquT/olAPhtG?=
 =?iso-8859-1?Q?EoNRKr8TwKlTnL1QvoYhhPZyE72N4OnOQnMk9tiip+cjn6koZGZBEOGSm6?=
 =?iso-8859-1?Q?A0K3+WX5m10dfa8hSdubMZVNpwfQWlwGzWbM0eC0f6PJdKXeRXgBqyvBx3?=
 =?iso-8859-1?Q?m5bLPxfrjbWPG4IlnaQkO9Xnej3xQXOQ/LRj1GWIWiU1ZSc7tJvOUOxJ2H?=
 =?iso-8859-1?Q?WQyyAkZ5KQrjdBdXYHkvyAs1daYv9oV0ECh3eExMwdeuU3aJUqKC4O9GxE?=
 =?iso-8859-1?Q?qd885aMBE5OV0Ol+5Sun3IQx4jFY1BOiLLjWggcdM/7Vgd1YGZlUH4HA/h?=
 =?iso-8859-1?Q?+GdbKdJno9uPzb2LWpakutau0INxEd6OlckkSvTGLOelA/mHDWpHLJqQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4096a790-67a7-4017-985c-08dbf2d5cc65
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:04.5039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdp+vZbn8xdrJiaDy1p0te9QVmS4piHM514fR+wL1/RJpEnFhuhSkt4mE1xrzFSNmVYp6/HDd1ao7krFSNOrr7iZaGYN8FSLMiSbweM/c9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: sCeXfsJgOFqBdcKh-tnc0IaIldpWNxpk
X-Proofpoint-ORIG-GUID: sCeXfsJgOFqBdcKh-tnc0IaIldpWNxpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

All empty, IO and ROM BARs for guests are emulated by returning 0 on
reads and ignoring writes: this BARs are special with this respect as
their lower bits have special meaning, so returning default ~0 on read
may confuse guest OS.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
In v11:
- Access guest_addr after adjusting for MEM64_HI bar in
guest_bar_write()
- guest bar handlers renamed and now  _mem_ part to denote
that they are handling only memory BARs
- refuse to update guest BAR address if BAR is enabled
In v10:
- ull -> ULL to be MISRA-compatbile
- Use PAGE_OFFSET() instead of combining with ~PAGE_MASK
- Set type of empty bars to VPCI_BAR_EMPTY
In v9:
- factored-out "fail" label introduction in init_bars()
- replaced #ifdef CONFIG_X86 with IS_ENABLED()
- do not pass bars[i] to empty_bar_read() handler
- store guest's BAR address instead of guests BAR register view
Since v6:
- unify the writing of the PCI_COMMAND register on the
  error path into a label
- do not introduce bar_ignore_access helper and open code
- s/guest_bar_ignore_read/empty_bar_read
- update error message in guest_bar_write
- only setup empty_bar_read for IO if !x86
Since v5:
- make sure that the guest set address has the same page offset
  as the physical address on the host
- remove guest_rom_{read|write} as those just implement the default
  behaviour of the registers not being handled
- adjusted comment for struct vpci.addr field
- add guest handlers for BARs which are not handled and will otherwise
  return ~0 on read and ignore writes. The BARs are special with this
  respect as their lower bits have special meaning, so returning ~0
  doesn't seem to be right
Since v4:
- updated commit message
- s/guest_addr/guest_reg
Since v3:
- squashed two patches: dynamic add/remove handlers and guest BAR
  handler implementation
- fix guest BAR read of the high part of a 64bit BAR (Roger)
- add error handling to vpci_assign_device
- s/dom%pd/%pd
- blank line before return
Since v2:
- remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
  has been eliminated from being built on x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - simplify some code3. simplify
 - use gdprintk + error code instead of gprintk
 - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
   so these do not get compiled for x86
 - removed unneeded is_system_domain check
 - re-work guest read/write to be much simpler and do more work on write
   than read which is expected to be called more frequently
 - removed one too obvious comment
---
 xen/drivers/vpci/header.c | 135 +++++++++++++++++++++++++++++++++-----
 xen/include/xen/vpci.h    |   3 +
 2 files changed, 122 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e6a1d58c42..43216429d9 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -477,6 +477,75 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
+static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
+                                         unsigned int reg, uint32_t val,
+                                         void *data)
+{
+    struct vpci_bar *bar =3D data;
+    bool hi =3D false;
+    uint64_t guest_addr;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi =3D true;
+    }
+    else
+    {
+        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
+    }
+
+    guest_addr =3D bar->guest_addr;
+    guest_addr &=3D ~(0xffffffffULL << (hi ? 32 : 0));
+    guest_addr |=3D (uint64_t)val << (hi ? 32 : 0);
+
+    /* Allow guest to size BAR correctly */
+    guest_addr &=3D ~(bar->size - 1);
+
+    /*
+     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
+     * writes as long as the BAR is not mapped into the p2m.
+     */
+    if ( bar->enabled )
+    {
+        /* If the value written is the current one avoid printing a warnin=
g. */
+        if ( guest_addr !=3D bar->guest_addr )
+            gprintk(XENLOG_WARNING,
+                    "%pp: ignored guest BAR %zu write while mapped\n",
+                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+    bar->guest_addr =3D guest_addr;
+}
+
+static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
+                                            unsigned int reg, void *data)
+{
+    const struct vpci_bar *bar =3D data;
+    uint32_t reg_val;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        return bar->guest_addr >> 32;
+    }
+
+    reg_val =3D bar->guest_addr;
+    reg_val |=3D bar->type =3D=3D VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TY=
PE_32 :
+                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
+    reg_val |=3D bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+
+    return reg_val;
+}
+
+static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    return 0;
+}
+
 static void cf_check rom_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data=
)
 {
@@ -537,6 +606,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
+    bool is_hwdom =3D is_hardware_domain(pdev->domain);
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
@@ -578,8 +648,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( i && bars[i - 1].type =3D=3D VPCI_BAR_MEM64_LO )
         {
             bars[i].type =3D VPCI_BAR_MEM64_HI;
-            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write=
, reg,
-                                   4, &bars[i]);
+            rc =3D vpci_add_register(pdev->vpci,
+                                   is_hwdom ? vpci_hw_read32 :
+                                                        guest_mem_bar_read=
,
+                                   is_hwdom ? bar_write : guest_mem_bar_wr=
ite,
+                                   reg, 4, &bars[i]);
             if ( rc )
                 goto fail;
=20
@@ -590,6 +663,14 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRESS_SPACE_=
IO )
         {
             bars[i].type =3D VPCI_BAR_IO;
+            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, NULL);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) =3D=3D
@@ -606,6 +687,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( size =3D=3D 0 )
         {
             bars[i].type =3D VPCI_BAR_EMPTY;
+
+            if ( !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, NULL);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
=20
@@ -613,28 +703,41 @@ static int cf_check init_bars(struct pci_dev *pdev)
         bars[i].size =3D size;
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, re=
g, 4,
-                               &bars[i]);
+        rc =3D vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_r=
ead,
+                               is_hwdom ? bar_write : guest_mem_bar_write,
+                               reg, 4, &bars[i]);
         if ( rc )
             goto fail;
     }
=20
-    /* Check expansion ROM. */
-    rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM=
);
-    if ( rc > 0 && size )
+    if ( is_hwdom )
     {
-        struct vpci_bar *rom =3D &header->bars[num_bars];
+        rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR=
_ROM);
+        if ( rc > 0 && size )
+        {
+            struct vpci_bar *rom =3D &header->bars[num_bars];
=20
-        rom->type =3D VPCI_BAR_ROM;
-        rom->size =3D size;
-        rom->addr =3D addr;
-        header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
-                              PCI_ROM_ADDRESS_ENABLE;
+            rom->type =3D VPCI_BAR_ROM;
+            rom->size =3D size;
+            rom->addr =3D addr;
+            header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
+                                  PCI_ROM_ADDRESS_ENABLE;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, ro=
m_reg,
-                               4, rom);
+            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write=
,
+                                   rom_reg, 4, rom);
+            if ( rc )
+                rom->type =3D VPCI_BAR_EMPTY;
+        }
+    }
+    else
+    {
+        /* TODO: Check expansion ROM, we do not handle ROM for guests for =
now */
+        header->bars[num_bars].type =3D VPCI_BAR_EMPTY;
+        rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                               rom_reg, 4, NULL);
         if ( rc )
-            rom->type =3D VPCI_BAR_EMPTY;
+            goto fail;
     }
=20
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 75cfb532ee..2028f2151f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -67,7 +67,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical (host) address. */
             uint64_t addr;
+            /* Guest address. */
+            uint64_t guest_addr;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
--=20
2.42.0

