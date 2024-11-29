Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079989DBE70
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845650.1261026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8L-00050D-SC; Fri, 29 Nov 2024 01:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845650.1261026; Fri, 29 Nov 2024 01:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8L-0004wC-Mh; Fri, 29 Nov 2024 01:49:25 +0000
Received: by outflank-mailman (input) for mailman id 845650;
 Fri, 29 Nov 2024 01:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Fhq=SY=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tGq8K-0004ZN-6B
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 01:49:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2614::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2717938c-adf4-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 02:49:21 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB8923.eurprd03.prod.outlook.com
 (2603:10a6:102:32c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 01:49:12 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 01:49:12 +0000
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
X-Inumbo-ID: 2717938c-adf4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjA3IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI3MTc5MzhjLWFkZjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODQ0OTYxLjI0NjI5OCwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElJ3vJBzxP8+LZqZTOlsmpAtXVWtyicatYOS/qL3rQD4vVjkztPTArMJA/C3n/tqkDATZ7UiGjHKg1Dic4cpV3O5DEdFo9D1kWQdKZq6VACWG4Z/jK6A9dEKIDXC+QZAadJUp6oetsgMsZAex98DJC/4zd0taQJna1xez5nWAX3DRukqSoLl25Yiuw2uM2Ut+jL4iSADsW50/aYcmSQpUVwwirL1T2HkVREROr4RT074lrAjtDkvsrrHEGHFAtOxMq+E1VmYRdrtHXSFO7k2rYMrfmuiD3iU87l4KMg1K7qO/pt83TF80IFZie89H29RINkm4I1+hAAcAJD4KcepWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91rks3iGHddXWlb9TaITzGl1ioO2H4KAWWNhdEIdpuY=;
 b=MmJUWDB0b0zyl7Rh0NMO16MbMcx8H4b+Rmy5WY0U6Xm1oSyKeYDDjLdzfS8Fet2YgteWStg371b51ZvQvz8FPgCNcgWlhe/JNvgMEwt4avNagIYVyMYQwFTF4K6Q7R2j9XuqqeTGYbWCZo32fD/yRc2TXIM7IhMBwwKaWGlCUOldFeeHHllQyWq3PJb9hN276VGRE4XsZBvDK7kUjMWX0fplbp4VRC/4fLv3M+9er0pXneSotw0r7LAGbuMHUiT9RSriZ35bwAbq4ijwShPlOPt4jJFgcBK1dMq6Z/QM05xx1Ja9xPL+GS+8v8TnCtL6e0HAY26UgDEW6JOg+uqTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91rks3iGHddXWlb9TaITzGl1ioO2H4KAWWNhdEIdpuY=;
 b=aplOXoCUuVoaYCPHKQGjzcOfFn05iu+9uy+T/XV1kFts4g61PjbGODRyWq75lBeHfY2fM/9/MZ3OyrDemuaUfxgpuiy0ejbckBPzleAc+g/Q4D+hyLatv9TqjkvDDFuQNdNpzEFxIPRIt91J2vZHwMKc57nVMVRyBp247l4x2hH3nL4CHuO+nYcx13Lqzc3rPcjKYBjk5kNsrCz4PfhH808QO2gK7aOwihub6HdKhOvXQ+sOeAzF11qRPjxxAu1nkjtyf5LQ1HQbLNlgX7FnUikP2uCMFAsA+lzN3pnyFgL/2j+HT7ymYTEk4iRRqSrupzlvcnaXvFOQALhJXAMkJA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/5] arm: bugframe: emit msg offset only if msg is present
Thread-Topic: [PATCH 1/5] arm: bugframe: emit msg offset only if msg is
 present
