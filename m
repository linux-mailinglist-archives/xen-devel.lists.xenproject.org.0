Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94F637B09
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 15:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447955.704628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyCpa-0005ij-MK; Thu, 24 Nov 2022 14:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447955.704628; Thu, 24 Nov 2022 14:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyCpa-0005gB-JC; Thu, 24 Nov 2022 14:03:58 +0000
Received: by outflank-mailman (input) for mailman id 447955;
 Thu, 24 Nov 2022 14:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgHz=3Y=citrix.com=prvs=320318b1d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oyCpZ-0005g5-GX
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 14:03:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d46e05e9-6c00-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 15:03:55 +0100 (CET)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 09:03:52 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by CO1PR03MB5905.namprd03.prod.outlook.com (2603:10b6:303:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 14:03:50 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 14:03:49 +0000
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
X-Inumbo-ID: d46e05e9-6c00-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669298635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GKm21m/ei8A8HZn4THt29obXo8gV8ogQzZOGz2qdL/M=;
  b=LTtheq9f5J4gU2co0bA8Zv7kWCTfj1Mmx5dLPVXwb94bNUpaojf8AgK/
   +nDwTxUPPTGCWtJ0BkpY3WwapPt6qpbkgiomQ1sfJky5QOQ0pPPdWW5CP
   5Vd5Okk1b21TaxCHlXOlvD/RFZejGcwRCEsUnScST3G1R9r+yGKia2Jlm
   8=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 85918850
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FQOAk6zGI5WfxU/H+dN6t+ckxyrEfRIJ4+MujC+fZmUNrF6WrkUAx
 2IaCGiCaamPZDfwKIgia9iw/RsEvZ+EyIViG1RpriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnP6wT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVNcr
 tEpJzMfVzSSqs2u0r+fYdV8nct2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMpuFTuGIO9ltiiSMlLn0Deu
 mXc+GfRCRAGLt2PjzGC9xpAg8efwHKiCNJPTNVU8NZLmFed5EMfIiY0amKS+MC3jXz5Qo5mf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpZNU4uecsSDct1
 1vPmMnmbQGDq5WQQHOZs72S/TW7PHFPKXdYPHBcCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZsjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:cCOA5a+XXYNpfhkOXN1uk+Hwdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 F29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQFo+dY7bWfHAbIcYa
 5T5fLnlbBrmJShHinkV1xUsZiRt7IIb0+7qwY5y5eoOnNt7Q1EJgMjtbAidzE7hdIAotB/lp
 r5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZeg60+Kkke+J3FwZ3pDcRHUz9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zJdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPyjisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhL08FunaPiK6YPJKqjNT7krJ9R7GkmjJl+WiR94WMNSBItLAwcQ
 93PK7n+5nL11WLwQ==
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85918850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLDQnGS7XajWKsfjoK5itYQF2tr5hNUQmnCW2IhFIRecnTituEHjJ/8yydwyCXzCqGsxKUsu6Ng+GnKCcRkhXVdcFXRI3DljLuMs2zdR641kY8Yc0eGrmotZSZiymBHHFjUAJc9Uytr/mtCXVsdR+8i3KMOHHCyC8ERo6nCpPiTNiXn6hK0n5iIxvZv1Ki/8DN7p7UE0DBdKuPv4CuZ2yvHHfouPPM3AJeI0St9oNLRHAEXI8h9ITDIWqwW3/7x7+ksx65RhJjttT756KSNf46iMY2e8UMqr0EHD1VzE7RffUk34u3uNjkCgBsQrI6XAMlW/3AcbFZAR7WPCb5cKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faxN35LKzPGT2r9ItmdavXbC1Ycc1lyFGQPJxy9f/+o=;
 b=RSpgsBTVdnTgQex5mrW217Dcvd1shAHgRjC6foJIwF8xfrifkrx2n3PeZMdTAQRmcBRFBMB81hQwS4LAAdfBjvXTw5CTfqrPicz3KhtAohxP7XgyY9wo8X/5L5emMO8ePtSrSJdCvhd89jV4mw96vmdA+yQtNGmkYmHNpn4DHSrzhdKAvVEQWm8r8vtHXFRPFtYXQSKZsOPnbe6IOCC7d4TXtwdEwkIDqTQCAoXc9pVOLDxQCR/4lXu2S7ovDByVzKgpeMUMWz9NRexFAc0i7OLN4vX+WIYz7IKm3JfDQl/i/ID99w/Z6VfBICfzBKkCHo7tvOF+569UndYz286fnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faxN35LKzPGT2r9ItmdavXbC1Ycc1lyFGQPJxy9f/+o=;
 b=cFW0ZTnbJd2obEWzzQ/e3AATdC4mgEYzgrooJpDizV7FyO1dRDpJDr77DT0HEYDedDJrpftCdKkCz0v5i64ql9hfzlOgCs8P5AN1/b9lQOqMufv1llyJ4yFidAliUJJQslm+x4T0G/0cjbylV79RemobjNH1gHin8fMmg19rFqY=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Topic: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Index: AQHY/4p9nL2l64sg4kKJKi/wcWyqlK5NyCiAgABOI4CAAAW5AA==
Date: Thu, 24 Nov 2022 14:03:49 +0000
Message-ID: <B682A627-4DD1-4D4E-8DBE-4503B53DFC9C@citrix.com>
References: <20221123222517.12140-1-andrew.cooper3@citrix.com>
 <D28C9584-F900-479E-AD23-64B8CEB879B2@citrix.com>
 <a49b5770-fc6f-0044-8e03-7162996257bd@citrix.com>
In-Reply-To: <a49b5770-fc6f-0044-8e03-7162996257bd@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|CO1PR03MB5905:EE_
x-ms-office365-filtering-correlation-id: 876225bd-8e82-4b8f-c4b5-08dace24b641
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5EJRTw0la8A8l5ALjGynuoqB3urmKToMTovGOSNl3Uofxr+t3dA7q+7aaCTcxqNN/fT4bUKvfeRF3syiD2veyZ1jaf+qfcj/9BnAHXIb1QtgR6CQSzDgC2Gn+9SihthXQauAyGRReyjiN44J2rgoIUTS62fASA7gzC4AIR/W2jLUnHxGokLOvX6aLq5XfzfAeO7UGE6A19+rNL+3dpELhYZEUwI/baQHvhc/bFTGYdSIh5AOldfCpMtTvQm6NGjYXqJ8Vg52Sdnm43nh2iGDnFYzB6jPguaaq5XdmFS96gROtlvHOqJuGw5VcCOj/dGjbFNyUdT9GQru3IPQZSt7ohumo1S2A3iSQ1rZrg9vm8HIncNRPaCBalYPDlIX+UAYC1ee+qXP5s+B61iZEgd8XXE9P6eQhUKMu/Md/BbVbzImrgiPCY2VyEeB0M327cqmbARysGvIJZu6w7ipiST3Emlaqp3TXoZvPB6RQ3/Syu7AzFLaJ1tMRJBc2L49BDud2+PPxBziT+/r6cuLrzypwocd7aYQYTAF9YMQV98zmzaELWgZevqEalV1AGbxajCcgv894RnfUh6ZH3XYu6ZIU0QnPM5ji0mRxcGM5tmYJGBdSvIAVk3AFNuDNqPRhsa2g7T4DzHGhFEdm4ox18l5jafcAKkqmi0aX3ogJLTohbjMTO/bq0bzleEIlc+19K9R5+t9vzr/0zSdSABSVgk1c5NTQYLKq4+RmYaV4zzsnPF5jVeTqc+wZtdL6ymx7H42Dp6L/amgX6oMEzSS6MrT8A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(122000001)(33656002)(82960400001)(86362001)(36756003)(38070700005)(66476007)(186003)(66556008)(316002)(54906003)(26005)(2616005)(66946007)(107886003)(91956017)(53546011)(6486002)(966005)(71200400001)(83380400001)(478600001)(37006003)(4326008)(41300700001)(76116006)(8676002)(6636002)(66446008)(6506007)(64756008)(8936002)(6512007)(2906002)(5660300002)(6862004)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uWlpvmv+bnNCDJdMuMIyXzmhInLVR9djmVZwaj/KozOuKzwxsJom3DhyLgpX?=
 =?us-ascii?Q?iMdKp0EYVNsUSwxadkMx5uEPVZVZx8K+J/QtlPyWpYDrRSNiyxJe7k1RBUrJ?=
 =?us-ascii?Q?jLvjpfIESQmzXMltQRbrbAe6VJn7NYMpNZV95ZKH+daKV2hyT5cLqi0bJlfe?=
 =?us-ascii?Q?UraEoC9z4Hgb63kBn51EzjFNzMkBpPVYMFUekNpwuGjYieDap7eiwF2lV15g?=
 =?us-ascii?Q?x008LB9DM+Ef70bLc8ZmWHuBTitlhZHBpkKQmFyjcck8yPAczoycnqSmTx/E?=
 =?us-ascii?Q?7P5xFCHb6JKbyRqsPilVeQYeAQeNAtmuEAMRnvrJZ9xec3IJ/RebnhSzVd8x?=
 =?us-ascii?Q?E/tCpbF4142iX43Up5ySle1ndq1p1KFvUBpw3Ap0hJmix5abx5NyzDojpW5v?=
 =?us-ascii?Q?FO+7BJAcQiqDwXLngA0TqX7r5vWQr0zHSsiHOOlGWAzOiOw9EAs9slq+y71F?=
 =?us-ascii?Q?wM79E3P0n5DzDXUyvPQ/ep91w6WeE+/etiXvTz25Wl7UVJ+IVDwIEJt1bIGT?=
 =?us-ascii?Q?BzgfK7NSg3xQmTWQQLt3K98PJtjRSgu7J4cJ4hHJANmQU8eOTididuzxSRhM?=
 =?us-ascii?Q?7I14B1fzS4Yx0NeYuAU1944e7TLAG156BbNqp3HLVvtRd7njRRpmfoLZd58I?=
 =?us-ascii?Q?V6uJfYKqXpTaNb7diKLoWqKJojrlIc7EbPa8dU0FxbCihtqLwEpTVEiqFtZN?=
 =?us-ascii?Q?Syr9jz8ozgehYjFJw7HhRmqeet8EMKe4+Vkyf0wjsLu5sdm7SmUhwXBcQA0Z?=
 =?us-ascii?Q?NE2b4xo7YS9h4xPV6Ko1jdBU5j6LbzAeec11rGgs1/SW6V/U0mTnx0YtQ1xX?=
 =?us-ascii?Q?kNT01upC31UJtsF3qwyaBv6vfRB0rugzDanlOv46znNB/w4QjiyW5Opl7KfL?=
 =?us-ascii?Q?7lRHECtpkePb9SAd9UEhyyjzpxRQJpyGORl1Id+oPrhUy+g1aV2tjlIol11E?=
 =?us-ascii?Q?1hHJagcEiAQtxS2A1twZxHyROUWpSydABY8SAScYPBEIf18g+uJZ4dsO2Y+Y?=
 =?us-ascii?Q?LNwgp04s/FiPF30JHSlI0Kqphfo0CbUmIdg0nmzD2gVRXylRX3l9t+tp41EU?=
 =?us-ascii?Q?af7oFYj8PdGXJnU0+UWPsz8hgqRvMezlo86BjMXFW1HDvyjt+sViadJSwPEO?=
 =?us-ascii?Q?q+d0zeaEL28YFoNqpEWw/CoU3XvJ+zhvOlVwYNzFz2zoyyTwcJ0J7AFnuSLX?=
 =?us-ascii?Q?wUDwaS7cRyOSbfLH3xehPTuVbhQtxkrmeYKdzrPfqHPWdTmoWfDJkYAnJ+UR?=
 =?us-ascii?Q?mZzXRquQERhsxuAYf3mPqJs6JRPjzi8mATNOBwPSRwnhd7oFfJdgVZmaCokV?=
 =?us-ascii?Q?mZmvYNVlt5w3rFFs6h0KUeWyGRc65v8ZLGhMlgPHVIf/b5ov1FTnKa+chFjM?=
 =?us-ascii?Q?EYRKcWtRXh0pyw4gqoyt0JeEQJoIGz5pNQ8GNVfmxCjnlPmlS8HA6c+tSpNb?=
 =?us-ascii?Q?6ITo5CN+/7m06WxIeVnAMawANKWnQ5Po8BLfY9Ahzd0IVJ3BgYijgawj8lDO?=
 =?us-ascii?Q?nhpszI+4hhyVsf+KeMg5NkA2AsBcUZnrYFGGD6oOj+vE6cbFAfD3kP2ufEEZ?=
 =?us-ascii?Q?4yXNKBXdjQAcCcG2gk07DmDx98KFpIMl3vk9P5NamFB/Xi68KmDUECKTaCNN?=
 =?us-ascii?Q?DA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78250622BA025E46869BA93F52A8F105@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zUVuxdNbk8gUgBejmX9RiM8YxttUKeLEMoCYyVXudy+gFM3UwCz3M2MhzOpZJpF51nQrxIT8lFUBMgrqiCkmmuGZc0jg99yz4tC93eIYOy5VvIxhiOW39tYknULSeCRETUfhrxWq+jkvVwaOVOWMPwCHcO4PLWH27wQZ6Yuu6I5/TwNNnteb/66QwfQYXwuXh0XN9fZWSmzAJ0TytxBqvD90c1MYCwvyCxoeLT2BAAwUbUGosBc2ubkj2XHV2BF2MqChLWioLLHmgADR8lAp2JkC0PTGI0qKL42tvOSMazfSXUncLTNF4aUIua538mMTjSXDATzntIOnKJ1A08CbOqMfSNaen7j9pMXoeG9d/UVUiajpLhdAZaNZ/3xm+ttsnsbwrmjRgLv28Jh9jy/qNCN4ganqgjlYhK4SMIRkEWTQhZIcosLM8d73JnwpyIQ99KE9mWW3RiIe4d2tRJ7bOW+XrMUR5sudf7e0j6NGJc/pTwraVZv3zFcS7tuOOjVc8lT2/fsMCzGLhxWER/zev0PqrM1K3K/RMTb4XI8i5EE4HmgpU9sknR4F75R/3fqpxUSM9vfEDGa479VFGKyzj5kSftfaKc2pzXvae1st3PmRPSZLctpKGqW/OHzwVGr6I9499BmzL6lqqaewf93mitPd2YxC7GnAQBisTA9WLmM6n0zOFvfg+hZ4DEujzIwLCYKDmH2wZZy8N+JVyLjukL8M40iasQv9HpZ4jvdjaM0F1LicGQRMLRWfM81e0uRpvlnaZ9rLGrN9SV7ygqJSC+kjbAeQeztCuHMv+ag4BKeYWJ0OXXAuOGAxl727h3/O
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876225bd-8e82-4b8f-c4b5-08dace24b641
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 14:03:49.7942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBX0SYrjrRKhEqmyTc89WH0dsuy5H6W5r528OGHHZ/VPpKQiQIJD9oS5svwmh0d91EQLe+ZdBGuIGeIg6NvNzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5905



> On 24 Nov 2022, at 13:43, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> On 24/11/2022 09:03, Edwin Torok wrote:
>>> On 23 Nov 2022, at 22:25, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>>>=20
>>> The binding for xc_interface_close() free the underlying handle while l=
eaving
>>> the Ocaml object still in scope and usable.  This would make it easy to=
 suffer
>>> a use-after-free, if it weren't for the fact that the typical usage is =
as a
>>> singleton that lives for the lifetime of the program.
>>>=20
>>> Ocaml 5 no longer permits storing a naked C pointer in an Ocaml value.
>>>=20
>>> Therefore, use a Custom block.  This allows us to use the finaliser cal=
lback
>>> to call xc_interface_close(), if the Ocaml object goes out of scope.
>>>=20
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Christian Lindig <christian.lindig@citrix.com>
>>> CC: David Scott <dave@recoil.org>
>>> CC: Edwin Torok <edvin.torok@citrix.com>
>>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>>>=20
>>> I've confirmed that Xenctrl.close_handle does cause the finaliser to be
>>> called, simply by dropping the handle reference.
>>=20
>> Thanks, a good way to test this is with OCAMLRUNPARAM=3Dc, possible unde=
r valgrind, which causes all finalisers to be called on exit
>> (normally they are not because the program is exiting anyway)
>=20
> I do that anyway, but it's not relevant here.
>=20
> What matters is checking that calling close_handle releases the object
> (albeit with a forced GC sweep) before the program ends.
>=20
>>> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/=
xenctrl_stubs.c
>>> index f37848ae0bb3..4e1204085422 100644
>>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>>> @@ -37,13 +37,28 @@
>>>=20
>>> #include "mmap_stubs.h"
>>>=20
>>> -#define _H(__h) ((xc_interface *)(__h))
>>> +#define _H(__h) (*((xc_interface **)Data_custom_val(__h)))
>>> #define _D(__d) ((uint32_t)Int_val(__d))
>>=20
>> I think this requires an update in xenopsd too to match, otherwise it'll=
 crash:
>> https://github.com/xapi-project/xenopsd/blob/master/c_stubs/xenctrlext_s=
tubs.c#L32
>=20
> Urgh.  I'll take a note to do that when bringing in the change.
>=20
>> This wasn't an issue with the original patch which used Data_abstract_va=
l here, because
>> that (currently) happens to boil down to just a cast (with some GC metad=
ata *before* it),
>> so the old way of just casting OCaml value to C pointer still worked.
>>=20
>> However Data_custom_val boils down to accessing a value at +sizeof(value=
) offset,
>> so xenopsd would now read the wrong pointer.
>> Perhaps it would've been better to have this _H defined in some header, =
otherwise extending Xenctrl the way xenopsd does it is quite brittle.
>=20
> Exporting _H won't help because everything is statically built.=20


As long as you don't rebuilt xenopsd you will keep using the old C stubs th=
at xenopsd got compiled with, the change in Xen will have no effect until x=
enopsd is recompiled,
at which point it could pick up the new _H if available, but I agree with y=
our point below.


> It's
> brittle because xenopsd has got a local piece of C playing around with
> the internals of someone else's library.  This violates more rules than
> I care to list.
>=20
> We (XenServer) should definitely work to improve things, but this is
> entirely a xenopsd problem, not an upstream Xen problem.


It is a lot easier to add new xenctrl bindings and test them out in xenopsd=
 than it is to add them to Xen.
We should try to either upstream all xenopsd xenctrl bindings to Xen, and m=
ake it easier to add them to Xen going forward;
or move all the Xenctrl bindings to xenopsd, then at least you only need to=
 rebuild the one piece you are changing.

But to do the latter we first need to get everything that relies on xenctrl=
 to move to more stable interfaces (including oxenstored).
There are some Mirage libraries as well that use xenctrl, when a more suita=
ble stable interface exists in newer versions of Xen that they should use i=
nstead.

Perhaps a compromise between the 2 extremes would be for xenopsd to open an=
d have its own xenctrl handle, even if that leads to some code duplication,=
 it would at least not rely on an undocumented and unstable internal detail=
 of an already unstable ABI. And that would still allow xenopsd to extend x=
enctrl with bindings that are not (yet) present in Xen.
What do you think?

Best regards,
--Edwin




