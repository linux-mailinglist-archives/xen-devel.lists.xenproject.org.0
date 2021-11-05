Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94725446537
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222445.384635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj0Wl-0002AG-AB; Fri, 05 Nov 2021 14:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222445.384635; Fri, 05 Nov 2021 14:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj0Wl-00027X-6s; Fri, 05 Nov 2021 14:49:11 +0000
Received: by outflank-mailman (input) for mailman id 222445;
 Fri, 05 Nov 2021 14:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQ27=PY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mj0Wj-00027Q-Hv
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:49:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87964bf2-3e47-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 15:49:08 +0100 (CET)
Received: from DU2PR04CA0217.eurprd04.prod.outlook.com (2603:10a6:10:2b1::12)
 by DB9PR08MB7083.eurprd08.prod.outlook.com (2603:10a6:10:2c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 14:49:07 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::79) by DU2PR04CA0217.outlook.office365.com
 (2603:10a6:10:2b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 14:49:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 14:49:06 +0000
Received: ("Tessian outbound c71e1a752bff:v108");
 Fri, 05 Nov 2021 14:49:06 +0000
Received: from a18893f522ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 635C5986-293A-43AD-B6A6-13EF2E031ECD.1; 
 Fri, 05 Nov 2021 14:49:00 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a18893f522ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Nov 2021 14:49:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4264.eurprd08.prod.outlook.com (2603:10a6:20b:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Fri, 5 Nov
 2021 14:48:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.023; Fri, 5 Nov 2021
 14:48:59 +0000
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
X-Inumbo-ID: 87964bf2-3e47-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yb9cHsz5nA2sjAqdyO5YpbFgoJdxUPeYCL/2YE2yDBA=;
 b=RwUwwgsqaef3xoqhObZ4S7sRMEFwZgkaDl4Bs51DyBfydWJCKmWbOHA7P8Byh314wKYSbjmFkDuSAi9wZc4RBbn0JszrBov7ieGs2LWT1xmU2/X0CezsEqMAO391uPs6xxU7QjKy55Dp+cmFkutuGVWAZr8svocFMCtr9gGlFQs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8384e98c0cde9658
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgbCG7RU/emrwCRVBuf5aZcxc2T1JfWrbL00UvIBGxEKoOld944ie9URVPTt6aG/xq8EEq2weEuzubtfKBKLO9SvxNupCddx43U8R+VmDUUV944JIykz90bnVL09kyEvr4Hg+0Wl3LhSbg4EQ8+lWfsgmV4PjDerwiQuE9WE2ALlwSgL4FrZ520a7hIFLqa1Y3CcPHFvjeoK3Ly8JszFOH7Jp05HnUhEBbB3aYm7MZ/s7Q+5wp8XXOu0a/961sPZrf+CmjdZDrHKA4UZNX3Pr2lSJ8Q1rPClZyEDOrV8EhrN6+sWSTySru5lg3WRT+mhexkLNrAZDZAWsMoJJW97hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yb9cHsz5nA2sjAqdyO5YpbFgoJdxUPeYCL/2YE2yDBA=;
 b=mWxggqXTQO7oXV0CtI0OBKVOzeMc+voIFCDRrzb8MI1mEqtGV/+XPUt677Lg0KVI4Atpxf3FKvXHH/Eno1Q7nb0Q3xTsWAawOzXQsVowdSs5qXotTkNTOOMj0ALh/0SEZFKT9uGNgz0xgZMkDFhhVlXXhnPyWp3HdpDmHQMxT9kBId+ZdGfRpYoaPmm68FzZePYtz692GLsbMXWeKX2gttoNx7XoFDTAyc3qFdFYJCPXCYapgdIegqM2FSyIOTkEMN11AUrGUZtn93TFhn6uKVWQjhDUFTBTOlPPbQOZkpR0ep8w6ciIuy9tugWtcfMAbWchAAvU7zldG/fmzxRVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yb9cHsz5nA2sjAqdyO5YpbFgoJdxUPeYCL/2YE2yDBA=;
 b=RwUwwgsqaef3xoqhObZ4S7sRMEFwZgkaDl4Bs51DyBfydWJCKmWbOHA7P8Byh314wKYSbjmFkDuSAi9wZc4RBbn0JszrBov7ieGs2LWT1xmU2/X0CezsEqMAO391uPs6xxU7QjKy55Dp+cmFkutuGVWAZr8svocFMCtr9gGlFQs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>
Subject: Re: [XEN][PATCH v2 1/1] Update libfdt to v1.6.1
Thread-Topic: [XEN][PATCH v2 1/1] Update libfdt to v1.6.1
Thread-Index: AQHX0UQblDQwk25oXUS4+EmFAqHUdKvz+asAgAEMUwA=
Date: Fri, 5 Nov 2021 14:48:59 +0000
Message-ID: <38804A99-54B8-4694-AFB0-9AA9212562A7@arm.com>
References: <1636006796-360115-1-git-send-email-fnu.vikram@xilinx.com>
 <1636006796-360115-2-git-send-email-fnu.vikram@xilinx.com>
 <alpine.DEB.2.22.394.2111041546030.284830@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2111041546030.284830@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f8d0f2c4-ec5c-49a9-0a7e-08d9a06b6ae9
x-ms-traffictypediagnostic: AM6PR08MB4264:|DB9PR08MB7083:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7083F86AB35892649E3C074B9D8E9@DB9PR08MB7083.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d1446Ypb/W9L8cB41Tlz2VB1JsZXyaYLAEWd6/Ke7W4+Uqe8eI7a4PLAr89TuLiG599SFYI0kGZrHbe02JphD0GmtAQZiFsYv+wgaOGboFt7sr+aGtChIcJppXm7666Zsk9RNdQ+5dYt0SoblrJwuzKJsCIWkcvAwyRlgKPjnEy9Ea4ZCoSQYJ8p1WktFZbN7BiBpvUGQ8HXyOD+mdI+grPRj2v+iJS1QJncwrg9YlrBpkml4w3RZPJe7PF5ILJyVrgw3/ZJuoGWUP6ZDMmXoe6GQCgC7nZKf7v5MEUgxRNiPQKRYCLIMvI2yu157L2v8cAZ1n3+q3xrkwEZxz2kNiTl/UoB1ngDrzA91Yzj/PJERt+dptVd+6SB0vV8YcXa6Pa6qRFyLa6Esuo9/4EDx0tOhnDCbGBa4ORQMUZVGV3fysDv5LzC5hnFuA1kWgGYtSNLyG1y3RisSEGOZ1bpDVkL3kcgREWMFqS7D2dNIGySf73Wl7i3R6fnyStLEaX6sf2b2e3/Djz5pYGrV6hOxEYkAmor1VqXLvJYWF7C7dE2lUTJviTDX5GEz1AHNAzev7yAp83tQHjbw2xs+2xFf1tFQotqrU7ySSlZXnzEPZ912CCNGAHk1HRtWjPwNorDvBsoQRn4/+B4vOOzHUZ1MbD1+S5jgGIpRW1U/xyLZN2XmJrztD9dQ0DlKsY8jOikKZmlbwE2QDi/yA4mbU/0qpboWOr9ZaxMTQR2J6dEdo9piL3x2OpuQr79uMUoeZPN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6506007)(8676002)(66446008)(66556008)(71200400001)(2906002)(66476007)(66946007)(53546011)(8936002)(2616005)(64756008)(5660300002)(26005)(6916009)(76116006)(6486002)(186003)(508600001)(15650500001)(91956017)(33656002)(86362001)(38100700002)(38070700005)(316002)(36756003)(83380400001)(6512007)(54906003)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E11ED5D6D5FEE4080FCC8822F51F7FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4264
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21ffe196-ee24-4ea2-2bdc-08d9a06b6684
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qzz1J7A+Yxj2/59HHqbdQLD0oU8If98kEUiy75ZGSPwJxl8ruy2WgetyJymJk6YAY4pszo1wiXoD/fd3uY7QZEaFO/C7Ayfc0sZkppnrIJ9S/qn9aXBwWE7hUImFOT1M1v4H1Riv3xbw6iR4lfZzdB7aSfm0OBnQJLqIXtJCdTIHlYWVc3OP1Y6U2I1IkBMrGp/FZlV43z/tRzBtfkxGEcFsKGbopTLoRE7bTSiNOnLDQanyUU6v2zYdOurmEvDdBlvSxjo9GZQxlG4LaA1NZcKN7H0M/XpN7OGDNnmOB/j/CjPf9/S+MM+meNyI89BKMW8YXR0P7KK1dd4KDzmWR7BE73ZVWXKeicbJIuURs/fWnOm2CIgdbWuKOMOgHdRrbs6ght3GRQPl45YJD0ffb1LY6xhP3tffNTLk1YlPw5tdfRLvUy7VNirYuOQbvurcGRQCOiyGwnnFAB5LkSFwPzy91wOAvhmCVwZF1mX9DmsS+eUEuoJlKq22ImEyZFHOiVFjsmNwt/AGv63KDewTRJWl6xd/vFMVKAl2Qe7F7GdNlgfXvGMcTtkHvxHXeVbBvEj5zkx6d0Nu7LaCJ6kHt7/FD7/oc5/XE5QHPG2yaD0elAjEXmFmhbzRNLGwI4vpEuvMtJri4PEE+7y7F+hbWRMeXxa+yS8xhJ7IBhr8lBPOgkb82e4nsrvIcQUyBdUbPZedStRq2ebtalR5lA4WsQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(53546011)(70206006)(33656002)(70586007)(6506007)(356005)(36860700001)(8936002)(54906003)(36756003)(316002)(2906002)(47076005)(26005)(4326008)(15650500001)(86362001)(6486002)(336012)(82310400003)(508600001)(6512007)(81166007)(5660300002)(83380400001)(2616005)(8676002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 14:49:06.5163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d0f2c4-ec5c-49a9-0a7e-08d9a06b6ae9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7083

Hi Stefano,

> On 4 Nov 2021, at 22:48, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 3 Nov 2021, Vikram Garhwal wrote:
>> Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dt=
c.
>> This update is done to support device tree overlays.
>>=20
>> A few minor changes are done to make it compatible with Xen:
>> fdt_overlay.c: overlay_fixup_phandle()
>>    Replace  strtoul() simple_strtoul() as strtoul() is not available in =
Xen lib
>>    and included lib.h.
>>    Change char *endptr to const char *endptr.
>>=20
>> libfdt_env.h:
>>    Changed path for config.h and stdbool.h. Remaining Xen changes to
>>    libfdt_env.h carried over from existing libfdt (v1.4.0)
>=20
> Hi Vikram, thanks for the patch!
>=20
> Would you be able to split this patch into two patches:
>=20
> - the first patch pulls in the new libfdt
> - the second patch makes the necessary changes to make it compatible
>  with Xen
>=20
> I understand that the first patch alone would break the build, but they
> can be easily squashed together on commit. And reading the two patches
> separately it would make them a lot easier to review.

Actually the diff will be quite small and limited to what was said by Vikra=
m
here but will break the build.

I manually checked by comparing libfdt directory in xen with the one in dtc
and could not find other differences than the one mentioned by Vikram or
stuff done before in Xen in the env header which was carried over.

So I would not say splitting is needed here.

Cheers
Bertrand


>=20