Thread-Index: AQHbQgDhNP952szXN02UUErt4gl8yg==
Date: Fri, 29 Nov 2024 01:49:09 +0000
Message-ID: <20241129014850.2852844-2-volodymyr_babchuk@epam.com>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAVPR03MB8923:EE_
x-ms-office365-filtering-correlation-id: b26fee8c-56da-47d2-e80f-08dd10180611
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ssDuXYd05OPtTtNdezV30qDr2yKvhq8X4SoRzCrr4r8Qh+bAe4Na2xdvFk?=
 =?iso-8859-1?Q?MS4ATc5RAzPbmfyiItugjLQfOeXs6pJ9oOygoGeo1E7wqGw9Xct7m7r3nv?=
 =?iso-8859-1?Q?Y6YaN4mr+1LILMmSABIp3Xr/Y6ApItzX7D1PgatfRX8Gfmq7OM0WV67Eoe?=
 =?iso-8859-1?Q?1/9TNWnq/IekyXNSPRg3nlDPGzxTKGCZjb1wKlakxh1nav0W0UqxVMwIoo?=
 =?iso-8859-1?Q?aapX8DV5y52O3mG7qbPeXgJW48BMBR2C4BIJTBRbK2RX7slBmKadNE0yRk?=
 =?iso-8859-1?Q?eW7n+e8JyLLH0dGulPlPzgb9WzdbPHYGGOTYjGFKPNmIzSstYNq7GC+lbo?=
 =?iso-8859-1?Q?SzvWi7hB/f7uohB+y6AoqfWw4BGJOKl7pHcW1DKekCpE8BBpYaBO1vmrkM?=
 =?iso-8859-1?Q?w6cfSylTKQrZdD4Th0BvE8uLpFMlDEdnfhUBt6+/ZKA1dw7eEyMqzZYduf?=
 =?iso-8859-1?Q?WQsE5Fnh0ZWcV4bPwhfxUHUHN7QHO0swrqrNQ7Vv+KyGF9UXZjq+ky7bSS?=
 =?iso-8859-1?Q?5bEfnCqfqV+oySzDHNEmYKJMSXMomaoxbGfKSkmj2QLVT/eEfxnxytxBj9?=
 =?iso-8859-1?Q?V3HTh2atBylsphagVu4bP/HLk6fLTAt83A+reYKsS3Ht57GuNI9FqGbBmb?=
 =?iso-8859-1?Q?+o96xznCyyTnZXOL/19ojszHaZVu79ZGQWczXmM8akD7uM5/9vZ/XHTlRe?=
 =?iso-8859-1?Q?kGVbO9CCAuroJyP37Kl7nYBWexCnHS/SXxAgmVMHxOWZz1JUNF22EXjy7S?=
 =?iso-8859-1?Q?65dSFt8uHep4twmc1L1bFhG0DnrGlK9Vgz5mmuxfMPNve+yq3Jc8pPGUq+?=
 =?iso-8859-1?Q?QMVuXWagEU5mSDVlQZ9opexVW6ZfFOjC6QptpqFI1ImvWT9xjufUHdORrm?=
 =?iso-8859-1?Q?KXpAAZgrXFwD3pk7VXAO2LVPXKS1FG4kkObzXTgT3eaqWv2Wk2CycoGlaW?=
 =?iso-8859-1?Q?enUN0TqpAfY9Zii8xKBWV9+vz75Mb1j6XhNKjry4hPgszqkacy2AWtwrZK?=
 =?iso-8859-1?Q?M7S4ZvGVHhAH5BHJNAhFVj97uTZJ6vCgOjB+6EiwiDAI4feIQSOqIfdBhW?=
 =?iso-8859-1?Q?kOGVPjYH3RUGFQHBt9M+HM8HTyX8eBDKsQ5yn7gxk4fEGlXyY46pYxMTrR?=
 =?iso-8859-1?Q?sIm0YUXUBl9F4V0K6W8RpyXLpFQNpY9LLbv9aerO7Yo5ByRRB4YX8VkcBO?=
 =?iso-8859-1?Q?ZIZEf97EM5onyy5e3I4eKBArHYZde/f5tt67E5bK09pzFCTofotcCHPClN?=
 =?iso-8859-1?Q?dK2z3Br5f82qZHJIpCf3USCEVHOR2L78vR4+Emx8jPCPgmEcNe8B42dvbo?=
 =?iso-8859-1?Q?jgQVYAf0o2T7D6d7rwZXm4HbGJn5oTE7eS/NsLTOHVkn8Fkka6Y+2DviE3?=
 =?iso-8859-1?Q?9S4ZjOayRl0kwz23jxcArFH2ksS+UTb17luZNun7uBJ1BeITuCu6cgI4Fy?=
 =?iso-8859-1?Q?XlKeNjgep9lCWPuifAnjSnhySSPAwosq7eiOrg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IXRsHcgt6nSxEdYsI/VuJPMEYnRaPF/jvCvYMUYrkRXMwnIxBgzh3ICDcj?=
 =?iso-8859-1?Q?GUyL9jt8Ah888u87lkPOlIDmuFgTU3W+Sa8JkpwT9pNjQpfMLyoh3+yciE?=
 =?iso-8859-1?Q?xZyNWP4Eh5563Ao8rUpYL9p2RWWwpJsLqf0Qt8iHTrWrCENSboIy3rD7fg?=
 =?iso-8859-1?Q?r+cPbkTWGuBWxy3//Lh0aAgW8jihzk7qdYclk8Kuy3zBpVNm4o03HPvZVp?=
 =?iso-8859-1?Q?bCNMFvm01F5O4YVFGNVQ6Fau/DWeBl4FyBETb6VxY3yzZ0c1JNX2h5xjb7?=
 =?iso-8859-1?Q?zy96Dt/qCTdD2Ynm5lo/nyIVu+NtkQp+VYnK9OjOjKe23vOWuT5bJYB2Op?=
 =?iso-8859-1?Q?qMxCAPP1A0ZpVcmNlCLGkvudwsWRnKH1fzoOPUM/XlKwO+G0tBexagk0oB?=
 =?iso-8859-1?Q?MtsNIqGGjrcGkLFd95x87+1lRxMxitLyRH7Rb33+s0MqUNn9LMxElcMjeg?=
 =?iso-8859-1?Q?cS/NK9okopZTCeL7Bq6fPu+8KADIt38XVAL586etOTm+znt9r3Mmc7aoB2?=
 =?iso-8859-1?Q?paRf/K7XxUU/CK8uSBFOjjl3AmATfgfOXR32DRAhc6CboNHV1Ae7BOdiqQ?=
 =?iso-8859-1?Q?XPR3Xgck1so3ybxIhh48oMADV38tyjAfp0ZJhaArFNmE/tScOAc6myo408?=
 =?iso-8859-1?Q?jb2Udr8A/HCLlNM/xGngnApRRPVgulYRGEVyjl6mMp7MItalZg8xkCBAjd?=
 =?iso-8859-1?Q?kV5jgR56lAo73ujwqZYgAuifuYWZdnfVunc9/6SzYuBjiPcDB5XPvw7kQN?=
 =?iso-8859-1?Q?mt99kUbd+c3U7tZEmcSU47UWj6XW0QBd6eYLnH1rYxIabg51fFyLe6EDca?=
 =?iso-8859-1?Q?03+LkNCFtCQ8OFVBN+ndtC43PuzFe4HfpAhRWLYOiTtwFPkpJrsV5Gnf8E?=
 =?iso-8859-1?Q?yet2Bz+cr4IZTCcp6ZhAw8Pkn4JE3AtkYmlUyoq5ZqTEWLCzHR3E54OlOm?=
 =?iso-8859-1?Q?KCjrIppt3KBZ9SzHtwPJqf9Kvu6+LPOUHjNFF/w+/hIGR6nraePbDK0WFg?=
 =?iso-8859-1?Q?MFYKuuqgV2t+uXRNzMeVedW7Xv7ZOf1oJb61T5zx73w2xQiy2PYraBTOAJ?=
 =?iso-8859-1?Q?r+TyBTUKh6DeqpT+gow4u3QfN0nHurglt0kwKkDcIokzq7NEIOeoYLmocc?=
 =?iso-8859-1?Q?Vu4f1cFmDfTDpBCotBlIGHIuw6hMZqLiw+XDlzTbxBFKbsEno5kNWh+Knm?=
 =?iso-8859-1?Q?9dDKk9BF50ehssr55Ng12epcElSbMludcT63eO14WLXEINtI4PVaGpdWh0?=
 =?iso-8859-1?Q?nC71ZWT3Cx0OO41vk5jxd3Cn3+GW8xA7bT/uLBG05cDkv4vh1HldOEU3TE?=
 =?iso-8859-1?Q?y+jMqvqktDmzOB3+952nAfghBctY5ancauEfJZsfZXheZ4gTmZHG6MZyHM?=
 =?iso-8859-1?Q?9JpRt3DE7H4X+OBN6id8flAW+LZosybjLWExR5twgRU0vL4BmtL68XnUG4?=
 =?iso-8859-1?Q?eIQhq7Vrzcan1eI0EC7TcH7gTF0hsSJHFysyRMFK7ksxq4Ou0BGJIG3Cj8?=
 =?iso-8859-1?Q?vL4TvIyEnk0c3Lm8NvnDIfF1AZS1qd1XwZoSv4IqfgmIju6m/DkCbp0/7w?=
 =?iso-8859-1?Q?p6gzofJ6hqWUcntih3xC/XCIE/5neDMHK6DsJMdOLd9eYXJz4WW76bS9e4?=
 =?iso-8859-1?Q?2nHijLRyu1hdWj2o2Ul8ptS8JIVB6q/Uc6Iccs7h/pkyL2gwS9wlu+ig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26fee8c-56da-47d2-e80f-08dd10180611
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 01:49:09.4644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqacB0TLnLGyWCYTGhI0wzC41uR4WQqgaaR3HHeQQn23/hP5yw39N8qRLLtrGOTmQqZc9Fetwxt4C9+tbbU47/JgUw6v1qKXPz+4VzmubQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8923

Before this change, compiler would generate symbol that points right
past .rodata.str section. While GNU ld handles this just fine, LLVM ld
will complain:

ld.lld: error: common/device-tree/device-tree.o:(.rodata.str): offset is ou=
tside the section

Fix this issue by providing literal zero instead of calculated zero if
there is no error message in a bugframe.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/include/asm/bug.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.=
h
index cacaf014ab..9339e3bbf6 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -47,7 +47,11 @@ struct bug_frame {
          ".p2align 2\n"                                                   =
  \
          ".long (1b - 4b)\n"                                              =
  \
          ".long (2b - 4b)\n"                                              =
  \
+         ".if " #has_msg "\n"                                             =
  \
          ".long (3b - 4b)\n"                                              =
  \
+         ".else\n"                                                        =
  \
+         ".long 0\n"                                                      =
  \
+         ".endif\n"                                                       =
  \
          ".hword " __stringify(line) ", 0\n"                              =
  \
          ".popsection");                                                  =
  \
 } while (0)
--=20
2.47.0

