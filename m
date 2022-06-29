Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1055FCF6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357730.586495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6UlV-0005j7-12; Wed, 29 Jun 2022 10:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357730.586495; Wed, 29 Jun 2022 10:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6UlU-0005ff-U1; Wed, 29 Jun 2022 10:17:44 +0000
Received: by outflank-mailman (input) for mailman id 357730;
 Wed, 29 Jun 2022 10:17:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYaO=XE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o6UlS-0005fS-Fn
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:17:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60081.outbound.protection.outlook.com [40.107.6.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b52b0d36-f794-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 12:17:41 +0200 (CEST)
Received: from AM5PR0601CA0049.eurprd06.prod.outlook.com (2603:10a6:206::14)
 by PR2PR08MB4906.eurprd08.prod.outlook.com (2603:10a6:101:26::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 10:17:38 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::b9) by AM5PR0601CA0049.outlook.office365.com
 (2603:10a6:206::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Wed, 29 Jun 2022 10:17:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 10:17:37 +0000
Received: ("Tessian outbound 8dc5ba215ad1:v121");
 Wed, 29 Jun 2022 10:17:37 +0000
Received: from 05c6941b7347.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BDDF4AB1-E719-4A1B-BE35-2BEB0FC891A3.1; 
 Wed, 29 Jun 2022 10:17:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05c6941b7347.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 10:17:26 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM0PR08MB5121.eurprd08.prod.outlook.com (2603:10a6:208:159::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 10:17:23 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 10:17:23 +0000
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
X-Inumbo-ID: b52b0d36-f794-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dbTafGI7X/aPOh86vlTwnVhXTZm4Vz44HP7IOX0XI3nhLhL/NuXlM/JyK9O/Zi6z6kKTRMLTc1+d8vNWWkIl8sDrnE4AkYL3yoM8NVr8WTpePBp50cppwxcm9lLdg8hamoWDE81jWlKqQTEReBrmvAnXOrS2RWPxjIa5J0XrLO2U7vwrKjYSUOUalgW5o4EHU1/T8YoLp+EEjMB17UGabhBwkYsS0MaYxvK6kUHFwLSK8KDJfjjdmP3RWK/FjftIr4tO4WHgpP4O5McjpRTrBYpNBfiVCVxKJf5T304/uSIJfm9xQQ5qWowE17n61sz7rLqJ+e4zExizKImFLr0eew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcGUSuPHhnQgSx9IullrdCyPRozCK1d1d6Rs9UquELs=;
 b=mZCJQxLnCgnYrH32gYXS6S5/wCbaJ/awdCTV7cSmkBB+cfuSs0P3af2bKzVaowl633PHOFBAAhDbQd9bdPp/lAAxfZVRoIBS5lwbBk3SS/U+xeP6zONXIGBG/pXnhrRsd3IsoZJ6BR06ms51OYGPQEkfnS+qjYFbW6BQnyhqpQUEFu8y65wjljuEyxKk+lLvRck/tnVahHZHJOXIbYwTCQq4K0H6+S5zuL45BE+R6eplYYlcZ18vwhgOUXdhgnHFUDFDXHgcFvUtPa2oFdFagRoLKzAV7KO6qfrHuF9g2zqJgDe/ZciDekJoI+O0rv5SlTfaemJkthRFubiop9De8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcGUSuPHhnQgSx9IullrdCyPRozCK1d1d6Rs9UquELs=;
 b=AW+UbgWTyZFlnfTruZvldZKbE/qQawGTheHleDORsBP3L+G3pfYz+Ujqgz/ZJuDDZbPY43jF6NV9p1raEogBGka55fZqWuVw89dyU9ulnAjHCyg605ikfi/AJGVPIC20gUDpvkR5nB2O7XHfQMEf1WLJq/Ltw+zXeqvT7XifdOc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3364c7aa79bf3648
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/OJ/ticixNXHoiRg2ZC0aeX1gvmbkE7lvHbELYco/hVkdD6FHeUMEaV8IjnRVL+diV1s43EgaD10R9bC6EUJzlRH4XS14HpbH/kfwLCiu42YoJNETR86pjU9VBLkczo5sreX2y/2gUoe/rH+gqqAQFyjBGKPLdWgn8vy+BX8ttumnK0ZfUqbwa8IVabyRm4hStpqSsmFhPXLXrws9dGEuYRmytgm/S1X+ZtUYE4oYn2zfv6WWQEiTLCb34hy5uyHUbvg0GzXOGr9KeZQWG+maCI8d/kvmKsX82aBSwqJo4bWKxScjycr1w46isHknsfRnP4xv9y+FWufkvP0FJ2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcGUSuPHhnQgSx9IullrdCyPRozCK1d1d6Rs9UquELs=;
 b=T6usdIdeyXPmTQW5gkP46H692M3RksshRxmxXm69foPlIkW+SaAhyl88Ntim1e1bDhyTEezZCiIMXy+4GW8/u3i2Wu3obYBLwtZkk2to1kXBmc+1dBtcjwkcRan7klgJryH1VJ28TuKJExEeCqeTbqQjHzQ1I90KZ5eC9zVt22hud8+tILTMp9SXRCedEuVI11ZGVoIcN9t/461uhHcXBkOmhFt327cqhEbPG2yktPCSxNLTVPaDAjX3bMnf6P7Jpi0UJ+TmuUdEAuXxwnvlyamEiJ8EdGbDWlDNIk9hnszym7jVDtFgL6aEWzrKfwDPnZksh5Vt+PFG8ogD2SJgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcGUSuPHhnQgSx9IullrdCyPRozCK1d1d6Rs9UquELs=;
 b=AW+UbgWTyZFlnfTruZvldZKbE/qQawGTheHleDORsBP3L+G3pfYz+Ujqgz/ZJuDDZbPY43jF6NV9p1raEogBGka55fZqWuVw89dyU9ulnAjHCyg605ikfi/AJGVPIC20gUDpvkR5nB2O7XHfQMEf1WLJq/Ltw+zXeqvT7XifdOc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Topic: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Index:
 AQHYh7nJHM8+T3fZ/0Gr0RGCgDxGeq1eaYGAgAALcICAAARSgIAAFXiAgABAfoCABidzAIABPG0AgAAASgA=
Date: Wed, 29 Jun 2022 10:17:23 +0000
Message-ID: <B0D23F89-5368-4B21-946F-318A35743CB3@arm.com>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <15F23829-3693-47CC-A9D6-3D7A3B44EB64@arm.com>
 <88bd7017-e2b3-59f3-a68a-25db9e53136d@xen.org>
 <CA8DFF26-3D7F-4CDA-9EDC-E173203B2A51@arm.com>
 <81c33c8c-e345-2fe3-32c6-2f80799eefd0@xen.org>
 <C7643376-EBD0-46C3-B940-D3F6198BD124@arm.com>
 <57926957-8bdd-d62b-55fb-47874dc51cdb@xen.org>
In-Reply-To: <57926957-8bdd-d62b-55fb-47874dc51cdb@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ff744ac0-9a22-43ae-2450-08da59b89773
x-ms-traffictypediagnostic:
	AM0PR08MB5121:EE_|AM5EUR03FT054:EE_|PR2PR08MB4906:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h0FkHBLyq1HrUAGCae/T2oGU4QzqKIbIXflpCnvR/Y4ApZkWaueoAxjmxb0iB1MW5N/S+eYG5VJr+uF78YjQwUqcmGMJqtGDsWn/Qb4vxMiw8jvZXiKdSlMV81LNKA91P5Iw2oEtx0d6hN1Fa8/r6EjTPdDnPvmW75WlplrUcPFiG0nAQY+19wBjj0ubZutisr4svXrTh7QPfBVfzv9Qr6BF9oadf7XWa1qu/vPhawD99NDXRqexvz1Ou0Y4Za44nLo0fwBdiWxTw/K9TvqNIvwHMjBCQnHfhU5S/O3ZjfPaT7150VCYtR+56JlH7vZDbXCVANTqoVboqYQH6KhVQ5jEQ3PNPk3s9mBBYkrJ/UmiJoGGW2JAQ1sjwSE4g/IUgRLO7m8+lUyrqCA2eZ4u19avs/bJosSgVNzAofB0S/2YnvwE4I1OtO4k8bdo9TfrgJaia8YWOCw7PD7q43CWE44n4kYhdVc09XG4980BZeFKDtO1aLzqiN+KzSu9F+E0mRG2RrFQgQ9Et/3gpIP8Jq/JxNsXW2+NrdoHm38S932PvRNgQ9S0hW+IQyiBhJs5+2nFgEaBFVceW+fPAtIXp4hrsJ6FDn8UKgZ9fv8S+3HR7B8NV+6AZuznd0NbBWsRtnanGYbSFJRjynsXLvIeasPTWL5ZKZ2c6ZZFkNVYGStq75zFnv4Afp3sghHSlAuxmr4Vzgs7FSc5cB2ngk3TS2lX+reNO2RUbQ30FihsbAq0353CCtxtk4Tyad1vxbIMFJ0TgvayDIJIUz4DoJOOrZXA48djoK15t9LtftGYopdun54Yv/2RmAtY9db07KR4dslxl3YIWi4Frzj+2FfCjA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(53546011)(4326008)(478600001)(5660300002)(8676002)(6506007)(41300700001)(33656002)(38100700002)(122000001)(8936002)(86362001)(4744005)(64756008)(186003)(2906002)(2616005)(26005)(6512007)(6486002)(66946007)(38070700005)(66476007)(66556008)(66446008)(71200400001)(54906003)(36756003)(6916009)(316002)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E80F210F494584394C2D087010AD989@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5121
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7245242d-4640-409c-f260-08da59b88f18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EALp66/6UswPUESvqOmk6biM+ji3Cr+rwDqeWBMM4AclzHB27mdYKOT89VNWtkTw9ul21cVopaYv+zy/RTTbkg2S2vINafj3Whu2rdGo2C0Dbr56UJTse4r+OdqFf9jrenuIcaXqo2xGHgxQ/w47Vn5zKbToX9/DMWiLj87dd0kYHFGP7HkGzissBeigayxNWrUG+RMvG3OtOgeJ7CizK8GTgu8w0ACQrdS2/X0FmYM65Zcd4tJxO4YtMiQOU6SoRGYm/DaCQMO9rSdAYqUXyK8sjY8l3Fb4z2NUYSH7tMxi4KQW284TlFGLXE3ABe5h8scJuk3LauamHnCnY0PoWdvQYyuOuJOmrtkKQ5lojYEeXVNEtqUPXWpS1leV08AP58HIs/9VJ3aLkyxLDCecIQObMFvK1pyqVHSPQRpp5sbEw26EDvGQOiN3rnP5+Rc3O+S1oyXC6LSwYziM0fe/gmtkEfo31rLXaBeWSFoRq3/Gt1yo0sOaTKPONu5+qDC4+YmuIYovJ6dy4KfqV7B4WzcDS1tYDZisWkrwxpxvkVZ+upN+V/x/JMXeHpmJnf3W7spfsbyC4D4medfsFzyt8KUvRzKm7fO3Hb9tYpcvdLpTI5SLRyC7dllXUZpNrNI6narjF1B2N/19vln9QoavcfedNgDW7Cgw1NjL3q5CoFHFqfj6Ofp224D306IAL+kgH24/qqxju2ridZz7dF69V0IqIRsIG+qs/FuI4Cnr97e57apj3bgpsJ2uwdTs2NIl0aSy+qclqiD78Y43qF2gP9EE+mBVga7lFD3K1Qzm/al46J85ovcgR/1/QKi6aahy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(40470700004)(36840700001)(46966006)(82310400005)(186003)(6862004)(478600001)(316002)(81166007)(356005)(336012)(40480700001)(8936002)(36756003)(54906003)(47076005)(2616005)(40460700003)(53546011)(4744005)(33656002)(6486002)(86362001)(2906002)(4326008)(8676002)(41300700001)(26005)(70206006)(82740400003)(6512007)(70586007)(6506007)(5660300002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 10:17:37.5502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff744ac0-9a22-43ae-2450-08da59b89773
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4906



> On 29 Jun 2022, at 11:16, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 28/06/2022 16:23, Luca Fancellu wrote:
>>> On 24 Jun 2022, at 18:25, Julien Grall <julien@xen.org> wrote:
>>> On 24/06/2022 14:34, Luca Fancellu wrote:
>>>>> On 24 Jun 2022, at 13:17, Julien Grall <julien@xen.org> wrote:
>> Sorry for the late reply, this would be my changes, would you agree on t=
hem?
>=20
> They LGTM.

Thanks, I will send V2 soon.

>=20
> Cheers,
>=20
> --=20
> Julien Grall


