Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67018A6546
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 09:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706706.1104031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwdOn-0005as-Uz; Tue, 16 Apr 2024 07:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706706.1104031; Tue, 16 Apr 2024 07:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwdOn-0005YW-Rz; Tue, 16 Apr 2024 07:38:37 +0000
Received: by outflank-mailman (input) for mailman id 706706;
 Tue, 16 Apr 2024 07:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6w7=LV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rwdOn-0005XG-Ay
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 07:38:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 552333dc-fbc4-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 09:38:35 +0200 (CEST)
Received: from AS9PR06CA0070.eurprd06.prod.outlook.com (2603:10a6:20b:464::21)
 by AS2PR08MB9986.eurprd08.prod.outlook.com (2603:10a6:20b:649::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Tue, 16 Apr
 2024 07:38:27 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:464:cafe::67) by AS9PR06CA0070.outlook.office365.com
 (2603:10a6:20b:464::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 07:38:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 16 Apr 2024 07:38:26 +0000
Received: ("Tessian outbound 88c46f8f09a7:v313");
 Tue, 16 Apr 2024 07:38:26 +0000
Received: from ca3dc6095c06.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF5E5C70-5FE9-4385-9783-0DF29A2F4170.1; 
 Tue, 16 Apr 2024 07:38:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca3dc6095c06.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Apr 2024 07:38:19 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB10655.eurprd08.prod.outlook.com (2603:10a6:800:209::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 16 Apr
 2024 07:38:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 07:38:16 +0000
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
X-Inumbo-ID: 552333dc-fbc4-11ee-b909-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QlSRdC6yzLsFlyefeF4UNqkUD322CNkVEcXEYFdjE28OQ1XyjG9wV8sfztLMWTFV1ITmJl1KSu/OOeYVtoXQeh+a/NjDqsrRZQVpPtZ/BEZQQ5H5a1ss4mW6JRMtBUXyY9g1LXXUf6LTCn0+X1Zm8blt3JGFTpAH0BlWZ9eYX4r0xHBDG1raDw+rP+zcqq/JURnLspQSlTsjiTlndhX4m22VoIsZ3TehhFYbC8c0C5Tl4hIMvsuPkbVfeyTrA5ez9hgOBNwvMzWkTIMycSTF2h5kWtcbANWIE5Y0EaND0jbCC0TwmOp9Mb6celCy91XhDebSc/3OeOx020heLj9kkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSngT+1wNlMPCoqfspufGEtcYGoOTghFFP7Kv9xqUyY=;
 b=eDWa+6Ag3FSEN2m8E/t9P4uqYU02lL6hFZNmDId+EDv25r6HnCqWuoup7xuzC917gRI/yOGMUd4S41S8oeMHpK58/fr7GETPgWfrV2BcE/kD0cwbzPYdXBABgPfz2Yna0M1GgzXyVF/QmpyQhh/FUOf2pwvRrTjI/yYlxIcv09csNnnInXRTNsVw6ff6/Z/PtEGiNMSXAUHUiOVWucXtN2eYiYO/ebS4RW8MDhqyS2dKo/bLbAxoqp2vpXo5moz5QeUsFV7wi6Q7SuAra6PHnEY+NKDWSYdmxY2usBO9NOycntyLWiihwkL5GZ1yv5664V9INnmWHTgO3PhTtvF9AQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSngT+1wNlMPCoqfspufGEtcYGoOTghFFP7Kv9xqUyY=;
 b=8KiZeSdG16YMgrDvqpNr2vBaAs4pN8OqVZFxKnjX4GtUFFu1IS5DzSNSFLJIsekfewOajT19RaWNRkV9gzt49N5TP2Q0uC+CQgC/zTM+txxhNvwQ8U/A+exXwz3ql+Ace6cviqhKOFSBx6krQCvpN9fLICWKxV4mCb+19wrzW0w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b947f4223321720
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmPV8bd6hihxhuM4zCd/V7hKKjk3bD1ur4SibNOG9kYfhtTknIEFTli1Mg8lJhJJE7kEpXn9E8XVbzNwriHeVrfkvjGFShaOFdRsaz/om+ysRDGCsWQ/RGMtHvuy4aVM9CWkvWRv623boni2HnXh8o+CILg6xBAK74R00v2PYynEKfCKZYKA+sIuym2U0r0E0yVAocjCSKiooOMTvXB8iszmTVRx4NIN6n0/DTfcdUsHqP0enDO07ApFoIq1N3qdgmNsnORIN2ehUwu5rXeqmqB6w64u6ABCAXlN+JsUPzdk5ukJBTEuGX6f1Ejm4qFsUeCbRdbXaPFSw2Lkf8DK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSngT+1wNlMPCoqfspufGEtcYGoOTghFFP7Kv9xqUyY=;
 b=b7I+iawIs0NrE5QZLUMWMhluvru/JUbbzQcHIRVdhPrECEEy4q5BhuYDdwfcsBefGe/6FNuUJi6N3Dqe+PFyOlFghmYp04oRWt8GgStiy8xtiHkD+xH8KTUx3FjXDfmqZxxKfay0198l2BvMSHP//qW0h45ZyZpoNXiDXXqWB7LxqxU3ltVfuiAsWtZGb9PNRjXx9dpwDLS2zgMrPlZPtF9LtVrk6MnjIQfuaQy53OTROpenRpX3bdjgn8LRiEFKjQSTfcTdzWNBgDkO6fmktuY7KdXjgoEUymgeAg7v/AJXePP9luo9aeP0hg1O5gA2vtKTyq/k7OsTkOy6S+djcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSngT+1wNlMPCoqfspufGEtcYGoOTghFFP7Kv9xqUyY=;
 b=8KiZeSdG16YMgrDvqpNr2vBaAs4pN8OqVZFxKnjX4GtUFFu1IS5DzSNSFLJIsekfewOajT19RaWNRkV9gzt49N5TP2Q0uC+CQgC/zTM+txxhNvwQ8U/A+exXwz3ql+Ace6cviqhKOFSBx6krQCvpN9fLICWKxV4mCb+19wrzW0w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3] docs/misra/rules.rst: add rule 5.5
Thread-Topic: [PATCH v3] docs/misra/rules.rst: add rule 5.5
Thread-Index: AQHadnCsg0ZMZaBhh0eU/zuPKKU2jbFqtSeA
Date: Tue, 16 Apr 2024 07:38:15 +0000
Message-ID: <3ED1EB41-5260-4A1D-B14C-EFD86CFECA49@arm.com>
References:
 <alpine.DEB.2.22.394.2403141733460.853156@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2403141733460.853156@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI0PR08MB10655:EE_|AMS0EPF0000019C:EE_|AS2PR08MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: 7467feed-fbb0-468f-3e2d-08dc5de83413
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8h3XjgZchMylNnzEB7Ft2uluyA22gQgGbiFUD0ODaWNJnUaTK0/wIRnHF7R8o4oiqyk1AfLH0d6QO2bkDMn8a1a2WYtPEsoop3GvwnyLyurNUypadP8t4DJFGznovfUkdOnpsNLLjQRjx/BSbv2iacIoyC+GmGsNRCG/A2NTtbM95luNg0qG7GAkQ766c0gMucdrI87CZJK5btlVoS7d6tNAxF4xBHRayOVBqTfkWfoIC2pvfeTpLsmFAhWbqr4hLASIN4rQPNbZ8xgV6u9TeYKIKyG6NbFTxFgdC/SJdQewnPwvFhd6sogESd4FOAsZdabmiDAN2dLk/9EhWSLbp3TQk6uqgiuLm9ara2wna4bat9AoAzLVO4HSlzgcq+Q3308nqAUvxuqWWuC8duxWKFTNSqvJsi/GgJY9ac4Dd8zdVbZUTPhhc1axG5X6qtsseotTCQZDt92CGUv5AtjgcGMyKzdCStiWbMIqc4myjzufGODH1lYO7RfGGmv2wAk6gHP/cnCU0eBUxUaMjbz7hmNoyuXW1dN3ZmGk2PhtUUGs2mmMsjI0PUQD8yUxsBDBbTQ6JasOPbT79KExhYzzk6U8Zlq5RD+Vt/hj9o6sXpapgdJsykwc2b9qpcYyy/M6BKbeQrGO7i8gQBt7yMvyvH7vpR01EM2emB/uR9hFbUdwoLxtv40aGBeuCSmuxlPd4Ym1nLyQOr827XHsqAYEwVLeMLCPyjJ4SgZ/9flaSSI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F0235CE263701C499A8553DFA1580BD4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10655
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a52b8e75-0a20-460f-2b45-08dc5de82d8c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sxl10/1Z+NeeiUsWMCZbdm8orNyhZ3ScEVclKWcQfyIOZeER6rEnS8cwVZKv0vguTRby8M45qnRi8INfhJ5zXnmtWCVmwkFbsGOu87q90cXo/n6A0CdBuo6p+TjDbibMhhVVUswxWIZnEdoIwZG0janIqqjn+5+KAAde4NdSxdHe+IwCdiWHaMAnttGLCnwTOW7U7qCZGumz2GFA8MbUgdWnneFfq96Z1xCmkwLEbU8cRLnE4uDT/onQ1rvFT/Hk7z7phQh94CAWUx3qORYx8qrlpxP0KnCp8bkF0BsFY8SJKjSFJbeaeQMGgIwDv0vIPcLEs6+wKUZ2gVjG7sGO+hJwTNr0xJTMiYfkcyuiXyqpKMVvkJXC00h8F1mPBRDqoFIAmctJVhY/3FYBwxBNflvP2JuCb6AvlmZ1o1VOaG360LXvBujy3Owa1pUIjmIkkOWo+IaVKDVGmp2X3RPGay2ouhLtJ50w3rZ31XLEHu1InYRW5S0xnMbyWHWa9CMeRPEdhY1O+524gcbu5D8DV9OEZapngkSTkYxMO3lnzLMLNZld2C8I2vCmwGhcQmNaz+GXBQqpZulWT7HHrTpxIN8d0530GzTApCCfVzdDlnmUtYnkpT3HWFw1rw14QtP7LOFIm/4VFUTYLq+VIZnottSeE0EBzQcnDY+QeNM1574fMV0wABjLlpywlNvZ0RXYKRo83ti+wUnuj9Jypqjld4KlS60cEcA52GjL9URGzkQ0LcghLDdri0PC0iBTRlDR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 07:38:26.6614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7467feed-fbb0-468f-3e2d-08dc5de83413
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9986

Hi Stefano,

> On 15 Mar 2024, at 01:35, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

With the semicolon comment from Jan addressed:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


