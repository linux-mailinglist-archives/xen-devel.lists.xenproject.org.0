Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3E55B913
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356415.584633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5liT-0001Ms-7o; Mon, 27 Jun 2022 10:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356415.584633; Mon, 27 Jun 2022 10:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5liT-0001L6-52; Mon, 27 Jun 2022 10:11:37 +0000
Received: by outflank-mailman (input) for mailman id 356415;
 Mon, 27 Jun 2022 10:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nImS=XC=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o5liS-0001L0-Ao
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:11:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85f699cf-f601-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 12:11:34 +0200 (CEST)
Received: from DB6P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::20) by
 AM6PR08MB5031.eurprd08.prod.outlook.com (2603:10a6:20b:ed::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Mon, 27 Jun 2022 10:11:33 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::e3) by DB6P192CA0010.outlook.office365.com
 (2603:10a6:4:b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Mon, 27 Jun 2022 10:11:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 10:11:32 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Mon, 27 Jun 2022 10:11:32 +0000
Received: from 8c687c20eec8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 730414EB-1C8A-440E-B6EF-2F0BEE7BED13.1; 
 Mon, 27 Jun 2022 10:11:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c687c20eec8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jun 2022 10:11:23 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by GV1PR08MB8035.eurprd08.prod.outlook.com (2603:10a6:150:98::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 10:11:20 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5373.017; Mon, 27 Jun 2022
 10:11:20 +0000
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
X-Inumbo-ID: 85f699cf-f601-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=njGKSgIP0WfvPDLQNmVqZTwWt5YymAhtq6I/1PoZd+AejGjBDinr6pocUKmBxa3i6dXnl0qJKoSvnasQjVLv2BFy6kpKSa4U8FAPJhx+A48Qc1XTYeU5u1yVppxSQCIAStEsIDrMKpa+PCzbMIAFEHhGm0o9GpyLs6otzgdj/s9ixpVAecilS/qLCGOX3v7cEggaRk6w18b6XwYWPO/3Z7ieD/CNCoslEGU7ql0uNU6yg6YWm5RwlYrGntVlyva2idHhvi/9JCa7AHM6AEqgUt5zKm7suokVvJzAcpKQOykULZtSD6DG23DD0BcDuOevwTIg2exF90KsZoctQ6gW7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhXiTrf3nYEpPapCSFgPB9m1LKse5UuoW5un3Cv9OwM=;
 b=UVMTA4/P6UCu8iO/JfwOBiDYJI+fPt7DJN84wKAjgAcL5o0BFifmFdKhxPDIVYyKpwl1pZuoNk0Nfk9HDdDGqkWyIjvOH5+UkvCewizj1tnY717AeEUAKU/ovNVPNcsxsQ1piuQxcIUctisHYlgScpiDu4GEWoZJ72fSAfdg5nJ2lev7ZetZtQHIy54z6MQSNHllb69ifUUp3eOdvxTMnj8ZbZ5gIDIcuULtU111U9KBYf/emhBC0/ZBjeldf7oSjDcWFUaD07S4IrmfN8n8PXt3O1L9dyY8ne7aPl+nloKfgyitPcWbyOW7XUNLiN6terXVugAloftm8hZ3mQkwgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhXiTrf3nYEpPapCSFgPB9m1LKse5UuoW5un3Cv9OwM=;
 b=s9bxiqPiVS4kVNWMkloeiQ6jrPxgaQRMObQQv+cHSWMdkMHen7O9BXNkwJ7QkGVQTzeuEMZuHHvNSwdRIBbPz/P+uCTHen+2z77QCHNicVEQ2hbsAP7qgtORlspvDgTatevYWIeMnWI/MrvOJztes2FCuHmhWeCqngRtBvIIWdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqMllXL2D+ogWPEA4yd2387UifqCYavtWBCkvUBF5y+P8Y6LdwHRMOY236lcyGs3H5gFM5FaNp7ankSD0ZLAhMRcKnB2QfbD3kWQ5JisrF4l8bexxSwj8x79+8+xqGg+8UHrnpGUgb349Cr8LuWRiFDaszYb3Vga+skogVg0ihIFU7br2d7WlomLIt4r0vmMVdNq5vS0NCKtgOX8hvoggp13GEjP2r6xifX/whPqT6S/YRHdtZ39kjhVJuA3oXtkiwuKl4ic6ze3MHux/wuzgUD7isShXUPmk26Sce0Vm1GKGTZaKWGAm5gXJ57+VRKi0Ji74JC6epV3Uw3+Jgy0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhXiTrf3nYEpPapCSFgPB9m1LKse5UuoW5un3Cv9OwM=;
 b=imQNvurhoWysBpKd2F/x79vz3/kp2k7gaZs3m+/LSiBP383LRrmU4Oi/FTP7ut1PmyY3I8Y26lAjmi8Z1EKzJNGehd30QDi9pPN3YftsuDLgG15/kyI4GwFjNZbX2wCaW4JUE310ShfeJ2Z5vJoG0NmmZVqL8DCIivF6JT3V6Th+Fj4SzyAKvMrYHM8SzeVlsXmf/NzmWBp0gKCDRwttKz6IexNMt2w80pK/Hw03zAKMUpCg14GbwkKKOVWdMJ5xmIqpkp2vGgxyZdvWdv1oXXugaEmoRrOFKmCRfkzzPU+LtvCtkmczYZmlIYCxuLOOMUrBlioXv9nMuoVw0E3tGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhXiTrf3nYEpPapCSFgPB9m1LKse5UuoW5un3Cv9OwM=;
 b=s9bxiqPiVS4kVNWMkloeiQ6jrPxgaQRMObQQv+cHSWMdkMHen7O9BXNkwJ7QkGVQTzeuEMZuHHvNSwdRIBbPz/P+uCTHen+2z77QCHNicVEQ2hbsAP7qgtORlspvDgTatevYWIeMnWI/MrvOJztes2FCuHmhWeCqngRtBvIIWdU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v7 9/9] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v7 9/9] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYhE/PLzgZAZhohEWBkyQ6CNSVbK1e/rYAgAQAb4A=
