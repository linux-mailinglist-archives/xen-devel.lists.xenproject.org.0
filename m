Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FC58AB19
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381212.615800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwqi-0001gr-V3; Fri, 05 Aug 2022 12:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381212.615800; Fri, 05 Aug 2022 12:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwqi-0001e4-RY; Fri, 05 Aug 2022 12:54:44 +0000
Received: by outflank-mailman (input) for mailman id 381212;
 Fri, 05 Aug 2022 12:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34eQ=YJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oJwqh-0001dw-3l
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:54:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c556bf5f-14bd-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:54:41 +0200 (CEST)
Received: from DU2PR04CA0271.eurprd04.prod.outlook.com (2603:10a6:10:28c::6)
 by GV1PR08MB7852.eurprd08.prod.outlook.com (2603:10a6:150:5f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 12:54:31 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::65) by DU2PR04CA0271.outlook.office365.com
 (2603:10a6:10:28c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Fri, 5 Aug 2022 12:54:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Fri, 5 Aug 2022 12:54:31 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 05 Aug 2022 12:54:31 +0000
Received: from be5b6f0dbe68.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FED3320D-18A4-4E64-830D-EDDD9683A9EC.1; 
 Fri, 05 Aug 2022 12:54:24 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be5b6f0dbe68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Aug 2022 12:54:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7549.eurprd08.prod.outlook.com (2603:10a6:102:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 12:54:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 12:54:21 +0000
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
X-Inumbo-ID: c556bf5f-14bd-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bXGOmyP6vVXNtjycsX8pOHF8pdnp4kxM0Nf8wxjHnwGtJTkqa10zPDtljpWi5Xy7RV594Yll0gpi5O2G6co1+OceeZYgOuJT+mABF4YZh7irvcmRsYczWymUtaTu84kpoMDqjfyKkRhfaDyESsRzXYogyDqoQ6+lEvUZ13CKx9EcReHpLTBeKzsVagx65XsmhI0nqUr7ymNnYlwU0sgByg2IJ9Wjz9EcXxKtYHd/EqmZ72nPma2dqTV0W2LQWjhF9PyPT7gN4csnFl2kk7QWZsC/cWW/9BObzk2Ag1p4LJzNqxtzyKHbXg/tFTsSuIKsK5Ia3UeKCllJ23cgkt8Fdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+rqeo4VSxegEgGsWXsWeCxXKRKj4dVn0Ew97snMRh4=;
 b=DBhVJsv2BzeXHUz7W1wwqS+HNQnUiWyrHL0HP9eMyUffrDLdvF2CTsp8pYWz7HU9X0UmNikS+bgETsS67Fgt9MWa56/F6HnDbZksxJ/rGFC3erzJ3cj3bbfxZ/JEFsr9d6CwFYfZe/YYq/g/YsGqPsrvNyzZW5+q940QPN7GQmHOxo41aI482U9MmQSWv45omvjZv36aLvmL/Mki8tDT7Wx7zKLG++1dQhugx2L4R3K6lZR13McuavbHmw+iNoL10SMdBt5MExPaUt+05FFrgGpucfPZEB/ZRuyI34IZ4QnwmEOAws4eCchTCBqn0Hwugt/iqDARrZ4B6CIxc4LMnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+rqeo4VSxegEgGsWXsWeCxXKRKj4dVn0Ew97snMRh4=;
 b=lfrLhcY9bU+/JFpThPu990yo1G6X6fYpNoYyJn2VDigA5IyhiGvvS4qDnMMPhbPXUv0pcmm38ly0S+ni31qJjD94Y008c4KlpcfdOoqrd+LzFWR26jH7RFwxU2ajpHi/iJFg6Ygl0Hnuk45LNjZuWbEjmog8r8WzEg0dyo+Ac1A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9317046ef2abcdd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAfBN+V1C8cv/NG3r5SmDkxEEP/BqQpH0pyDT/3LMoV6aYYLYF/AkHdL9iC9FKXol9UlROtuY+phCUsA6mlI+KAy8ASF3/szdlPDXs9CEsv1R6/IG5redyHgfP54W1ACgfdNan+sargu0EeiAsfra80H2PyUII9O8ucE00lsiTwAWJheQ9yNF/f/i3RP4jOZFyaHpTyexZAVcNnY0t/3RSqyQyiqWvu6DbKI/BdrmoQ/8AJXytR+pmUadFROUjHZKagm4dThQDPIz46AJ8MHM+W935g1W5yDlCC+b8z/gJ3PZmFTz74Cs1OUA6aG8B8HM3d+UHUrRhYpZYwla0afjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+rqeo4VSxegEgGsWXsWeCxXKRKj4dVn0Ew97snMRh4=;
 b=dJ0ZWrznP2mjO7qcxmedPxVq/EWCBhvSlR1KXIWDOGEXpCdpYOYj/cdBhBfi6j5Jt5r09CD0N3v8VZenz65sbuniJj3gAQFoJXt3mUU3/8O9wy2qV6n86sN1lWP3Ul0O0m0J0sxhFc/UpGH8ZfaNmopaRXiSS42ZmS2eDZe4swnsgw1btHjwTkh1zof45U+UvPgUz5GAtO9Aixa0+780z9RNC2JXQnixe3Yg8m+BgW3ePZEhCD244Ge++N/UIC62ylOKeztOcOf0/hwc98EsJCM6DwUJyapZLLEaO7ChKxiO9v1KFtk7JxNAElI8IeOylJAA47ZbUxmG0ajLrHkUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+rqeo4VSxegEgGsWXsWeCxXKRKj4dVn0Ew97snMRh4=;
 b=lfrLhcY9bU+/JFpThPu990yo1G6X6fYpNoYyJn2VDigA5IyhiGvvS4qDnMMPhbPXUv0pcmm38ly0S+ni31qJjD94Y008c4KlpcfdOoqrd+LzFWR26jH7RFwxU2ajpHi/iJFg6Ygl0Hnuk45LNjZuWbEjmog8r8WzEg0dyo+Ac1A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 0/3] xen/cpu: Minor coding style fixes
Thread-Topic: [PATCH v2 0/3] xen/cpu: Minor coding style fixes
Thread-Index: AQHYqMk4Rr0Mxe0A3UaODc1UlcvSOa2gQ2IA
Date: Fri, 5 Aug 2022 12:54:21 +0000
Message-ID: <8310EA29-F5F4-438B-8A80-FEA4709D8F75@arm.com>
References: <20220805124442.1857692-1-burzalodowa@gmail.com>
In-Reply-To: <20220805124442.1857692-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5ff75745-c9dd-420d-1378-08da76e1a3c7
x-ms-traffictypediagnostic:
	PAXPR08MB7549:EE_|DBAEUR03FT011:EE_|GV1PR08MB7852:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /17j/fFcZ0It91uLwv07E0NQix0YEBA8KNdWxxcnMw4lXiRYaIfXrik/UOW1y0VJaPCyKtvFcReUuO1H15B1UPGHkrvAqRqnJ0Iio4sSqAR2S/R+pLF3DHp83FJ/AtVNaaSGA57WFTx9QWXkIUCdjlbEoJ3ZIqmEnVliOROVpWzgOYnNUAIIYmXWHWt5tVW3XQercPcfTofrotGQsERZNdKkEKwtCjxrK9ysyECbxrQAxsuhLOP9wYWIGB0KCYZZhxKV9uhmV7eV4hxB/r8ZTFhfAUW3mMPVX7hR5c4/PuvpSfblDWI8P2GghhilfXxLvbLzUmgGQUo6J+pNExU+PXYm8wHNjRX94P0oDOOgUFSSupoDOeA73dFNgE0ABhNb6NdwxlAyWEYOUwuAxQUoBxxxmET+b0B5q6TOsKagn5UIhS12dZMtovT1TnfDpviBeQODJ7/kXPffyMERWeDbDDcRhd7BDztAbHO+8/Jjczm75WjAZ5cJsEJ5JfktCtEX3H2u4fhomMsNeyvwxCskkQyVW7HVhl7/Jz5JtOxfUzQWqgl50Jckpzwi1mFIBMwKutj41lHBXO8NlRMS5GY1H3R+Dkp1y6MIYpyZGPHIccoTblwmguEljJNc22+UZ++VOQ7CYNKfThAwnlFYg8Ca/nm24ofhqR/HiGXdeanYJ/ej+5xCkkb0bGMVptgICUribuAsiIcx6mdZv8naGrQcGQaBuYOa7dfdm8MpHD+rurMwT7+nzlM/k9DMTzDkgewX3Kw9ZsFs2+CLbrNp4bKEWptW4bi7UChNZ7qo9Q8mQkpdN+b7iIN1/alkHXwTyGngziY9kj+G6wyR6FdrZ2BLpQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(41300700001)(5660300002)(6512007)(36756003)(4326008)(91956017)(54906003)(66476007)(66446008)(76116006)(66556008)(64756008)(66946007)(8676002)(33656002)(6486002)(8936002)(478600001)(86362001)(6506007)(53546011)(186003)(71200400001)(83380400001)(26005)(4744005)(2616005)(38100700002)(316002)(2906002)(6916009)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <222294E86342844485EDA595761F4583@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7549
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40a93b6b-0d5b-4ed3-e30b-08da76e19e22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CZLZ+VGGiRuChGCS+Erg6G5OO7T7GDvWGzH5XJzY76vRJuvYFHcPMXDDEFZiqYd07Svhgahsy2BViH1/yF2g/b8S4F0RpxKzb+mmUUDixTad7kwWQwFLAjUCiK21PprVku3cTi1YTng+3K2URn+X2loG7ZCPjeKlL4sIBimqv7t1YtpKt7q/tvw/D5kVSouNBuoRn5faSM44OcBoFhBtQ2jj+uEJx6pSu5xQv2Mz/9rjn64RGQ+O4o6sL5yBT5MpA2LtGaxAKx/J4b5mKpaQ4XJYILErBapsRouIGGh4ClOc0xP59mBFj6KwOFPfyj5B9kVSwfsIAe0q8Rt3XmfjvdrIfqCgVr5n3E2xVJlRtOLvxhTSuSwXTrgu2dCyx7LTfMZNdnV8IIE614+rBK1p8Y9i2HkXSpkg5exItvAnWWy1qrNCDpusNRpOxJObbIKP+nBWOAaaWSrEzKs5UsFa8FjGiuk9OVF4gv7x0ho+8yhwf2t4Cmd7B2+I1/vrX8T1uDiq8V/2TK+i4UpuV+80c0FOgoneC7ayeTExk34IeKYAwkOdktmvV9hKBUoc11WUL5/NtM5+iSLQNgJz9NvGxKnzqrWBhbcJwsqXTGbDjfYzu/hrhLrmCIOYl6hOSRuKEKLWILQ/bqUvbPgCc4YFFtmfuEGLBmnOLFPx7ojdq7rnFha3siujb3Z0JQnAYd4q3w3fKmUIYLEdeuE71FA7XyNHlMgzKsCE6WjtJq6gpVR+gOJM0Bh3q0+UFyIV54nJucVrfZCZ0Iz8sKQdy4olYc1d7srdOUtcg5aHHJ7Ra+7ednZCdhcqSB5ZkJGeNwjc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(40470700004)(46966006)(336012)(356005)(47076005)(83380400001)(82740400003)(81166007)(36860700001)(316002)(40460700003)(54906003)(5660300002)(4744005)(8936002)(4326008)(6862004)(8676002)(70586007)(70206006)(2906002)(26005)(6512007)(53546011)(186003)(6506007)(2616005)(41300700001)(6486002)(478600001)(86362001)(82310400005)(40480700001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:54:31.3642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff75745-c9dd-420d-1378-08da76e1a3c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7852

Hi Xenia,

> On 5 Aug 2022, at 13:44, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Xenia Ragiadakou (3):
>  xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
>  xen/cpu: Add missing white space around arithmetic operators
>  xen/cpu: Undefine MASK_DECLARE_ macros after their usage
>=20
> xen/common/cpu.c | 15 ++++++++++-----
> 1 file changed, 10 insertions(+), 5 deletions(-)
>=20

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

But I agree with Jan that some patches could have been
squashed but I do not think we need to have a v3 here.

Cheers
Bertrand

> --=20
> 2.34.1
>=20
>=20


