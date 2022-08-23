Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BC59DAFE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 13:45:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391928.629974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSKo-0004dG-5F; Tue, 23 Aug 2022 11:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391928.629974; Tue, 23 Aug 2022 11:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSKo-0004ax-2I; Tue, 23 Aug 2022 11:44:42 +0000
Received: by outflank-mailman (input) for mailman id 391928;
 Tue, 23 Aug 2022 11:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQSKl-0004ar-Ti
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 11:44:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10073.outbound.protection.outlook.com [40.107.1.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7783bcf-22d8-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 13:44:38 +0200 (CEST)
Received: from AM0PR03CA0096.eurprd03.prod.outlook.com (2603:10a6:208:69::37)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 11:44:35 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:69:cafe::89) by AM0PR03CA0096.outlook.office365.com
 (2603:10a6:208:69::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24 via Frontend
 Transport; Tue, 23 Aug 2022 11:44:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 11:44:34 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 23 Aug 2022 11:44:34 +0000
Received: from ca712d7b2898.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F699904-40B0-48F9-B0A7-C0030037A89C.1; 
 Tue, 23 Aug 2022 11:44:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca712d7b2898.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 11:44:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3292.eurprd08.prod.outlook.com (2603:10a6:5:1f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 11:44:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 11:44:20 +0000
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
X-Inumbo-ID: f7783bcf-22d8-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KG/ViuFOzWJyWPRFOrarU7ZZRNcXZgdqCQsZcuAfk/Wlk8jrEHz/XRWtDPVs66tNlt5JbVtvNQ7WwXvJP4F0P0ZEEcdzEHHinni9T1cXo/iWWNNeJc2mbme2IybPv44Dh8p/2QQciDvJr5UW/Tx6qCGw6bgzTkU+Z9UZX3YuH+wkuBu81Yml0BY59WR9qN+BYt9Xy/ItcHK8oQikQeU3WoPPvhLNkqqyWIkZGPTvk1g734N9cO0MVWXayzS+1L+/78iYvvS5JQI8OtqwUZqiWG+4lAfX2YhwB6j9ou/FSBhGr5OXkUwHkTekV82vQRLur8kvhFUEmKpB3PLuFUTFvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfxdHKoHV8fwfMe9Cjjf9wTxPXTOVIcmXr6zf3L9YDk=;
 b=kI4t+EpEd3d2hbu4xymsxp8qS+n7ITEvQZZGyYhZXTeo40BZ8fRqAeYMI/YbJrisPtjCzdhw387+kdv22h7RFOcu204xo28w+mmjtpjJ+Tu7viWZSORihCqlyY9nTL3u6cCqro/3Eh+avJM7gWQGtDVQOlBrjrJuIpychiPb7E1/JvWRy33jhLfGkDCIdwbR9gI3pfKtw4Cz1/Fku5cRlAwiSb1UkSsgByelAPWrkat8SLmmEKx844S0YIx4svqFQijRY2AUeTCKdxwU9FerhUJoixleQy6VqsvAtlozUv1hU/Nmdxe+PLQ34SwvOnt4w1Uwamm2psA1dDkwpPd08A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfxdHKoHV8fwfMe9Cjjf9wTxPXTOVIcmXr6zf3L9YDk=;
 b=QiGJVPmE9gOOIgOUkZJ1OlV0o7G1fpbsFHU3CV8ucd3h0MNUciFgkZoLtJGl8Lu4n+XJjXgiYL9pgv4HNOjo8ppp3I79fsMqp/kqwEoBUZ0C4jz1w6FHUW3e72SzLpzf06Ge1ySGJHq8pGDYvzIwewXXFVGJeRCW4/4w77l2kxY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3c38d722d78deac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qy3x5xwQdqX3QeW/rUNd7tyMQ7OFENhJdnCEPr7GRtGZZN3sfPWm7zLxHtm/cJQJoZKS6Vi0C5Y3MjgETci2BKLyK6uI681HTbPzVgU4JlmlGV1PAU9vPUxIEOS4EK423FJ50rtg8l1W/NRlKqOgXln5UgpoP/nl5rypLn0zQ9abJdsUjtTfhkYvX4+YNSYWHMdZxHneYKnSacRlyjBwt4fXzIE6HEstEUd3rFnpU/ekxBVvA9RPfkmY83OfAdGAZ6De0c+jhAfrwv91bNJs3sMNmlVMGsCR8Wz6h8HtYw00czHydpb0yWcEtPBtdvKVrTnc2MmG+R1oVjLRyDVLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfxdHKoHV8fwfMe9Cjjf9wTxPXTOVIcmXr6zf3L9YDk=;
 b=hbnkzBaSrfAtfDmM3sBUtiOXh57N6/r573p3iFDbtc2Xz4o6IffCwAKUpL6j5zinWK16+0UbiJ1j7x5ReVisbIswqzcL5ZDTRZZ62v88XSdzkycxXKjgGKY5rWrJQlsUvMPb62yELeqquU7eSpbc33IeSkcuumbUkxeNvWxurNKdez1GzLzosb8ckAwaWvbDtBr8ndLOTaPzTcd9L4/Oegt2dFTx0VA7kJxYzoSigM/IxBtETffoB/esFK6zsY0LCh5IVGsCVHdjMTJuIo1dnWeWhJLYSVIT03EbS7ZGnqOmZKNC2AAWLsRDWz1V/SfOGHakPelbp2G9DKsC5AWzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfxdHKoHV8fwfMe9Cjjf9wTxPXTOVIcmXr6zf3L9YDk=;
 b=QiGJVPmE9gOOIgOUkZJ1OlV0o7G1fpbsFHU3CV8ucd3h0MNUciFgkZoLtJGl8Lu4n+XJjXgiYL9pgv4HNOjo8ppp3I79fsMqp/kqwEoBUZ0C4jz1w6FHUW3e72SzLpzf06Ge1ySGJHq8pGDYvzIwewXXFVGJeRCW4/4w77l2kxY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Topic: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Index:
 AQHYs7MV2LzwQkpIc0uI74Vj50Jrma269JmAgAEvmICAAAk5AIAAJFSAgAAPtwCAAAKAgA==
Date: Tue, 23 Aug 2022 11:44:20 +0000
Message-ID: <B1DDE1F8-2906-40BF-B6A9-E18DDA883681@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
 <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
 <f8a3f7d6-1db9-cc74-5d60-8a0e22b80a3d@suse.com>
 <6A4EBDE0-60A0-46B9-A9BA-C689B9F8F129@arm.com>
 <fdfe8a77-34a3-252f-6aab-1850cc30c7a3@suse.com>
In-Reply-To: <fdfe8a77-34a3-252f-6aab-1850cc30c7a3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bf7b6d61-12b4-4aba-acb6-08da84fcd9e8
x-ms-traffictypediagnostic:
	DB7PR08MB3292:EE_|DBAEUR03FT052:EE_|AM6PR08MB5032:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1ARNbd4oVJ9CgA9YO1/uZs3eLeoOHCC2TquvIeV63Bz3MdT7nlVnQmmpsaCWFy9roGBmjndU/K3umkHw2Cs17bmC42mWYJooQq6cWHdJLJwuS6LUvMpr+c5eOB5WmrUXP+i40SxtSnsOKVnYOT1nhGY0WapuLjKL7O1480R/zSzQYgsJz2RtWQ94nLKqE3jaKR8RdnY4MsCZkZ6EqX4IKvLBrlfXIr9QunOT0kjsDMK2di1ILUlF32kCbUbo1pK4Sg7f7JKKW76SwtgtC21JyxBX+mvKumUxornZm41+wFF1pLHJiB+TFjwj/OyyN9KMOk2k71yYUqlBnNMh6wA26akvd2hSbxJ71keGJxSmJbgyUCHd3h5qZEq3SXWGW++eXgMBFFkuYD7DH0prEbWfZ78KY8mDV+qyFqPlUSVr8k/FFAoCiaVGvdLVObFvNCyySo5+neqmr2c/NcahoA49BUpS6HU6kIl1sTqVkJjBncguH5LvW0POy4+WwnQ7jALKJIOJFugnuzlmCnABdBbpqGypNi3BSXxPv64D9iPBnfYaRETt2nZf4CMCpL5ixtodqH6xh13er+8AUlD6QyrvGf3/sHgP4TqSdqavWVFgMdMEFUh+PBJD60Qm7HxXCXMpaKd4lQMZecMK2hFOlKZiMNv2GKSvc/y3+jBL+3gnAknYA7nR3WAprXbcGjF3LShGDTqBR2HHFaNRJW/Z0v7V4r6MLctCeunglUQtTd469OuvljCdph57qAlX37uewDCp7Y/sdPfQKksKZcIWMGx4X1sNdr3fNl7NPWeDY7OoyQ0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(4326008)(2906002)(64756008)(8676002)(8936002)(5660300002)(91956017)(66476007)(76116006)(66556008)(66446008)(66946007)(53546011)(6486002)(36756003)(33656002)(26005)(186003)(2616005)(478600001)(41300700001)(71200400001)(6512007)(86362001)(6506007)(83380400001)(54906003)(316002)(122000001)(38100700002)(38070700005)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8A4CF27BEDBA7A47B815D17C570F6FD2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3292
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f436b279-fcd0-4115-9729-08da84fcd13d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZvGICfKC9AdcemFPlnB5j4x2IHoINhF67S5E61Pr+OGAijkp3nHrrPzexhrm37+LS6ljlkJ7QQhBJODAsoYbFtvvnsrnpm5V0UoakvL1+0du9DlDh2OFHJk8saR5K2jpgQ8RYQiz0XmYVDW+FPleEyL8zJhNAfcUsb6J80pvc9sjEZySMuLgUQ2UJWO7uNlWPiwLRUVf3IuphLRN60JfFXxuSlmpBQp4X82CADijPLMGzJ/lKCumnL138vE1Y0ryL5iZ3jod1Vca48NHppcueJoqiaP8OCu4ch+BGu/2+2JFJVgcqhwzRpSr03N1WrDdcDgbKOU4RiH592uDiUbiBDNOs6259AGR2YhPRHThK0KMR3sbx3mkpSGsoZpi7i7z2LETA8PQRE9oHOwI+6RuoyW9DfTaT2pBEJ1X0wBG2y+F5q22iLNf1prHes7SL6KMD8TL99sBmDEiGKg5Bk5nZzMH1cSh08rj/KHawv/txPtH0dl+pv0zK33V8HVxjFrWbPgCb/NXsMuO6mVuKejIZGLNtZ0AJCVKSrwQf4kVfb7ZHGe2A2SLrq5sB/NGV8Wk1mi9Mfo8874Yi28BHh5VzoKczT7rTxJkwP1zQjuhNFToIn6KfvAo8OPE8Ee4YrxGVc+YYaAWbTzv/fbd33QJ5TSHFYEf9Rpk8bcFOs+l5dG1xzRAuURdfY1ZsJbfT+QFW9oiHk2mzyMux80KMx08pw0YteQ25tRv8VVt/ebt4J5e44TXpr/Tu8HEf6jihXABXJUAgVYQcTTsa1/CBpT+wg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(40470700004)(36840700001)(46966006)(336012)(186003)(2616005)(81166007)(356005)(36860700001)(47076005)(83380400001)(4326008)(82740400003)(40460700003)(6862004)(5660300002)(8676002)(8936002)(70586007)(70206006)(41300700001)(40480700001)(2906002)(82310400005)(53546011)(6506007)(26005)(316002)(6486002)(54906003)(478600001)(33656002)(36756003)(86362001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:44:34.8875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7b6d61-12b4-4aba-acb6-08da84fcd9e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032

Hi Jan,

> On 23 Aug 2022, at 12:35, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 23.08.2022 12:39, Rahul Singh wrote:
>> Hi Jan,
>>=20
>>> On 23 Aug 2022, at 9:29 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 23.08.2022 09:56, Julien Grall wrote:
>>>> On 22/08/2022 14:49, Jan Beulich wrote:
>>>>> On 19.08.2022 12:02, Rahul Singh wrote:
>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>>>>>         struct xen_domctl_createdomain d_cfg =3D {
>>>>>>             .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>>>>             .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>>> -            .max_evtchn_port =3D -1,
>>>>>> +            .max_evtchn_port =3D MAX_EVTCHNS_PORT,
>>>>>>             .max_grant_frames =3D -1,
>>>>>>             .max_maptrack_frames =3D -1,
>>>>>>             .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_=
version),
>>>>>> --- a/xen/include/xen/sched.h
>>>>>> +++ b/xen/include/xen/sched.h
>>>>>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>>>>> /* Maximum number of event channels for any ABI. */
>>>>>> #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHA=
NNELS)
>>>>>>=20
>>>>>> +/* Maximum number of event channels supported for domUs. */
>>>>>> +#define MAX_EVTCHNS_PORT 4096
>>>>>=20
>>>>> I'm afraid the variable name doesn't express its purpose, and the
>>>>> comment also claims wider applicability than is actually the case.
>>>>> It's also not clear whether the constant really needs to live in
>>>>> the already heavily overloaded xen/sched.h.
>>>>=20
>>>> IMHO, I think the value would be better hardcoded with an explanation =
on=20
>>>> top how we chose the default value.
>>>=20
>>> Indeed that might be best, at least as long as no 2nd party appears.
>>> What I was actually considering a valid reason for having a constant
>>> in a header was the case of other arches also wanting to support
>>> dom0less, at which point they likely ought to use the same value
>>> without needing to duplicate any commentary or alike.
>>=20
>>=20
>> If everyone is  okay I will modify the patch as below:
>=20
> Well, I'm not an Arm maintainer, so my view might not matter, but
> if this was a change to code I was a maintainer for, I'd object.
> You enforce a limit here which you can't know whether it might
> cause issues to anyone.

The limit was agreed and discussed between him and Julien and
I agree with them (if any more views were required).

Not quite sure if your mail was to request an other maintainer to
confirm but done anyway.


Bertrand


>=20
> Jan
>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 3fd1186b53..fde133cd94 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3277,7 +3277,13 @@ void __init create_domUs(void)
>>         struct xen_domctl_createdomain d_cfg =3D {
>>             .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>             .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> -            .max_evtchn_port =3D -1,
>> +            /*
>> +             * The default of 1023 should be sufficient for domUs guest=
s
>> +             * because on ARM we don't bind physical interrupts to even=
t
>> +             * channels. The only use of the evtchn port is inter-domai=
n
>> +             * communications.
>> +             */
>> +            .max_evtchn_port =3D 1023,
>>             .max_grant_frames =3D -1,
>>             .max_maptrack_frames =3D -1,
>>             .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_vers=
ion),
>>=20
>> Regards,
>> Rahul