Date: Mon, 27 Jun 2022 10:11:20 +0000
Message-ID:
 <DU2PR08MB732533C0E687B1A27417E54AF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-10-Penny.Zheng@arm.com>
 <ae94da35-40d5-f65c-1df5-3ebde3aa86a3@xen.org>
In-Reply-To: <ae94da35-40d5-f65c-1df5-3ebde3aa86a3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A1762B05500C5744B1EC62B571E08221.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ee218fba-4bd3-4873-2397-08da58256945
x-ms-traffictypediagnostic:
	GV1PR08MB8035:EE_|DBAEUR03FT026:EE_|AM6PR08MB5031:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GrZz+5uCIX11aKqp9IcEgGGlJ78R50VNUSeRM9TMCbwNiRYvXA9mSD1GD+uGwl0nGjowzpQ7YLZNEyLAuM1GPR+btGhokRA+5lgy1nZikSQlPAKkNh17RGshO6t7TScPtSuOmhN/SAWP8riOJ9pKvIRLywj6WjXIVKfuiIKnAHHDXkmiCW4UZAxqRNZuSnv0QwLxW9Nfx5QHweer/MM04OfqtLkQ4ks8L6eLVxLmEsLuN7w7o81iz4yL0xDuuJYwfwHBZMKDIByJOfZXkNj61mLsAWXbe6wvniRVPsLDAzla9klOM3ZLZzW/GLRiDG6ym9Ht0KcY7dgjzmJyRJU1yQ1yXHBKvUasCWcsmv6BU55qZ3DnS9t1xyPVKCDVnsnQWMjoL2/kULO3G1I9nQINVeDetERwoy+c7aTgdydTh/knNNt2LJtRyVKo2gDOD8sw3Xc7tLbID5q6jVW+BHcs71Lfm9FsJ78GtRM8C9Ei46YgtZevZU363OKITh6+kghmkHWcsdvbqE2NfFxroPNDU1u8NRdX5TAlhKEzRXy0CryMuK2bOrCti8mooN5PLerO4JUXh8X5u0QjqJBt2MFhiW8jRtEzXfu1gQetvIhGLTJi9vZ5yx6WsQKQudFVWnFD60+TVGd1rmjU+gRb9A+ImAZ3fYsGQuToXpyd/bTJEgDjY1DWwXvxkq9SD0mrGv+jZGJ8pZ1aaVWrNnQFijUsGdKq2qYmH7hiSTwBoigamJYm89vyrGIa2gDgWkge+5hwwkVCYiB9jVBDC9WHK9BDCa9BNE6NWqfxY80qfv8+aYV4rxM4rXPHhO0urkUf5x4bFh3mNOUvFZ9JYvGJbaNFTg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(2906002)(55016003)(86362001)(6506007)(41300700001)(478600001)(76116006)(38100700002)(66446008)(64756008)(71200400001)(26005)(9686003)(66556008)(8936002)(52536014)(66476007)(53546011)(8676002)(4326008)(122000001)(5660300002)(186003)(316002)(66946007)(7696005)(54906003)(33656002)(110136005)(38070700005)(83380400001)(156664002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8035
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d513610-5538-492d-a279-08da582561f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	imyjANTnjzMdc455TAchH3CwtyT8XairA0MeRRbHVMXFoQCE1zH77/htgQTxFzltamSMoubkvpH+9i9zFCQWa9nT4kNape3xmKNTNsXMyZ3eL3ISUSHoyPKcMERuZJgdPk6IVAUt7eYzqrkSuaVe7gOVRCbDdrDf+EpZTJtclQ1c28NJW64FoapJJkqpzyb0zsqqrViSY+nrh2buVOXknl2j4rzPW6Brt351RarNRW0kkWC3nQztk5sMvSIrDa1EpgrVqWgcNQ3Ccve8eKcgRD7H885Kz1D4fMKof9H1xgYf2LXQGv4346h8DTNAxQfc9fhSMgY2lGaIFZ1XazrxaBPccPBXhiM1ZqfgJ1u8udK2OHK53ZDzvO13ptgq7mfBeO+Qa5rS2MdTzGqb4g8zKVWkxyZGGzLf3MYcGpI11cZEL3m1r15uWXyDHVc8YaUlydZOSE3ws/s7k77uPSD8KwTGUExkMwxfcYJhVnm1sejRRUFQMQ0HGRnCZNrfpF7maz2Oefczm2Kbvc0L/jFVGxgE7aRAxF4pvfPoICLBDRID3AfGqgadb1BM9ELu5m3ny/5Sn+WMIPuj5Hxf1t+msVx3B5mEd70yq4+E/flsmlM65R29CMjwDJgj9ojZX6rjZnKyaKajn6fRoMAo38dH8sEL5FJe2nsBMmZMIIUaj2+2WgJ7KQLFZUB7DSqgCpbmGO4BBtZUv8V9v5ORXnEDa0xQ7Ek2n+cifqOiTozwcyatDEhRu8DzjxcI93Wj+k78Zpm6Jz2LX7qw8Jxm+Id64nEbQDb7e5PibKkdyOsEQROx/j4gXJNVGQHKDnvHD3LEZQSGjhZjGvDm97RovDZSmg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(40470700004)(46966006)(36840700001)(186003)(82310400005)(356005)(55016003)(81166007)(33656002)(8936002)(316002)(40480700001)(5660300002)(47076005)(110136005)(54906003)(336012)(83380400001)(70586007)(26005)(9686003)(86362001)(52536014)(36860700001)(8676002)(4326008)(478600001)(70206006)(41300700001)(82740400003)(2906002)(53546011)(7696005)(40460700003)(6506007)(156664002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 10:11:32.9519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee218fba-4bd3-4873-2397-08da58256945
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5031

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMjUsIDIwMjIg
Mzo1MSBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
PjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47DQo+IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
DQo+IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgOS85XSB4
ZW46IHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIG9uDQo+IHBvcHVsYXRlX3BoeXNtYXANCj4gDQo+
IEhpIFBlbm55LA0KPiANCj4gT24gMjAvMDYvMjAyMiAwMzo0NCwgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4gV2hlbiBhIHN0YXRpYyBkb21haW4gcG9wdWxhdGVzIG1lbW9yeSB0aHJvdWdoIHBvcHVs
YXRlX3BoeXNtYXAgYXQNCj4gPiBydW50aW1lLCBpdCBzaGFsbCByZXRyaWV2ZSByZXNlcnZlZCBw
YWdlcyBmcm9tIHJlc3ZfcGFnZV9saXN0IHRvIG1ha2UNCj4gPiBzdXJlIHRoYXQgZ3Vlc3QgUkFN
IGlzIHN0aWxsIHJlc3RyaWN0ZWQgaW4gc3RhdGljYWxseSBjb25maWd1cmVkIG1lbW9yeQ0KPiBy
ZWdpb25zLg0KPiA+IFRoaXMgY29tbWl0IGFsc28gaW50cm9kdWNlcyBhIG5ldyBoZWxwZXIgYWNx
dWlyZV9yZXNlcnZlZF9wYWdlIHRvIG1ha2UNCj4gaXQgd29yay4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+IHY3
IGNoYW5nZXM6DQo+ID4gLSByZW1vdmUgdGhlIGxvY2ssIHNpbmNlIHdlIGFkZCB0aGUgcGFnZSB0
byByc3ZfcGFnZV9saXN0IGFmdGVyIGl0IGhhcw0KPiA+IGJlZW4gdG90YWxseSBmcmVlZC4NCj4g
DQo+IEhtbW0uLi4gQWRkaW5nIHRoZSBwYWdlIGFmdGVyIGl0IGhhcyBiZWVuIHRvdGFsbHkgZnJl
ZWQgZG9lc24ndCBtZWFuIHlvdQ0KPiBjYW4gZ2V0IGF3YXkgd2l0aCB0aGUgbG9jay4gQUZBSUNU
IHlvdSBjYW4gc3RpbGwgaGF2ZSBjb25jdXJyZW50IGZyZWUvYWxsb2NhdGUNCj4gdGhhdCBjb3Vs
ZCBtb2RpZnkgdGhlIGxpc3QuDQo+IA0KPiBUaGVyZWZvcmUgaWYgeW91IGFkZC9yZW1vdmUgcGFn
ZXMgd2l0aG91dCB0aGUgbGlzdCwgeW91IHdvdWxkIGVuZCB1cCB0bw0KPiBjb3JydXB0IHRoZSBs
aXN0Lg0KPiANCj4gSWYgeW91IGRpc2FncmVlLCB0aGVuIHBsZWFzZSBwb2ludCBvdXQgd2hpY2gg
bG9jayAob3IgbWVjaGFuaXNtKSB3aWxsIHByZXZlbnQNCj4gY29uY3VycmVudCBhY2Nlc3MuDQo+
IA0KDQpPay4gQ29tYmluZWQgd2l0aCB0aGUgbGFzdCBzZXJpZSBjb21tZW50cywgYWN0dWFsbHks
IHlvdSBzdWdnZXN0IHRoYXQgd2UgbmVlZCB0byBhZGQNCnR3byBsb2NrcywgcmlnaHQ/DQoNCk9u
ZSBpcyB0aGUgbG9jayBmb3IgY29uY3VycmVudCBmcmVlL2FsbG9jYXRpb24gb24gcGFnZV9pbmZv
LCBhbmQgd2Ugd2lsbCB1c2UNCmhlYXBfbG9jaywgb25lIHN0YXlzIGluIGZyZWVfc3RhdGljbWVt
X3BhZ2VzLCBvbmUgc3RheXMgaW4gaXRzIHJldmVyc2VkIGZ1bmN0aW9uDQpwcmVwYXJlX3N0YXRp
Y21lbV9wYWdlcy4NCg0KVGhlIG90aGVyIGlzIGZvciBjb25jdXJyZW50IGZyZWUvYWxsb2NhdGlv
biBvbiByZXN2X3BhZ2VfbGlzdCwgYW5kIHdlIHdpbGwgdXNlDQpkLT5wYWdlX2FsbG9jX2xvY2sg
dHAgZ3VhcmQgaXQuIE9uZSBzdGF5cyBpbiBwdXRfc3RhdGljX3BhZ2UsIGFuZCBhbm90aGVyDQpz
dGF5cyBpbiByZXZlcnNlZCBmdW5jdGlvbiBhY3F1aXJlX3Jlc2VydmVkX3BhZ2UuDQoNCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

