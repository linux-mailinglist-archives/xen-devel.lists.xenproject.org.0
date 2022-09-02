Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6623A5AA65D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397232.637734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxOf-00041Z-3c; Fri, 02 Sep 2022 03:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397232.637734; Fri, 02 Sep 2022 03:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxOf-0003zF-0F; Fri, 02 Sep 2022 03:31:09 +0000
Received: by outflank-mailman (input) for mailman id 397232;
 Fri, 02 Sep 2022 03:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mC+w=ZF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTxOe-0003z9-0A
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:31:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140059.outbound.protection.outlook.com [40.107.14.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adc23160-2a6f-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:31:06 +0200 (CEST)
Received: from DB6PR0601CA0036.eurprd06.prod.outlook.com (2603:10a6:4:17::22)
 by DB9PR08MB6426.eurprd08.prod.outlook.com (2603:10a6:10:255::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 03:31:04 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::ac) by DB6PR0601CA0036.outlook.office365.com
 (2603:10a6:4:17::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:04 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 02 Sep 2022 03:31:04 +0000
Received: from eed0d6ed41d8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9FF07C0B-3C0E-426A-B073-208366B50B63.1; 
 Fri, 02 Sep 2022 03:30:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eed0d6ed41d8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:30:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB7774.eurprd08.prod.outlook.com (2603:10a6:150:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 03:30:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 03:30:49 +0000
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
X-Inumbo-ID: adc23160-2a6f-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KRrPGdWwvsXkw4rR0sRHmum9S+12slB/aQGLAXoukxZRbBdcOtQSX2NcAwU0xS0J/KhymJvAt4r7ZsK9p4xBNqoT0vvYJ6DPJHAHGLuKcqQcoQ4sSsUezXGifu0QL52/Gg3sCdny8RQZkwXSjnNANtgMX9ZWQWqVoYEjlLRsVUGWO0ORe/h894ZLGew3sLEJhy89RUeU4OmZXhVO37eX+D/9whLotFe1gE3Vg4bnVKFbr/pJLzunEq6uXOdGmBIf29xp2Ll/gsS7iqBWqKzFFljnYOAEyBRZL/IYNfmZ7aMHWCleW0P+auxRX+WDafFjOMeDmuGL92LtJmQsgs4YDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O4lBE22ExQUpguYwGqqakeE8idW8+2YaNU1ScgeKhc=;
 b=IlA4GWd+V/FfDXb5N4zUExA/gncv0RB/YxHVjwV8OwlnRFtb2/Cu9bA5qYK82YiE48JR3KoJ4xHYRtB+ieO/ooyH8iM308lBNlEoE3ubADS3Mx4msw59MGbxUmJnkPN6JYgkWB3Bmp5w6GPNEp+TX2kTXioPeHCk+CJ2Pd7zVsC9FvaZZlJz6VcHKTibGr/Wr+RLAaUUT3X+ykZUNiDXLdcXuHenkN1+LPCLkhF/kwXYlfPIvpjV3k3m9fopI/pDPaSkzQGQWGUHib+mMaKFlWdCPt9XT58fUXI3uET5Sv6A4h+a4QiSx7mL+NeEe6eVhzDE13qABNIlWie1Z8VJzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O4lBE22ExQUpguYwGqqakeE8idW8+2YaNU1ScgeKhc=;
 b=P6IUEYtrylDO+q9JeZpYVdH9Bc+Vf4Nlt9oOk7IkqagxTEqNIE3kGbquLsU7Lki+Vl7pDfvyJZtIdVCJfhuvZ9DUGAez8lSuQPSReM5cOqWY29B0wiJgc+e4Riw3JYzUsRybpfCqesNUg8YRDmZ1MZBgi0Xva85SJLT6fMjAr7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6HUVaNhfwe5KjVY/uV/sWdX8sA8UlfKBXUEI2Xs6rcmL7yJKzH1+pY/SnmrdxePt+w6VbiCmlkeUktz2UJGn9yEcKGE/3ewxxp9ZTSyXbzhhBsyiWf7QVUIN6SHUEmsQ7qQbVe6mm3Dlh4BPCJx7gQP04eKpUURAsc9dhhj2ljvfG8GwnisWM1ZPu89t9O6xVl7z3K5ZS6NvTaZP2HTJ3BXsLR6MujmqatnF/wmAZwkIzTwghEoGk+KXEit1SaU/2RYrBFVBpdqLuHdqYu4PVHDyQ5NgXeE6nniZZHG00Fq/Y7NMhDTN+t9yjIW6N6u4MyxjCZevSdsR9aNG4KOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O4lBE22ExQUpguYwGqqakeE8idW8+2YaNU1ScgeKhc=;
 b=EAdw2iNQbnCX898b9tFEaEDFcr68JBdUNfOZvW71+0pc+0NmnxJnXBr5Rpim8TohoAhkgpa9UwbcTZjYfNF2vE4GRazjln34wBorHfu+1ODDC0ydflSt/r6QmhWXi2rjvEw1I2v7cwxMUYszAGPTHM8Ur0I+WrRFdy/VXwhMOad08DT5VSB99+WqeiVB84VlQlHinJCh38NuR1LzUQOz4f2T75NWTkFJIlqP+FKKcBdkF4+G74bRUJww9xVtp+TFKFqVE+Un1aX/SiJy4gFv2oLXuNCvJSpi0QNMaoWJ4M+LWqW/cmMblgQB27ljxp9lqFfTap7NMlcUR+hXjvc+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O4lBE22ExQUpguYwGqqakeE8idW8+2YaNU1ScgeKhc=;
 b=P6IUEYtrylDO+q9JeZpYVdH9Bc+Vf4Nlt9oOk7IkqagxTEqNIE3kGbquLsU7Lki+Vl7pDfvyJZtIdVCJfhuvZ9DUGAez8lSuQPSReM5cOqWY29B0wiJgc+e4Riw3JYzUsRybpfCqesNUg8YRDmZ1MZBgi0Xva85SJLT6fMjAr7A=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q3KwCgAgAAG+VCAABfUgIAApokQ
Date: Fri, 2 Sep 2022 03:30:49 +0000
Message-ID:
 <AS8PR08MB799161163796249F1AFC4C06927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <b05106cc-09d8-9a9b-38e5-328cd8caff97@xen.org>
In-Reply-To: <b05106cc-09d8-9a9b-38e5-328cd8caff97@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3A96B08C86187648AB113540872498A8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 53d5e906-3219-471c-40ed-08da8c9390a6
x-ms-traffictypediagnostic:
	GVXPR08MB7774:EE_|DBAEUR03FT045:EE_|DB9PR08MB6426:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 krIR2vo2G2DMDQwK7SU1VuZjPVdJAOj4UKSSueByWjgt/mrJTg+yisGis12/M4hB6WgkWHfP3c18KLJmxafZD63zXSvYvZVmUWNvQdcTm+vYPacSY18y50HW/GyiQQveB/sjALAXMwb020/gujnHLEn9oXCEXAOjI+Q7sYXkRoKYg249TqKAS1H7XXQY997baPAP6lvbGJc3kFzweggNeNVeU+/o940BvhfIbAQ6AnZeO3AnffsVUngI6KW8sg0/Taqhbr6By+ntx8VuPt6EBCmI2st7rYtgxwOiKa6YbIV4GMyVlNf9oXMMurIWRb8E33GP2hacPaA36rCUW2d+TFauME7TbYeeBiNUs2x4GPSsb5TVp4Veer6Wgj67CfzZKUNnjZg9edRm+IC2X4R46/a9L7hV9tl3Aw0fvLHZ4gArdm4Kaox4ZMgdVN2/RBVPDdFTpcjScP0QQWLeqIoGrSlazUJ2M93r2ywpgafDtop2Cq1dGvjqyoSzieGDlHpROqcJMHnaJmyInFVSMY/AcdBREbMg9C4Kyti6ghdbSZ/y5UoEYnnqrQ6TG8Ck6Wsm7EwM8MTg/+86oQU01jlw0zVQHpHfk/mFRT1uQ3e7ymYGoTdN0GGavAVTiWMGwdM5oySwIPyNtloBoebBCk2UBiKqI8J7LrA1sgQd4gCJc26cEusMHH5oDQUK8QKSWuEQRjQiRjaZwNRr/FpVm9Y8E5+lHy2sXQGBfnKEH+Ax+JJARyRn3twU/QDWt16FS+u8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(66946007)(41300700001)(66556008)(66476007)(66446008)(64756008)(4326008)(76116006)(83380400001)(186003)(54906003)(478600001)(110136005)(316002)(33656002)(26005)(9686003)(55016003)(8676002)(7696005)(6506007)(86362001)(38070700005)(71200400001)(5660300002)(8936002)(2906002)(52536014)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7774
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	853be9be-94ca-4902-a5b1-08da8c938811
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xi6eWx1/N9Z+Y5XcIbE/b2/wfcVbsp6a+biPMD1hgu6GwkGq+3bq0q9C54CXSdAJFNOfkuQF2gZNUXBcvEqkmxpBl5/qH2vRrNFcpiywZENash/fO9cJ/CND73D/ReP9kr9O4fP+Yva7cBIF52V3rz3ck3ArkBDq7wZm30uXJ+Kz3YH1AvZFpvp6SGvi+l+MFUD5Jefn08E5elfDwF2Ttu0Bjyvh/ykZLnJb4J1GXsoDfaXySkniXErwWH/4n1/AMSYtQ3QsXa8KYqyvyfzMwGVxLK1YF1nOrHgaqfk+2Jks94x/tKapwbFhj6eQ4Z698C1PULkygPh55MJQKzirqeXX3wTg2afhEi8cCodan2fhLDak41ENV224+aWtkSqqdPj/3p/EIgOyoT8OEymPO0A5P5VLB4d+SAe/2jh1aDyzQkLfu41TUy62avp727AHh+JXLLF5CY9PK44VchnT8hW1dCtaXUzdX28DsB9Zheb0ZB5K3od/WMpN1nvpIlQent2t2b9CDwDVhRbDDCQBnSKQogOBE1l4jyVUIS+hCf/TlZXxt+kFzqJIVsi5qJCUw89eWeMCqO5+8JL5AHpOLOwEGffSopuEJObyFZT+ghsC1bXfvnTHNGIDIaBetO4+ZLVq2rbL6dhtH8xQK1Pq6Z2ECXxrtzpYddHMS2hRCmTwRCun2eOkrEzfmJDsshDZU0rzlNfkaFUYwGPyXrxZL9NKWiMfeRNpYwrhnxup/DMy862OfjEGCQ/XwrisPqHl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(40470700004)(46966006)(36840700001)(70586007)(52536014)(8936002)(5660300002)(55016003)(40480700001)(70206006)(8676002)(2906002)(4326008)(54906003)(33656002)(316002)(110136005)(82310400005)(478600001)(9686003)(41300700001)(7696005)(356005)(26005)(83380400001)(6506007)(107886003)(81166007)(47076005)(336012)(86362001)(186003)(82740400003)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:31:04.1242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d5e906-3219-471c-40ed-08da8c9390a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6426

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFRoaXMgY29kZSBpcyBub3cgYmVjb21pbmcg
cXVpdGUgY29uZnVzaW5nIHRvIHVuZGVyc3RhbmRpbmcuIFRoaXMgbG9vcCBpcw0KPiA+PiBtZWFu
dCB0byBtYXAgdGhlIHhlbmhlYXAuIElmIEkgZm9sbG93IHlvdXIgZG9jdW1lbnRhdGlvbiwgaXQg
d291bGQNCj4gbWVhbg0KPiA+PiB0aGF0IG9ubHkgdGhlIHJlc2VydmVkIHJlZ2lvbiBzaG91bGQg
YmUgbWFwcGVkLg0KPiA+DQo+ID4gWWVzIEkgdGhpbmsgdGhpcyBpcyB0aGUgc2FtZSBxdWVzdGlv
biB0aGF0IEkgcmFpc2VkIGluIHRoZSBzY2lzc29ycyBsaW5lIG9mIHRoZQ0KPiA+IGNvbW1pdCBt
ZXNzYWdlIG9mIHRoaXMgcGF0Y2guDQo+IA0KPiBTb3JyeSBJIGRpZG4ndCBub3RpY2UgdGhlIGNv
bW1lbnQgYWZ0ZXIgdGhlIHNjaXNzb3JzIGxpbmUuIFRoaXMgaXMgdGhlDQo+IHNhbWUgcXVlc3Rp
b24gOikNCj4gDQo+ID4gV2hhdCBJIGludGVuZCB0byBkbyBpcyBzdGlsbCBtYXBwaW5nIHRoZSB3
aG9sZQ0KPiA+IFJBTSBiZWNhdXNlIG9mIHRoZSB4ZW5oZWFwXyogdmFyaWFibGVzIHRoYXQgeW91
IG1lbnRpb25lZCBpbi4uLg0KPiA+DQo+ID4+DQo+ID4+IE1vcmUgY29uZnVzaW5nbHksIHhlbmhl
YXBfKiB2YXJpYWJsZXMgd2lsbCBjb3ZlciB0aGUgZnVsbCBSQU0uDQo+ID4NCj4gPiAuLi5oZXJl
LiBCdXQgb25seSBhZGRpbmcgdGhlIHJlc2VydmVkIHJlZ2lvbiB0byB0aGUgYm9vdCBhbGxvY2F0
b3Igc28gdGhlDQo+ID4gcmVzZXJ2ZWQgcmVnaW9uIGNhbiBiZWNvbWUgdGhlIGhlYXAgbGF0ZXIg
b24uIEkgYW0gd29uZGVyaW5nIGlmIHdlDQo+ID4gaGF2ZSBhIG1vcmUgY2xlYXIgd2F5IHRvIGRv
IHRoYXQsIGFueSBzdWdnZXN0aW9ucz8NCj4gDQo+IEkgdGhpbmsgeW91ciBjb2RlIGlzIGNvcnJl
Y3QuIEl0IG9ubHkgbmVlZHMgc29tZSByZW5hbWluZyBvZiB0aGUNCj4gZXhpc3RpbmcgdmFyaWFi
bGUgKG1heWJlIHRvIGRpcmVjdG1hcF8qPykgdG8gbWFrZSBjbGVhciB0aGUgYXJlYSBpcyB1c2Vk
DQo+IHRvIGFjY2VzcyB0aGUgUkFNIGVhc2lseS4NCg0KVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNh
dGlvbi4gSSBjaGVja2VkIHRoZSBjb2RlIGFuZCBmb3VuZCB0aGUgeGVuaGVhcF8qDQp2YXJpYWJs
ZXMgYXJlOg0KeGVuaGVhcF92aXJ0X3N0YXJ0LCB4ZW5oZWFwX3ZpcnRfZW5kLCB4ZW5oZWFwX21m
bl9zdGFydCwNCnhlbmhlYXBfbWZuX2VuZCwgeGVuaGVhcF9iYXNlX3BkeC4NCg0KRm9yIGNsYXJp
ZmljYXRpb24sIGRvIHdlIG5lZWQgdG8gY2hhbmdlIGFsbCBvZiB0aGVtIHRvIGRpcmVjdG1hcF8q
Pw0KDQpBIHB1cmUgcmVuYW1pbmcgc2hvdWxkIGJlIGVhc3kgKGFuZCBJIGd1ZXNzIGFsc28gc2Fm
ZSksIGJ1dCBtYXliZSBJIGFtDQpvdmVydGhpbmtpbmcgYmVjYXVzZSBhcm0zMiBhbHNvIHVzZXMg
eGVuaGVhcF92aXJ0X2VuZCwgeGVuaGVhcF9tZm5fc3RhcnQNCmFuZCB4ZW5oZWFwX21mbl9lbmQu
IFRoZXNlIHZhcmlhYmxlcyByZWZlciB0byB0aGUgcmVhbCB4ZW5oZWFwLCBJIGFtIG5vdA0Kc3Vy
ZSByZW5hbWluZyB0aGVzZSB3b3VsZCByZWR1Y2UgdGhlIHJlYWRhYmlsaXR5IGZvciBhcm0zMi4N
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVs
aWVuIEdyYWxsDQo=

