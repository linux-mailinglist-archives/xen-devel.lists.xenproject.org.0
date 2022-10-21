Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC05606D1E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 03:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427242.676100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olh3d-0001Js-UZ; Fri, 21 Oct 2022 01:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427242.676100; Fri, 21 Oct 2022 01:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olh3d-0001HP-NK; Fri, 21 Oct 2022 01:42:45 +0000
Received: by outflank-mailman (input) for mailman id 427242;
 Fri, 21 Oct 2022 01:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gujA=2W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olh3b-0001HJ-LQ
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 01:42:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a607f860-50e1-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 03:42:40 +0200 (CEST)
Received: from AS9PR06CA0268.eurprd06.prod.outlook.com (2603:10a6:20b:45f::19)
 by GVXPR08MB7677.eurprd08.prod.outlook.com (2603:10a6:150:3f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Fri, 21 Oct
 2022 01:42:26 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::89) by AS9PR06CA0268.outlook.office365.com
 (2603:10a6:20b:45f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36 via Frontend
 Transport; Fri, 21 Oct 2022 01:42:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Fri, 21 Oct 2022 01:42:25 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 21 Oct 2022 01:42:25 +0000
Received: from ec79e479841d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6018516B-0CB9-4206-9FF6-36523138E467.1; 
 Fri, 21 Oct 2022 01:42:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec79e479841d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 01:42:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8270.eurprd08.prod.outlook.com (2603:10a6:150:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 01:42:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 01:42:16 +0000
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
X-Inumbo-ID: a607f860-50e1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fHmTPnNrd1F121E45dE5ELJ8Ynas+Dr7YxUWQwWOGXI+lZF6UENWibwVI8ZfKc61FzVETfy57CKEvU4P8CWdf1L4lFZnPTLupxyNgpdFgzlPbdQ9cHACvSpQG6BExdMIUwKya0cbmYcviXZ2hqJ7WdQdiBJFg9EFaPhSdXEpaZ5bFKSXt6RrlGIRkwPFbZxhZolLAUgbYoo0PaaGHxv4FTO0pluBuQOXpWYoxsjfKAoWVPCn5lh3ncAqm566JXxqUuv2F+kAiFAMWxgPXb1VbH7wIMlVh8oKaXI1+UkHi64k91BEQU5kDOHPar0OigLanMea5xtP8dPXKZNtj93pKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/1RPnpsGavWjGJhRUzThYIsnin48ASuOThSJCsGEbc=;
 b=HTR9byBsRv3n5Ys0Y17mcCXYieAH2K4cxzeWknMTfo44nBD3Nhv3caoLLvinRKMSNBASKQ51nZx9SdvRK7zdAjZ1bOvYi3bVOlEB8qabA8cWBt1WevIPgo1bkM06irMMoGwzZRIex6xD9qEa1z5+UArYaqWHoGQHPx6k+Dsh/SdPmx/sun0Mlsxs0HGDvWStrJIvbxSA8KxP1YzXXMtJHWqMKVePI2pR6GFv+tqEvc18EfN1lnaVZ2w9vjz35mbd8Bqe2dBNQ2Vxv/aE8HvwHeu288ucYSiQ/GbG5mL6dMdB6oGly9QRfr7mEcWEZ2M2wxCXa1m1E2AkBZcLLZgIBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/1RPnpsGavWjGJhRUzThYIsnin48ASuOThSJCsGEbc=;
 b=5IWgGUhuafxXs+t1HpXeUY1S8QzAKeNrsP1GbXxWlUeE7vNsMpz3s0Ev9Bk3wsHAAQ/t/OBcS6S/TYae9+YgshCflo4sjcWmKq963JDx87QD919+6afzFl2ekLoqh2dYAVPYpi7zSe/ZHbTbbTpO5ZSJUNwxAAJ/Ue4F6iBDaJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QH4XRpZxX3dSBuc8KVXnSXLYis1I/5wiNDC0dIjTRrAX9s+a302h+MJaBtQjVkUMo37lR/tkHeeu5Z+RGm8SuUXTgjFT7LaUfDXgg7RlksC/6j/vXyaSQObVFg4FG3ob5bLp9yzH1KEHBEePKHY6RxBZFLvLYYliw68TbsEyWvE69yJ1aqhdQtQu6RwCj0tQR8BpnETpH2qB/ys3vuXGJVZvGH9L9mzbhLzZg6A9CRacsj1H8mz1Eghx/s+LSvxWGJ+qEo1NPE4xPXRf6mZZ1UPYfIdBvo5NksdYRDKa3xxzKMeQi4eUlLq4cDExbE4sZ4CRvpeX4Rk8RP1nwSXb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/1RPnpsGavWjGJhRUzThYIsnin48ASuOThSJCsGEbc=;
 b=Sme/Zem0aQxXPxD+hpKHnziP7hm7euYHR1j3xtRvLRmItQSjnMiLUrRtzHD2ImpjoMXb8mVtpAqoiPUEC+Sc3yIl2jo/wCo4fxKU5qYzVDx3yz/0nrb22k3gPCtV5CGSKOUTQ3aMLSX7rBpA/vANVMaNbuUdou43yaXzisyEYQBMY8ytisZkdOCXy1WnsxkYNX73drCzlRHZ192+pBVG2YUAPrFnYjy4nQdN2/9drNsgfq81N3fE8Pev36iEvs+JNpFktGE1+zVdvsyG0S7yqoJ4q9IMd+22yXv4J5BLZoWjJA5qfKux+gMGzTtqJDKmDvcz5AWHBkgn9HY7gBspLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/1RPnpsGavWjGJhRUzThYIsnin48ASuOThSJCsGEbc=;
 b=5IWgGUhuafxXs+t1HpXeUY1S8QzAKeNrsP1GbXxWlUeE7vNsMpz3s0Ev9Bk3wsHAAQ/t/OBcS6S/TYae9+YgshCflo4sjcWmKq963JDx87QD919+6afzFl2ekLoqh2dYAVPYpi7zSe/ZHbTbbTpO5ZSJUNwxAAJ/Ue4F6iBDaJ8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [4.17] RE: [PATCH v2] xen/arm: p2m: fix pa_range_info for 52-bit pa
 range
Thread-Topic: [4.17] RE: [PATCH v2] xen/arm: p2m: fix pa_range_info for 52-bit
 pa range
Thread-Index: AQHY48oesrLPZOyAMkGfn+0zDPtusq4Xl4aAgAB9ksA=
Date: Fri, 21 Oct 2022 01:42:16 +0000
Message-ID:
 <AS8PR08MB7991AE87BC1FF9E47A3F9F9D922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221019144913.291677-1-burzalodowa@gmail.com>
 <c3ecb453-ac2e-fd0d-d5ca-3f485d7f53a3@xen.org>
In-Reply-To: <c3ecb453-ac2e-fd0d-d5ca-3f485d7f53a3@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B0FD4328577CEB46B28E98B29835CB00.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB8270:EE_|AM7EUR03FT030:EE_|GVXPR08MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: cbba477a-3cea-4326-ab0b-08dab30581b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 s80SzlepkNCAVKC5b8ziX3NnJaPvbGcD7jVi55bM0mvked2Sz6S5pYETM518E7INcyGT3DXu2u0f0rXNW3J9QZeDnuLE7y7LsYbCEBzpraPMGtMpuJwy/4Yi0+rdrdyrkouBinnVE6r4cC06cX4kdZ2rDp/1VNebZGAwtiws2qYePMAwBBCsF4u4cGR/0CYsSa3J2i6IYPTBPao8wVkpfp1sn6A/BKOcP2kxuHn+KI1ash97zZve4TanxQJZLG1zvmoDlKxX+aKGauvW6GlHc+ECXfsMX7q/WMliyl8xAxe+ftgiikfrtcX8BVebQeFrMBLjQF+ulJKMozXbhyEluPsggi+v6U7M3An1Pm1E48otr8bzw6dQkZU8plO+3ch3A37obp1acv8h6Pyzw0ssit8bbvkPN5bilo9i2Ae+15U/2f3Flqp+7UDcjKjHBG8++6T5IbVzGSbF9FpVmU59n3XzlshHB534cRjnfpcBkSATn6bGcOSDRnXmGEPPhaBRIhGNAyA0n2Gle5kY8CszaMm81JQ9Cr0oC+N4Q5pIkH5knpq6n1OAqqncvFn1x25YLgRA+pjGJl2bpENqcOkelUX7XN7fXtJth9yB/f0HNNARvN2b1TKrR5WTH5YhwWTiJZdKlPkv54nmFi9LJ7GG12y4KxdtEgoLudBIBnjSO3XG8hOZIV2lEOeP7tDPkiPVvFWT5j/oCwpxDbECx5P6ySFLSY/QvmDtrSYsc0P1uk89KWkJbYnf6d8jUsJMKdAsvZtmnLIOihk3Pcmb2AKmHw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199015)(6506007)(186003)(7696005)(83380400001)(2906002)(5660300002)(9686003)(26005)(55016003)(54906003)(76116006)(8936002)(478600001)(8676002)(71200400001)(64756008)(52536014)(66476007)(66446008)(66946007)(4326008)(41300700001)(66556008)(110136005)(316002)(53546011)(86362001)(33656002)(38100700002)(38070700005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ddc5056-b1f3-4186-1f2b-08dab3057bed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j6Jl6D1yjf3VMa5jDqhRllUC4NTaKMI2q5arVS8IsV39NPJRsNEHHHyUSMC+BeCLlXJOgD4NvlE9oMRnMyHdEBdM9dxXPNS662O864Buuq3xtU2hvyuNXpzRuaQFTqE7E492BmL91FdWmkZb+PzfzcPtQkZoyyUSqHLOK0dcWTHH1SNRO41gviuDX8Le/VSW0LY5rfVyJHSBSfFUXcQe2APh5oKaeBJ96MzE6zZlcJZJw4uzGctZplvEnMqygntUXysPjo65DUKwq9tU2ZLYszEKuHHe7rN6XMZ5fX02c918jm8ek64XhfhJEOFV+o1ahCkaZJZpQ19uYz+dHHRZ3nfGTCPkNIpKfMwUC52OPGUj/JgoJCiyb9vZvBwauH7cYJnxE64PfQNt7j4P4r9gEFQ9IdM1E72tWJFX6QWmCrBaW846n7lqcpIVos5fKIf+6FWAaBJOmIZ3N1ZwJTyFC5LPrPxLOhysF3eN38irlYYS8wEkdknmI9GbWltJ9OOx/RJlvBg6uBiJN0bXf3HGSfU9cbV9ZeJsI18PiuJGez1zRdJgxMQwvgzBrlCM2AnxvbwHNx2mkKVzwETpKrwt1KXSXL8aETqKK3YjvDkydyHsMEimXnO5+x5Ebtj37lnf56VvhExU9EfWHYazrGECnzpwcJBBmGPCApccIjyFC1c1rGj1jD6uJgfowoDPlujDqZskPpEI2cmSM49unj/2v+3TgpUiaxXlWe6qTv2rrELnIFtOxEX83uPgbLZPEesVhfL3ywX1tdMFp+MAopvulw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(186003)(478600001)(26005)(41300700001)(53546011)(336012)(40460700003)(107886003)(9686003)(6506007)(82310400005)(4326008)(33656002)(52536014)(8936002)(86362001)(5660300002)(47076005)(7696005)(54906003)(2906002)(316002)(82740400003)(40480700001)(110136005)(36860700001)(55016003)(8676002)(81166007)(70206006)(83380400001)(70586007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 01:42:25.8031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbba477a-3cea-4326-ab0b-08dab30581b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7677

SGkgSnVsaWVuIGFuZCBYZW5pYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA8Vm9sb2R5bXlyX0JhYmNodWtA
ZXBhbS5jb20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjJdIHhlbi9hcm06IHAybTogZml4IHBhX3JhbmdlX2luZm8gZm9yIDUyLWJpdCBw
YSByYW5nZQ0KPiANCj4gKCsgSGVucnkpDQo+IA0KPiBIaSBYZW5pYSwNCj4gDQo+IE9uIDE5LzEw
LzIwMjIgMTU6NDksIFhlbmlhIFJhZ2lhZGFrb3Ugd3JvdGU6DQo+ID4gQ3VycmVudGx5LCB0aGUg
ZmllbGRzICdyb290X29yZGVyJyBhbmQgJ3NsMCcgb2YgdGhlIHBhX3JhbmdlX2luZm8gZm9yDQo+
ID4gdGhlIDUyLWJpdCBwYSByYW5nZSBoYXZlIHRoZSB2YWx1ZXMgMyBhbmQgMywgcmVzcGVjdGl2
ZWx5Lg0KPiA+IFRoaXMgY29uZmlndXJhdGlvbiBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHZh
bGlkIHJvb3QgdGFibGUgY29uZmlndXJhdGlvbnMNCj4gPiBmb3IgNEtCIGdyYW51bGUgYW5kIHQw
c3ogMTIsIGRlc2NyaWJlZCBpbiBBUk0gRERJIDA0ODdJLmEgRDguMi43Lg0KPiA+DQo+ID4gTW9y
ZSBzcGVjaWZpY2FsbHksIGFjY29yZGluZyB0byBBUk0gRERJIDA0ODdJLmEgRDguMi43LCBpbiBv
cmRlciB0byBzdXBwb3J0DQo+ID4gdGhlIDUyLWJpdCBwYSBzaXplIHdpdGggNEtCIGdyYW51bGUs
IHRoZSBwMm0gcm9vdCB0YWJsZSBuZWVkcyB0byBiZQ0KPiBjb25maWd1cmVkDQo+ID4gZWl0aGVy
IGFzIGEgc2luZ2xlIHRhYmxlIGF0IGxldmVsIC0xIG9yIGFzIDE2IGNvbmNhdGVuYXRlZCB0YWJs
ZXMgYXQgbGV2ZWwgMC4NCj4gPiBTaW5jZSwgY3VycmVudGx5IHRoZXJlIGlzIG5vdCBzdXBwb3J0
IGZvciBsZXZlbCAtMSwgc2V0IHRoZSAncm9vdF9vcmRlcicgYW4NCj4gDQo+IFR5cG86IHMvbm90
L25vLyAoSSBjYW4gZml4IGl0IHdoaWxlIGNvbW1pdHRpbmcpDQo+IA0KPiA+ICdzbDAnIGZpZWxk
cyBvZiB0aGUgNTItYml0IHBhX3JhbmdlX2luZm8gYWNjb3JkaW5nIHRvIHRoZSBzZWNvbmQgYXBw
cm9hY2guDQo+ID4NCj4gPiBOb3RlIHRoYXQgdGhlIHZhbHVlcyBvZiB0aG9zZSBmaWVsZHMgYXJl
IG5vdCB1c2VkIHNvIGZhci4gVGhpcyBwYXRjaCB1cGRhdGVzDQo+ID4gdGhlaXIgdmFsdWVzIG9u
bHkgZm9yIHRoZSBzYWtlIG9mIGNvcnJlY3RuZXNzLg0KPiA+DQo+ID4gRml4ZXM6IDQwN2IxM2E3
MWUzMiAoInhlbi9hcm06IHAybSBkb24ndCBmYWxsIG92ZXIgb24gRkVBVF9MUEEgZW5hYmxlZA0K
PiBodyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWGVuaWEgUmFnaWFkYWtvdSA8YnVyemFsb2Rvd2FA
Z21haWwuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpv
bi5jb20+DQo+IA0KPiBSZWdhcmRpbmcgNC4xNywgSSBhbSBhIGJpdCBzcGxpdCB3aGV0aGVyIHRo
aXMgc2hvdWxkIGJlIGluY2x1ZGVkLiBPbiBvbmUNCj4gaGFuZCwgaXQgd291bGQgYmUgZ29vZCB0
byBoYXZlIHRoZSB2YWx1ZSBjb3JyZWN0IChub3QgdGhhdCBJIGV4cGVjdA0KPiBhbnltb3JlIHRv
IHRyeSB1c2luZyA1Mi1iaXQgb24gNC4xNy4uLikuIE9uIHRoZSBvdGhlciBoYW5kLCB0aGlzIGlz
IG5vdA0KPiB1c2VkIHNvIHRoZXJlIGlzIG5vIGJ1ZyAodGhpcyBjb3VsZCBhbHNvIGJlIGFuIGFy
Z3VtZW50IHRvIGFkZCBpdA0KPiBiZWNhdXNlIGl0IGlzIG5lYXJseSByaXNrIGZyZWUpLg0KPiAN
Cj4gSWYgd2UgZG9uJ3QgaW5jbHVkZSBpdCwgSSB3aWxsIGRlZmluaXRlbHkgYWRkIGluIG15IGxp
c3Qgb2YgcG90ZW50aWFsDQo+IGJhY2twb3J0cy4NCj4gDQo+IEhlbnJ5LCBhbnkgdGhvdWdodHM/
DQoNCkkgYW0gYWN0dWFsbHkgbW9uaXRvcmluZyB0aGlzIHBhdGNoIGZvciB0aGUgc2FtZSBxdWVz
dGlvbiB0aGF0IGlmDQp3ZSBuZWVkIHRoaXMgcGF0Y2ggZm9yIDQuMTcuDQoNCkkgc2VlIG5vIHJl
YXNvbiB0byBleGNsdWRlIHRoaXMgcGF0Y2ggc2luY2UgKDEpIHdlIHdhbnQgdG8gbWFrZSBzdXJl
DQpvdXIgY29kZSBpcyBjb3JyZWN0ICgyKSBJIGFtIHByZXR0eSBzdXJlIHdlIGFyZSBub3QgdXNp
bmcgNTIgYml0IFBBIHNvDQphcyBpbmRpY2F0ZWQgYnkgY29tbWl0IG1lc3NhZ2UgdGhpcyBwYXRj
aCBpcyBqdXN0IGZvciBjb3JyZWN0bmVzcyBhbmQNCm5vIHBvdGVudGlhbCBoYXJtIHRvIGluY2x1
ZGUgdGhpcyBwYXRjaCBpbiB0aGUgcmVsZWFzZSAocHJvYmFibHkgZXZlbg0KYmFja3BvcnRpbmcg
dGhpcyBwYXRjaCB0aWxsIHRoZSA1MiBiaXQgUEEgd2FzIGludHJvZHVjZWQ/KS4NCg0KU28gaWYg
eW91IHdvdWxkbid0IG1pbmQgY29tbWl0dGluZyB0aGlzIHBhdGNoLCB5b3UgY2FuIG9mIGNvdXJz
ZSBoYXZlDQpteToNCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bh
cm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAt
LQ0KPiBKdWxpZW4gR3JhbGwNCg==

