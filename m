Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B482402B42
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 17:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181149.328181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNca5-0005Vw-FY; Tue, 07 Sep 2021 15:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181149.328181; Tue, 07 Sep 2021 15:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNca5-0005U4-C2; Tue, 07 Sep 2021 15:00:13 +0000
Received: by outflank-mailman (input) for mailman id 181149;
 Tue, 07 Sep 2021 15:00:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qx60=N5=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mNca3-0005Ty-BP
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 15:00:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b78e2ed-0fec-11ec-b105-12813bfff9fa;
 Tue, 07 Sep 2021 15:00:10 +0000 (UTC)
Received: from DB8PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:10:be::26)
 by DB9PR08MB6892.eurprd08.prod.outlook.com (2603:10a6:10:2a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 15:00:00 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::80) by DB8PR03CA0013.outlook.office365.com
 (2603:10a6:10:be::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 15:00:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 15:00:00 +0000
Received: ("Tessian outbound 7a08471b1ef6:v105");
 Tue, 07 Sep 2021 15:00:00 +0000
Received: from 2a10722e183a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 016CF1FD-286E-4099-B9C3-8602872EF9F8.1; 
 Tue, 07 Sep 2021 14:59:47 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a10722e183a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 14:59:47 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5612.eurprd08.prod.outlook.com (2603:10a6:102:8f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 14:59:45 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 14:59:45 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0113.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:192::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 14:59:44 +0000
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
X-Inumbo-ID: 4b78e2ed-0fec-11ec-b105-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0ut8YQV8nIB9fjekl4Z/u2KCM0ldFTLssCyvuThFQ8=;
 b=GPAmWs8VKqm3+AsG3QWR6fGs0fDfKjJhtqQgCy+z9ot277xmSBH2JbYs465YO3U8mTtiTFqkLIt/Cz1fcs1XtMNLIQhepLUCKgQo4EEll2UMGXsqxPuYft9TSBp3MKV96306+znATtWT9w5hzIyFOmovw9sMhFG6h+06VqzZc0w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 389f84a7de519024
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHjeyp1Tk8Bt44uKrDdrSON+4CmkXk3u9jS490qUmrPEYBftMGFIA6yD1nwkaemjy/hWIm1vey4CgoButen+4P89EEQ6qlKVayETBVecbFY+zF0PiE3odWayNPQQNcMRlHs8j1XsaP2guBQnT1IiOCaCj9LqHmosjXmaN+Nr2INgQNd8d7zdc7WmuDVzDMYyxi/DjPb0THrYGa9XNYi43+zjbFZJvgmF/aRUzqdZ8tmJ4vLCbd49iEsQ1ja6XmUZMsgVtnaDt5suEFkywJJ8FoGFKQwM38bSXK01cq7JC5gr9tUBfbkSEqvCk1+p/5atDhAUXmI3MuFseSqiThpRSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g0ut8YQV8nIB9fjekl4Z/u2KCM0ldFTLssCyvuThFQ8=;
 b=BG3RXNkExaN28DR+y9MminQvCXEta2BYknxeJBTeBsCthS0nXowWwBn01xdjaIPWHFANmDM7WpM1jC9gkg0khDR0bkP3Y/Q+I6mJtb8w5HdoUGhkmfUydBAroq9EPJzdppAv/+n2vj1a98vbnDMSHVZeP8Mnag41i9rdr7bc6BThCAzONPHDDGxeyJrg8eGsCKI7jWa9bnvUOPzbVrMlIFxtQrwcTbVj0Ft1ME8TR9Wsr5DxTe5wl+Hgj5ejjtduUScRln79cgloTt1kdyvW+/efUJcQz6BFVcouTR38NVyXYR6I92gHz2RBb/LgnZXcfZA5RWJjPyWYArNbn8xI1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0ut8YQV8nIB9fjekl4Z/u2KCM0ldFTLssCyvuThFQ8=;
 b=GPAmWs8VKqm3+AsG3QWR6fGs0fDfKjJhtqQgCy+z9ot277xmSBH2JbYs465YO3U8mTtiTFqkLIt/Cz1fcs1XtMNLIQhepLUCKgQo4EEll2UMGXsqxPuYft9TSBp3MKV96306+znATtWT9w5hzIyFOmovw9sMhFG6h+06VqzZc0w=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <910f2758-cbce-53b0-4e57-4b2a966ce2b3@xen.org>
Date: Tue, 7 Sep 2021 15:59:39 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2ED24B7-CED0-4064-B75F-F42115774C51@arm.com>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
 <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
 <1efbd9a8-232b-b267-fa8e-7f5f1af7cfed@xen.org>
 <5DA71CEF-0ADE-4846-A7BC-B378B95A38AD@arm.com>
 <910f2758-cbce-53b0-4e57-4b2a966ce2b3@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0113.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::10) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c8a4209-cda9-445f-79f0-08d972102a22
X-MS-TrafficTypeDiagnostic: PR3PR08MB5612:|DB9PR08MB6892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB68922FF241B24B933F8F4C97E4D39@DB9PR08MB6892.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PojKJmOLpCAW7HE2c56gpfJ5iIGiqeoGCOggi10p9BRleMAWXW3Nuphre9GN1jGCdNhE7LuJNZLsHl45Hqnu5+n7axcYYDKAFE0Gk/RqoZmTQR7azOZh1kjP5X9iv5qY5MASBzF8ptEBK1nk0BCYxx/axbM5x076eqHJEj7jaj1vSS4KsA7zU2fF7upwcTuf1jjJpqre3LaIC7y98Qavl99TRsWU8KzcAIUt+LrsafFhjsiVqC7EBgzT9sXTULh2klqkUi88zCVR9UQGTcLEgB5wobz9YUB6O+fpNYCJ4mDt1vpubBJ/h3nVWQqQq7pHPbV3LzRXfvn1oe6O/vbalKGgYNMxKOjX078RcaoZipkj6ZPR/sjIloFwtoHPVip5eP1OKGG5R2b9+s2Yw0xOFd3pyqsgAaAJvO0L8XdtsHwwvIOlEQHiaEbl33jnAL7REuRi/gM62WDGNBw/sn+pLm5/9aOzvaX2dJY0BwB2zJn9BJH6IoFp+gZOmk/L6EfZ6svz0z/WkISnaEyVDuVqBggQEAt52rjabOvQKsxjvgCqX/eRSfWgvd5p4PKvazZtWFSXwIY3FvCoutriGKoozMTWaOBG0PZlRWjdkfz9wSFob79nfnnSHhX9sxzlraMFIIPF9Ir3BTd+YrDyqI69lvfrYx4s4jIzUCPbqtWBdaJgWs4SOYkF7Cuvu+gqC8WKsgoh5a3hEBfNpbKaPnYsdajSjypOVsng7oDKibGRfmj7DL/2Kv8SEmDtBdeyx9zB/5AXXzsLfYNz1LD8CyK9wQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(86362001)(26005)(186003)(2906002)(83380400001)(478600001)(6506007)(2616005)(956004)(8936002)(316002)(54906003)(6486002)(6666004)(66556008)(66476007)(52116002)(33656002)(5660300002)(53546011)(6916009)(44832011)(66946007)(38100700002)(8676002)(36756003)(38350700002)(6512007)(4326008)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5612
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63729969-2c5c-4764-9aa0-08d97210212a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GUdGWtaEljibbUCSdnY4z9Hv26jglvwoL7N5JxADmVF6/NreGWkytIQG9zjZ8m8tC8T/jRMpCMF3ByC8m3QJP6Yq4BOsOtWi8u4EjFNRy05exlNwbZ66xS1nOgnIsxTXav3eN+DSSTD1OWVLsYYmqYTBRJKiQj1uZxpDB3cOvCSY62y+ahyOrIOgNBUVBIEwwZ1WCdCSEGzATO1sGUdoZ3jszgaYoP3sCKlkRNfZTdcK13DFBSYplw+AqHNprpbJlnBQTKNoGzZR3ArhhhO84UiYAPZhf0PItqGQInsEkSsY5VHzuvow2O9EzEe1BM3YdHGoGpg5aTH6u2tEwMEancu/UXHJlshApJbm41s8JDeubAts82+EhRxNd+uU2p6J5G0heH7+IDRbBYNinkdbiJW8RZNsSdP8QpnDuI2sz9RP2sarZft6QrF0d5oqjb9CNBh2qV+XuRlonsFVj1gK3kLUANczOC7G8FE6bbKufe963THDNidGufuJxx8InklBEuPXu2/N9kMpWyT9cvv88YTl+zaEhBvpaU2NBy/qSG2JIvX/te2LTxZjAzGZiB6sGnmbHQLhKsLol0ABFjieE8yqekZg42BYAUG0FB/ZAYs+YCeYVUyp3NuanYoPrOx83YBsLs3YP+XyRP5ONYJ8wWNDfUHGrvEk74ZtpCP35u4hq5v3JPVK+LnO24tbmGLwNTnaTcXigCzRZyWLZmWEAvg0kWR+VDIfH4scX9WkHFY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(316002)(70586007)(6512007)(4326008)(53546011)(33656002)(336012)(6506007)(83380400001)(47076005)(2906002)(8676002)(70206006)(478600001)(26005)(5660300002)(81166007)(956004)(82310400003)(36756003)(6666004)(8936002)(356005)(2616005)(54906003)(86362001)(6486002)(82740400003)(186003)(36860700001)(44832011)(6862004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 15:00:00.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8a4209-cda9-445f-79f0-08d972102a22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6892



> On 7 Sep 2021, at 15:18, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 07/09/2021 14:30, Luca Fancellu wrote:
>>> On 7 Sep 2021, at 13:30, Julien Grall <julien@xen.org> wrote:
>>> On 07/09/2021 12:51, Luca Fancellu wrote:
>>>>> On 7 Sep 2021, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>>> What we could do is providing a list of binaries to load and associat=
e a key for each of them. Something like:
>>>>>=20
>>>>> binary=3D<binary> <key>
>>>>> binary=3D<binary2> <key2>
>>>>> ....
>>>>>=20
>>>>> We can then replace the property "reg" with a new property "uefi,key"=
 that will contain the name of the binary.
>>>>>=20
>>>>> What do you think?
>>>> Here I=E2=80=99m lost, because I don=E2=80=99t understand what we are =
going to do with the name of the binary.
>>>=20
>>> <binaryX> would be used by the UEFI stub to load the binary in memory. =
Each binary will have a <keyX> which helps to refer them in the Device-Tree=
. To give a concrete example, let say we have two dom0less domains:
>>>  - DomA: 2 vCPUs, 128MB
>>>  - DomB: 3 vCPUs, 512MB
>>>=20
>>> DomA and DomB will be using the same kernel but a different ramdisk. xe=
n.cfg, would look like:
>>>=20
>>> [global]
>>> default=3Dsection1
>>>=20
>>> [section1]
>>> options=3Dconsole=3Dvga,com1 com1=3D57600 loglvl=3Dall noreboot
>>> kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>>> ramdisk=3Dinitrd-3.0.31-0.4-xen
>>> xsm=3D<filename>
>>> dtb=3Ddevtree.dtb
>>> binary=3Dvmlinuz-guest domu-kernel
>>> binary=3Dramdisk-domA.img domA-ramdisk
>>> binary=3Dramdisk-domB.img domB-ramdisk
>>>=20
>>> The chosen node in the DT would look like:
>>>=20
>>> chosen {
>>>    domU1 {
>>>        compatible =3D "xen,domain";
>>>        #address-cells =3D <0x2>;
>>>        #size-cells =3D <0x1>;
>>>        memory =3D <0 0x8000000>;
>>>        cpus =3D <2>;
>>>=20
>>>        module@1 {
>>>            compatible =3D "multiboot,kernel", "multiboot,module";
>>>            uefi,binary =3D "domu-kernel";
>>>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>>>        };
>>>=20
>>>        module@2 {
>>>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>>>            uefi,binary =3D "domA-ramdisk";
>>>        };
>>>    };
>>>=20
>>>    domU2 {
>>>        compatible =3D "xen,domain";
>>>        #address-cells =3D <0x3>;
>>>        #size-cells =3D <0x1>;
>>>        memory =3D <0 0x20000000>;
>>>        cpus =3D <3>;
>>>=20
>>>        module@1 {
>>>            compatible =3D "multiboot,kernel", "multiboot,module";
>>>            uefi,binary =3D "domu-kernel";
>>>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>>>        };
>>>=20
>>>        module@2 {
>>>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>>>            uefi,binary =3D "domA-ramdisk";
>>>        };
>>>    };
>>> };
>>>=20
>>> With this approach, the change is quite minimal to move between an clas=
sic U-boot boot and EFI boot.
>> Ok now I see, yes this approach can work and can save some code, in the =
current code we have that if
>> a "multiboot,module=E2=80=9D is found in the dtb, the Xen EFI configurat=
ion file is skipped, but if we use the
>> module@XX {} without the compatible it can work, the UEFI stub will load=
 the binary and update all
>> the needed properties (compatible, reg).
> With my proposal, you don't know whether the binary is a kernel, ramdisk.=
.. So you wouldn't be able to recreate the compatible properly.
>=20
> But the behavior of the UEFI stub can be modified. We could say that if t=
here is a "xen,domain" then use the configuration file to fetch the binarie=
s.

Yes you are right, or we can introduce domu_kernel, domu_ramdisk, domu_dtb =
with the same syntax of your binary=3D keyword, that would be enough
to select the right compatible, instead the right module is identified by t=
he string.

>=20
> Cheers,
>=20
> --=20
> Julien Grall


