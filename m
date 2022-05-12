Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB1525095
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 16:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327799.550687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npA8V-0001Lz-HX; Thu, 12 May 2022 14:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327799.550687; Thu, 12 May 2022 14:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npA8V-0001Iw-Dr; Thu, 12 May 2022 14:49:51 +0000
Received: by outflank-mailman (input) for mailman id 327799;
 Thu, 12 May 2022 14:49:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wFL=VU=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1npA8T-0001Fg-Av
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 14:49:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be7a7efe-d202-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 16:49:37 +0200 (CEST)
Received: from DB6P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::20) by
 VI1PR08MB5536.eurprd08.prod.outlook.com (2603:10a6:803:13b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 14:49:45 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::b9) by DB6P191CA0010.outlook.office365.com
 (2603:10a6:6:28::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Thu, 12 May 2022 14:49:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 14:49:44 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Thu, 12 May 2022 14:49:44 +0000
Received: from dfa43a87206a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 743E7938-89AC-428A-8762-2FA9EB33EE2D.1; 
 Thu, 12 May 2022 14:49:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfa43a87206a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 May 2022 14:49:38 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 AM6PR08MB5240.eurprd08.prod.outlook.com (2603:10a6:20b:ec::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Thu, 12 May 2022 14:49:36 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 14:49:36 +0000
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
X-Inumbo-ID: be7a7efe-d202-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ps987oW8EXj3l6pY4huZe8VoZ2PUTyD2wr1r9V11rPahe6HvzTIicrwvxTujfPLffisfst3WqWLx+TMJKGXzRwyYmZntDhcMUVhGaoTnNxh8Ni0ZGEVHuusvngqR2av4PnY8jO6wY5rDpk3rS975+AAgT1zDouzq06Ll83lPkzEYR8ZtfWnfr+CRGKK+VwtyjGaWTzI0Y4Lg76Zl1+BUwDC2H8aNSvPzkFMXFzAYSTc2t9EnvXMh63yIHVtBp9Un/VTVzOyKURAGacuOYHHzdePwh9TTNRZsiCKJGHHVViV0nLD1ogKI/TnWUpG8vaX/D3ThuUZdNJaj2pBqIaYFlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R34zatSsJDgZlU2Csru8AdOxDWJ7Q+JOYSjBjoXRWW8=;
 b=NW5j5wXyP+FHzAyOYDsixgkqqhvtrhF5k7loJjE2xVzns4S90QAjJ01y3x2319qsdEKo8j93NakqFcRK1iat4I4SpsJa7awyb5DD8ZCSQ/RTrp4YUBQ+UkuCH9JlUvrPgqhu26nL0QUDmsLebzy4rjdivnfbLRQ6T827vr3MkHx3BlAjd4udJ2YNB3ibU0aPKTLtVrgG903utHL7yPoWMbaxvfXipA1B5UP3WhsQnJ2bhdm4dQZGzHopLvbBr75sBp0JGyN8tIJuFzV5FXDkv1uAgALl0P4UfS9gdkrpqjTBOQ/e4rMjlqV1b+0+IV6IC+ZPFtMHgnZD6BsqWwbo9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R34zatSsJDgZlU2Csru8AdOxDWJ7Q+JOYSjBjoXRWW8=;
 b=CaumP5FhnLEpjdE57bIvSUBrgmEL60D+XFgmP+2FKATZnNEysh6QFdLu5LgowhLwmaEKLTjabCIVwkzMIAFea4yigTE/E570BYkF9y+F4lDnhXiOrxsISAQ3cX4fwH5QQscGMb0j8X+m0cCeMaGiLrsp5aGGgSt+TK8iu74RRHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 083ef4c27f377e7b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEWBAAlyqb/lFn+xG/w8ILzj3etTzIjCT4bdDfDj60v8aikPSxlgJ1ZCFN/Vf27mrIIOjZOaFr0pjjk9ZAgnbT3ckPVAm/zQr2j7OVu2Sywq/xsuzGbZpds1+4B47HOXVA9Q4ndKFYHi/wTIhPbHMUiV5ZS9pUOSDqgw8LqONB6xtL9xevq0O3umTt2gefc7YmYtRZvsrXiradyO0hnsnNzb5XORRqln+BOuTLBp4nxug5B7iupOxgzMIgzivvaauEAu4O8QrOFJ8GWWNZdiLUfbfd/0/VMp463VafuGJQVx1Qqupo0pRhNYSezGPFDGk3i+p8ijzuLe0djsBSKzlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R34zatSsJDgZlU2Csru8AdOxDWJ7Q+JOYSjBjoXRWW8=;
 b=XXw4qZB+yCz38/evpZBp2Fj/CrPnBdxVd4chNXASm+L14H3qPv31W1m/gOyeD2ZUMgrLiGts9w/ZX8spN+YEmVVJXOSPac6h71b+UtojeruGF2yFBFhidNb63+811hB+12IPhtcpjjzTI1zBhxTlXkbAXg9/MeJXafWNkxGke8xcq547pqR8EEbYfpAoXCWF6EWzqXzNwLLt+0dBDe8QDoKtUkXCJBs5/NGTbN+IL1yK1ZLQwh0VmQkaW+cfdPGg/8KCjjFoI6EZr9U7TUChJeJz2NisK7IV6HpOEc14ZH/8yveGXlz4gbBljYLQaSJXOO/nD6TQXTB1+YKPv6aNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R34zatSsJDgZlU2Csru8AdOxDWJ7Q+JOYSjBjoXRWW8=;
 b=CaumP5FhnLEpjdE57bIvSUBrgmEL60D+XFgmP+2FKATZnNEysh6QFdLu5LgowhLwmaEKLTjabCIVwkzMIAFea4yigTE/E570BYkF9y+F4lDnhXiOrxsISAQ3cX4fwH5QQscGMb0j8X+m0cCeMaGiLrsp5aGGgSt+TK8iu74RRHw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, "jandryuk@gmail.com" <jandryuk@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 2/2] flask: implement xsm_set_system_active
Thread-Topic: [PATCH v7 2/2] flask: implement xsm_set_system_active
Thread-Index: AQHYZSqr0Uc8/+XCjEWwTmvXksGA0K0bVKoA
Date: Thu, 12 May 2022 14:49:36 +0000
Message-ID: <7565B32C-66DD-4820-8D5E-3A62FE87008C@arm.com>
References: <20220511113035.27070-1-dpsmith@apertussolutions.com>
 <20220511113035.27070-3-dpsmith@apertussolutions.com>
In-Reply-To: <20220511113035.27070-3-dpsmith@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 77299bcb-547d-4e95-0794-08da3426a752
x-ms-traffictypediagnostic:
	AM6PR08MB5240:EE_|DBAEUR03FT062:EE_|VI1PR08MB5536:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5536D12F6F63BC043344F07DFCCB9@VI1PR08MB5536.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xv94xlHJiLPdl7yoNxe8GfGKvVO9HWgdFZx4wxIi0N2d4x+PYmvbOAAIzcCN3e+rDTSgP85aCMQXBNRSxfThdiNwcLpUp7L1/hzSDLyUPcjslWLElHpXXITA96VjznpiikCRvUhLPeN/B7Vx6sZMP5ZUkW/r5bzMOQlvIsxJEsFQJvDP/u04jBz/RGGUS0KaYwEmepLz/9Ipbp16cqIJuRorwZbZgL5gA7N5ta65MOI8dt5OQUyCBVZ96dJY00Vg68OVxvlI/4xgH96PLjjbLrCXRyWbdqLzB/S2uCLwwi8mUVtYoNA2yg3eWpxF5sfCESp0gnVntG4zrQIf+rXycHM1PJ4LTbxymygrM5U4DmFdVgcjAMjry1dWcHd+ds75N5MdTF5Jr4j5DC0mhD06Pt/pcoGsrVNHLtr903DmFRYcnjf78oWxiCx2cm+2xQTXZviTJBMfbR6YhXTsF7r3uhk7VeYpv2m6m0aVj+2PUJx+beqPQ6glOKIkID7cYxbKjmfSpP8aRHYrwxxlQYSoEZML07XIatgoHAIwxOgwV0whaaLmMFu1mxKAAGqcTEmB9o9ZHCm6asdgxz/6GKZ3EFVEbm8wzC8LSBWSAgMQLzkZa93y4We+I635Wcx2P7uGHqGjdCjP7qBoh9uDE+9jqR3ZpP3VrYL5QbD2phRTF4UYTyB4usS6C36uhwDEfPrqudSjP3Luhl6FLPljXKF3Rp299Rm2ydOgf/yOSk/eqQOH+NbJAmttQU2yLKKKvL5f
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2906002)(71200400001)(316002)(186003)(76116006)(64756008)(66556008)(66476007)(66946007)(91956017)(66446008)(8676002)(6486002)(83380400001)(5660300002)(33656002)(508600001)(8936002)(2616005)(6512007)(26005)(122000001)(6506007)(53546011)(38070700005)(54906003)(6916009)(38100700002)(86362001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF2091F0BA6E9C41B7C756614A747620@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5240
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a1cc5cc-7263-4f1d-25b4-08da3426a26a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Vpt9YWS7wSxhV72tG4YyP7DRXrYwNJuIbcbKRF8VCnP5z0J/3JigmyyXz7DYOqZpw3DvG5R4eFgLCp6vWkQ3KcrnB9SDRGhgzSRHfHydfTJZml5YjQcSL4u+0pskwmeG0pSHFhKiyCa1hHKZPt0lbGyUZ6qEWUU23xVVvcqb5D/04RxzyK9joL+sY3Vh8HPJGCBmreMucL87HpqtgSpi7g+1VSwzwDpq6IhnmB7d/LtzrNR+ViZj4C+VzVnyb2KzO5QpkCChrDNBNxG3RCmPlzdyOqvj2kHRz61CWqzfbaw7vHv3OMFUR1CxkrIAXvg0O8fr12QFB5rdul67v0dV4zcULv1AToeUL3pQHt20NohJk9wXE8Y/yZWYSXv3XTovVfemvhNIWsB3ZES6gX6wpgAGy7lXbsjlXQe3GCLWiJ4S9oOgSML+R1F0fKodB/dRiC0jT0tvmczgx+/QQAExGlmi7iN3riknIwubT0OYCcxXpXYoeQJaQrgfarsPpWY5XQ1tLMVvkBx+M94ft9E3osvlWa+OsMLJvQmnd0nKowrlizRk0IuT2frqylxznGGs5MTnHbLZyjPLn/GmhgZrZGydxFJo7DUF82oC9u/Vd9SjNIPtgFo3iRp9icA3LCgS0X3LaMgp1rQm/PZVK9Y7+W4+AQ/g1wEoQBpKi3OjD/crDCBJAwSjZT3pKgiJtM8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(6486002)(2906002)(36860700001)(36756003)(6506007)(356005)(53546011)(81166007)(82310400005)(508600001)(47076005)(86362001)(2616005)(336012)(107886003)(6512007)(26005)(8936002)(70206006)(70586007)(40460700003)(5660300002)(33656002)(8676002)(83380400001)(186003)(54906003)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 14:49:44.6762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77299bcb-547d-4e95-0794-08da3426a752
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5536

Hi Daniel,

> On 11 May 2022, at 12:30 pm, Daniel P. Smith <dpsmith@apertussolutions.co=
m> wrote:
>=20
> This commit implements full support for starting the idle domain privileg=
ed by
> introducing a new flask label xenboot_t which the idle domain is labeled =
with
> at creation.  It then provides the implementation for the XSM hook
> xsm_set_system_active to relabel the idle domain to the existing xen_t fl=
ask
> label.
>=20
> In the reference flask policy a new macro, xen_build_domain(target), is
> introduced for creating policies for dom0less/hyperlaunch allowing the
> hypervisor to create and assign the necessary resources for domain
> construction.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> tools/flask/policy/modules/xen.if      | 6 ++++++
> tools/flask/policy/modules/xen.te      | 1 +
> tools/flask/policy/policy/initial_sids | 1 +
> xen/xsm/flask/hooks.c                  | 9 ++++++++-
> xen/xsm/flask/policy/initial_sids      | 1 +
> 5 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modul=
es/xen.if
> index 5e2aa472b6..4ec676fff1 100644
> --- a/tools/flask/policy/modules/xen.if
> +++ b/tools/flask/policy/modules/xen.if
> @@ -62,6 +62,12 @@ define(`create_domain_common', `
> 			setparam altp2mhvm altp2mhvm_op dm };
> ')
>=20
> +# xen_build_domain(target)
> +#   Allow a domain to be created at boot by the hypervisor
> +define(`xen_build_domain', `
> +	allow xenboot_t $1_channel:event create;
> +')
> +
> # create_domain(priv, target)
> #   Allow a domain to be created directly
> define(`create_domain', `
> diff --git a/tools/flask/policy/modules/xen.te b/tools/flask/policy/modul=
es/xen.te
> index 3dbf93d2b8..de98206fdd 100644
> --- a/tools/flask/policy/modules/xen.te
> +++ b/tools/flask/policy/modules/xen.te
> @@ -24,6 +24,7 @@ attribute mls_priv;
> #########################################################################=
#######
>=20
> # The hypervisor itself
> +type xenboot_t, xen_type, mls_priv;
> type xen_t, xen_type, mls_priv;
>=20
> # Domain 0
> diff --git a/tools/flask/policy/policy/initial_sids b/tools/flask/policy/=
policy/initial_sids
> index 6b7b7eff21..ec729d3ba3 100644
> --- a/tools/flask/policy/policy/initial_sids
> +++ b/tools/flask/policy/policy/initial_sids
> @@ -2,6 +2,7 @@
> # objects created before the policy is loaded or for objects that do not =
have a
> # label defined in some other manner.
>=20
> +sid xenboot gen_context(system_u:system_r:xenboot_t,s0)
> sid xen gen_context(system_u:system_r:xen_t,s0)
> sid dom0 gen_context(system_u:system_r:dom0_t,s0)
> sid domxen gen_context(system_u:system_r:domxen_t,s0)
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 54745e6c6a..80b36cc2d8 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -168,7 +168,7 @@ static int cf_check flask_domain_alloc_security(struc=
t domain *d)
>     switch ( d->domain_id )
>     {
>     case DOMID_IDLE:
> -        dsec->sid =3D SECINITSID_XEN;
> +        dsec->sid =3D SECINITSID_XENBOOT;
>         break;
>     case DOMID_XEN:
>         dsec->sid =3D SECINITSID_DOMXEN;
> @@ -188,9 +188,14 @@ static int cf_check flask_domain_alloc_security(stru=
ct domain *d)
>=20
> static int cf_check flask_set_system_active(void)
> {
> +    struct domain_security_struct *dsec;
>     struct domain *d =3D current->domain;
>=20
> +    dsec =3D d->ssid;
> +
>     ASSERT(d->is_privileged);
> +    ASSERT(dsec->sid =3D=3D SECINITSID_XENBOOT);
> +    ASSERT(dsec->self_sid =3D=3D SECINITSID_XENBOOT);
>=20
>     if ( d->domain_id !=3D DOMID_IDLE )
>     {
> @@ -205,6 +210,8 @@ static int cf_check flask_set_system_active(void)
>      */
>     d->is_privileged =3D false;
>=20
> +    dsec->self_sid =3D dsec->sid =3D SECINITSID_XEN;
> +
>     return 0;
> }
>=20
> diff --git a/xen/xsm/flask/policy/initial_sids b/xen/xsm/flask/policy/ini=
tial_sids
> index 7eca70d339..e8b55b8368 100644
> --- a/xen/xsm/flask/policy/initial_sids
> +++ b/xen/xsm/flask/policy/initial_sids
> @@ -3,6 +3,7 @@
> #
> # Define initial security identifiers=20
> #
> +sid xenboot
> sid xen
> sid dom0
> sid domio
> --=20
> 2.20.1
>=20
>=20


