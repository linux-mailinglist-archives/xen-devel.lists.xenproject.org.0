Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9660574A41
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367234.598315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvrL-0007eZ-8W; Thu, 14 Jul 2022 10:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367234.598315; Thu, 14 Jul 2022 10:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvrL-0007c4-5o; Thu, 14 Jul 2022 10:14:15 +0000
Received: by outflank-mailman (input) for mailman id 367234;
 Thu, 14 Jul 2022 10:14:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZjPX=XT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBvrK-0007by-2P
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:14:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4b243f4-035d-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 12:14:12 +0200 (CEST)
Received: from DB6PR0402CA0020.eurprd04.prod.outlook.com (2603:10a6:4:91::30)
 by AM0PR08MB3875.eurprd08.prod.outlook.com (2603:10a6:208:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 10:14:10 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::1b) by DB6PR0402CA0020.outlook.office365.com
 (2603:10a6:4:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Thu, 14 Jul 2022 10:14:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 10:14:09 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Thu, 14 Jul 2022 10:14:09 +0000
Received: from 16e2de483e8b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88CCA65A-B6BC-46BC-8B95-20F1FA76F769.1; 
 Thu, 14 Jul 2022 10:14:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16e2de483e8b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 10:14:04 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB7077.eurprd08.prod.outlook.com (2603:10a6:20b:34b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Thu, 14 Jul
 2022 10:14:03 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 10:14:03 +0000
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
X-Inumbo-ID: b4b243f4-035d-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YWQphDKYG7AhVVMYL+Lc2lgcO+bBRvFDLKdfv6+y8DZWB2iZi57GUHzCyboD3PqVqtSSA4MbUIwNfn0tVv60JNGtC6AqO3GK+oSXAHW2n8/y4eP13R7B6xDDHCN7yBgvIWyK8U0AoAZ3RPKpbtug16ktVZID2Z8cAicIS69GaNPG6172QSX23DkZnrssJgMexHaYnOqNNKn7lT5VJlQgStKJal/Cg6w6o7OqEa5ZH+/aMZ1c9UW8lakU4iEZqhDirKTi0mY0abHqHUEzfEBmjuEQ541+SYxZ+Ucw8zEEhYqCRNnBz/g/5WZaexFxDkL0DaIqJ9eYJZ9jqFBjMMu55Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ts86O84BYfVQcArgHkycbUW2jS5wZqD15tgO5hh3g3U=;
 b=l1mfZ0q7A9ZhWze/F3vs3xxJlCKaLNS2URMigzJopeEqHkFMRfts8JK9FXvHALpp0kfGYD861SRjNrK6dc3bq6fhb+tAnEEE9kzTYPsFEt8+L80pltzGdB2QHvBgq1GEJW8eLqLECiaKwXQJ3uugz2txFF22sAnxe6yltGWpSFJKsG6EVelnGjhGyX3DHLNZAzyRSxo10TjihB8xUzpD3RW465YRPnalS3rghL7uzJxsdikPu44y4BCXbc3ZPOKa0vZkMQi13THYbO+ZmX6ktlUhibFPw3lCyPm4Q5vlRi6zp5m6CvfRwY332ID/UadRk+LisxAgO9ILyR5SiAT7ew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ts86O84BYfVQcArgHkycbUW2jS5wZqD15tgO5hh3g3U=;
 b=PBSnrsEvr/If/CVXHcGF9L8QAYw+eaxW9uO/Avbml3YQDxZ8wWb47DR1cp+vENjruTvyo3CVqo+ri7eeu9UnybioTLox/0gr+5krIoCyzRFwx7F1zH4sdp2IEHLuvvcBQ7BFJMsYC9JbERPnuRgYg9Qa5loUKmUvcn6uWt9ECnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwIJONM5qEXx8o0geu9u1xjcAlG674TIGbBbwH/czgbYmBJ6OIDZyfGooRYwtnOsOZzDgGE3tKO/S9wpRf+3gJ3a7GKRotSrygxmR4f6sIy+VHLOsFvCZ5wEiVbyu3n9SoqymNetZCmqq0GCw2NYlYQQOX4E2nfO8NGTAZf00gl08E+gZMBg5JE9ZHZ1cELMOFRcXB0Yx/Q9JWQ3m3s1+8C3a995tbkpSe3Ukkku40Wf7ydA84ihFSXxzvAsZwCRjDfegLp+D+uf5ZBuMaSuSLISUnCt434W3iCEwz1Z3+YARUcxQAhd1LP1cJEHmvL+UpbSLRQxkBo9Unk9MCeV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ts86O84BYfVQcArgHkycbUW2jS5wZqD15tgO5hh3g3U=;
 b=dSNtiCQTP44qxeIJstBsswW+F95CG8raRv9V5gmjnYE22lAB3Ubm/VkscZb9UlsvL2y8KwmekzsA3M9thr49G8erEs3rpt7ep4TRhy7sjJB7ukyBuTKbl0FkE7nifI7GAAuYNSU/sto8X/aAf1/ZAkwjKR67dpv8geQX/QVelkrKcwHhPm5/vD6rA/moklUVqorS03qNvBZJjdNaD3ZZsGyGoXuNX/2Q+eey+tW80jJvaOai6YDuczNsdepARqb186zuoePFB4YxNiVmTC1weBLdUQmbZZ1eDX5fNtTJWCpUtG1bwZ4r7j5FAT9zJagtprkP3ueLnCyKS2H3o40/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ts86O84BYfVQcArgHkycbUW2jS5wZqD15tgO5hh3g3U=;
 b=PBSnrsEvr/If/CVXHcGF9L8QAYw+eaxW9uO/Avbml3YQDxZ8wWb47DR1cp+vENjruTvyo3CVqo+ri7eeu9UnybioTLox/0gr+5krIoCyzRFwx7F1zH4sdp2IEHLuvvcBQ7BFJMsYC9JbERPnuRgYg9Qa5loUKmUvcn6uWt9ECnI=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Topic: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Index: AQHYktrGRUcF8MDJDk6LN0+4egi+Ca160z2AgALXevA=
Date: Thu, 14 Jul 2022 10:14:03 +0000
Message-ID:
 <PAXPR08MB74200E2A75A2D755AC95BF519E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-10-wei.chen@arm.com>
 <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
In-Reply-To: <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F7EAD9C8B1304F418C36FA216A321D9B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3eb219e6-ad34-4e18-3eb0-08da658197cd
x-ms-traffictypediagnostic:
	AS8PR08MB7077:EE_|DBAEUR03FT010:EE_|AM0PR08MB3875:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oRSgw1GlKEDtavq55xntD4Ft7Zr32NXumxlc12cN/wjU/VvnIkYTqaGL2DpolCBJKJGVnQSL2LfkzMX4k7RVL6peGVy0uShtE2DxOKhaK1SBe5d1bHnmd6IEaIryeAUXy3ePgsQA6c6cJMxWTlczBGELwUp8h8ot+o3ba6/wkX2+dFvASkoW8/fQ8MVdlgDoW8oXt/4bkTfwj5h1KjtIA1E4zXv6L965hFazN+PY5TSrdHtcwcG2wjERLvcYf6pV5ABB8W0zS0Ypp0vxNa35l4gISVoz6EjoLe1uNJ/kM8WHfncyoqgWbNZuaTQ6EQxUv5dw3D++0pNsjYTXxP5vGkX3M1ILpUL8YJ2HL+YRBNlsVqHDM/OnuAuSC79Rhn0OjLv4M0q80ag6s3DwzM3kPllqGiI1TrwiFpIFoSqGZkzOrsttp2TVYbNytFEe1xiqiuI7hCiRZRAW9n62iZPRQu8NrORljtKfTCrY5QhG+hloch8U3FCjMO69kfMpK1zXIu3RtDbkWO3a2FQ79RePvGHjbHu6VOPPeJZAZZlgGt5kRJYVk71sa8LUR3Pxwwspxw2+lbYkxTihXvqhUzp6T7Q2M8TUFwXpTkOuxJL3TbZuMxPXWz1X9bzHgmDa/mAS+cqCZIGdqHJ1CHGV20QxH8ZDEKLMXho8nP0E76gqEmW2TPtrg2dNCKPGtmzJbDPKOsEYi5/41i2bC3lFd8gJyS3xpyanzr/aB7KKHbnIvUQs0zbotXacpYMIDboyCwV5es9712rDN79KBxwsvZtxNGad4JdmAjDmJAquxrZkvz+EY3SSiOHpXC+xUQpBkSYN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(26005)(33656002)(86362001)(9686003)(83380400001)(38100700002)(122000001)(38070700005)(6506007)(66476007)(71200400001)(186003)(41300700001)(4326008)(7696005)(76116006)(478600001)(66946007)(8676002)(5660300002)(2906002)(66556008)(6916009)(8936002)(66446008)(64756008)(53546011)(55016003)(316002)(54906003)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7077
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e61c7db7-4980-40ec-1724-08da658193d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jxzw9stHeXDmEsfa90pEfzw4pZKSC797Jj3OdXN9vB1mt0xqtyBIOmYC5dzRUK5PH8AeO6p58wmTx0GRk+cgaJzkeCSHnM6t/YGUnjPnmTAK/oQtpfj/bNeLRFm9wNxPkrYkVo8ObKLZLux/A2d6V9xFOgTxY26RZn/MV6yNap98F6kuev3fbgjH9rZN6q+cTOSbFRvBVFaFrZoSDt9A2r4/KRlR9kEoUAOsoFU0JeT8lvSJ3t/05iK5tW3IzyhN5V8fhbGxF5SIz0/vcQ3K30MbhriLPTILKHBojLNe3ow5sjXNZgCu/+dugUURwvS3x76uf0lQwR/urRCiYhtaobsNvLzeKJ2QMSac5lUt7jwAhQDiJ7uM+9AWoQqXqQZbGbwE+gevZoPEiqzdhXjSbzgEkFXA1HI/HG3LSwOq66l/wgkxhi5aUohjURYZU87+nXEVLRaLtLq9NxotKxQeC9tsUQ6Rn0Otu67vnLYMNRoGgzNSCwaihQlpiS66am9xdgWc+8vqAYKnQ9WutC2eJNYfKp+HbKFu7Wde4Jxdf6W3LbWbxaz54GZgujXuCORV11EyIsaafm3gGhCRqJAT4ftKXnAdSKT12q3vHvQ/PVs3d33NSN0z+MPT+JU/WQTGuPurp0bZmr4a6XSap+e1pZrW+8Gw1Mq1BYZbpvsx8g+FMZC4IYtH8i0Y+krDb/5U0MNIvP3dnLe/hNtJcT1VIi4YChjH/0QK94L+cM96BAZiBbMjhi0xZgc7owL+zZn57zqu9Y7g91fS+luTkKOlbyM6eJH6Jpkt/m1VbDvhC/3VrpC/Hnyx0RLgHAJOKDNA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(40470700004)(46966006)(36840700001)(33656002)(55016003)(6862004)(40460700003)(8936002)(2906002)(40480700001)(86362001)(5660300002)(70206006)(82310400005)(316002)(8676002)(70586007)(54906003)(52536014)(356005)(41300700001)(36860700001)(336012)(186003)(26005)(478600001)(4326008)(9686003)(6506007)(81166007)(82740400003)(53546011)(7696005)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:14:09.8343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb219e6-ad34-4e18-3eb0-08da658197cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3875

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAyMjozNA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgOS85XSB4ZW46IGludHJvZHVjZSBhIEtjb25maWcgb3B0aW9uIHRvIGNvbmZpZ3VyZQ0K
PiBOVU1BIG5vZGVzIG51bWJlcg0KPiANCj4gT24gMDguMDcuMjAyMiAxNjo1NCwgV2VpIENoZW4g
d3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gvS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL0tj
b25maWcNCj4gPiBAQCAtMTcsMyArMTcsMTQgQEAgY29uZmlnIE5SX0NQVVMNCj4gPiAgCSAgRm9y
IENQVSBjb3JlcyB3aGljaCBzdXBwb3J0IFNpbXVsdGFuZW91cyBNdWx0aS1UaHJlYWRpbmcgb3IN
Cj4gc2ltaWxhcg0KPiA+ICAJICB0ZWNobm9sb2dpZXMsIHRoaXMgdGhlIG51bWJlciBvZiBsb2dp
Y2FsIHRocmVhZHMgd2hpY2ggWGVuIHdpbGwNCj4gPiAgCSAgc3VwcG9ydC4NCj4gPiArDQo+ID4g
K2NvbmZpZyBOUl9OVU1BX05PREVTDQo+ID4gKwlpbnQgIk1heGltdW0gbnVtYmVyIG9mIE5VTUEg
bm9kZXMgc3VwcG9ydGVkIg0KPiA+ICsJcmFuZ2UgMSAyNTUNCj4gPiArCWRlZmF1bHQgIjY0Ig0K
PiA+ICsJZGVwZW5kcyBvbiBOVU1BDQo+IA0KPiBEb2VzIDEgbWFrZSBzZW5zZT8gVGhhdCdzIG5v
dCBnb2luZyB0byBiZSBOVU1BIHRoZW4sIEkgd291bGQgc2F5Lg0KPiANCg0KT2ssIHdlIG5lZWQg
YXQgbGVhc3QgMiBub2RlcyB0byBiZSBhIHJlYWwgTlVNQS4NCg0KPiBEb2VzIHRoZSB2YWx1ZSBi
ZWluZyAocGVyaGFwcyBmYXIpIGxhcmdlciB0aGFuIE5SX0NQVVMgbWFrZSBzZW5zZT8NCj4gDQoN
CkFybSBoYXMgMTI4IGRlZmF1bHQgTlJfQ1BVUyAoZXhjZXB0IHNvbWUgcGxhdGZvcm1zKSBhbmQg
eDg2IGhhcyAyNTYuDQpTbyBJIGFtIG5vdCB2ZXJ5IGNsZWFyIGFib3V0IHlvdXIgY29tbWVudHMg
YWJvdXQgZmFyIGxhcmdlcj8gQXMgbXkNClVuZGVyc3RhbmRpbmcsIG9uZSBub2RlIGhhcyAyIG9y
IDQgY29yZXMgYXJlIHZlcnkgY29tbW9uIGluIGEgTlVNQQ0KU3lzdGVtLg0KDQo+IFdoeSBkb2Vz
IHRoZSByYW5nZSBlbmQgYXQgYSBub3QtcG93ZXItb2YtMiB2YWx1ZT8gKEkgd2FzIGFjdHVhbGx5
DQo+IGdvaW5nIHRvIHN1Z2dlc3QgdG8gaGF2ZSBhIHNoaWZ0IHZhbHVlIHNwZWNpZmllZCBoZXJl
LCB1bnRpbA0KPiBzcG90dGluZyB0aGF0IE5PREVTX1NISUZUIGlzbid0IHVzZWQgYW55d2hlcmUg
ZWxzZSwgYW5kIGhlbmNlDQo+IHlvdSdyZSByaWdodGZ1bGx5IGRlbGV0aW5nIGl0LikNCj4gDQoN
CkkgdGhpbmsgd2UgaGF2ZSBkaXNjdXNzZWQgYWJvdXQgdGhlIDI1NSBpbiB2MS4gQmVjYXVzZSBY
ZW4gaXMgdXNpbmcNCnU4IGFzIG5vZGVpZF90LCBzbyAyNTUgbWF5IGJlIGEgdXBwZXIgYm91bmQu
DQoNCkFuZCBpZiB1c2UgYSBzaGlmdCB2YWx1ZSwgZnJvbSBhIHVzZXIgcGVyc3BlY3RpdmUsIEkg
ZG9uJ3QgbGlrZSBpdC4NCkl0IG5lZWRzIHRvIGJlIGNvbnZlcnRlZCwgbm90IGludHVpdGl2ZSBl
bm91Z2guIEl0IGFsc28gbGltaXRzIG15DQppbnB1dCByYW5nZSwgZXZlbiB0aG91Z2ggbXkgbnVt
ZXJpY2FsIHZhbHVlcyBhcmUgcmVhc29uYWJsZS4gWWVzLA0KaWYgYSBtYWNoaW5lIGhhcyAxNSBu
b2RlLCB3ZSBjYW4gYXNrIHRoZW0gdG8gaW5wdXQgMTYsIGJ1dCB3aHkgbm90DQpsZXQgdGhlIHVz
ZXJzIGRlY2lkZT8gaW5zdGVhZCBvZiBiZWluZyBmb3JjZWQgdG8gZW50ZXIgMTYgYnkgdGhlIHBy
b2dyYW0/DQoNCj4gPiArCWhlbHANCj4gPiArCSAgQ29udHJvbHMgdGhlIGJ1aWxkLXRpbWUgc2l6
ZSBvZiB2YXJpb3VzIGFycmF5cyBhbmQgYml0bWFwcw0KPiA+ICsJICBhc3NvY2lhdGVkIHdpdGgg
bXVsdGlwbGUtbm9kZXMgbWFuYWdlbWVudC4gSXQgaXMgdGhlIHVwcGVyIGJvdW5kDQo+IG9mDQo+
ID4gKwkgIHRoZSBudW1iZXIgb2YgTlVNQSBub2RlcyB0aGF0IHRoZSBzY2hlZHVsZXIsIG1lbW9y
eSBhbGxvY2F0aW9uIGFuZA0KPiA+ICsgICAgICAgICAgb3RoZXIgTlVNQS1hd2FyZSBjb21wb25l
bnRzIGNhbiBoYW5kbGUuDQo+IA0KPiBOaXQ6IGluZGVudGF0aW9uLg0KPiANCg0KT2suDQoNCkNo
ZWVycywNCldlaSBDaGVuDQoNCj4gSmFuDQo=

