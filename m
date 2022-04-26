Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822750FC8C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 14:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313849.531615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njK1G-000554-Tb; Tue, 26 Apr 2022 12:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313849.531615; Tue, 26 Apr 2022 12:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njK1G-00053F-Pc; Tue, 26 Apr 2022 12:10:14 +0000
Received: by outflank-mailman (input) for mailman id 313849;
 Tue, 26 Apr 2022 12:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuZH=VE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1njK1E-000539-LY
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 12:10:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1de92ee-c559-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 14:10:11 +0200 (CEST)
Received: from AS9PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:20b:48b::24)
 by AM6PR08MB3653.eurprd08.prod.outlook.com (2603:10a6:20b:4c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 12:10:09 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::95) by AS9PR04CA0075.outlook.office365.com
 (2603:10a6:20b:48b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Tue, 26 Apr 2022 12:10:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 12:10:08 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 26 Apr 2022 12:10:08 +0000
Received: from 2cda222bb88c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DCBAA8FB-CA31-47FB-BF45-DCD3C065EACD.1; 
 Tue, 26 Apr 2022 12:10:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2cda222bb88c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 12:10:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7430.eurprd08.prod.outlook.com (2603:10a6:20b:4e2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 12:10:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 12:10:00 +0000
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
X-Inumbo-ID: d1de92ee-c559-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCKw1nkpsgceXVHb8Mi4DlC2gPqh+4l4lId6VzMWBRg=;
 b=c34mp695Unbmx6bTDMYt/4pEK5DW1jUPqIQtk32w8KEIufHCBQiaGpJZ0ayVhN5F9AKagIhMr83y6H68ZfCfo39uqVr2zXY7RyHrcdGqUP+h9Q9FI5B0ocNXqpx8fJMRWmliai+uJBYRWa1BuvPM45Pqhiwq8LiGc+LUF+BPKsI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9014eba0ee3b770
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPNR0prR1Hk6icDkPX7KiDEjxhlF+mlTLMiXskP07CGaU/tFw9zjGqA3A0GU4jhzSrhMDTF/cES0rvnlfk3dO11S28JGBBcA8lxvk6igdpRqtzu7tbl2hA1WHNfzyING8afk0TnRUxtqD9Gg01b5JaAKK7uXhXnkk+gn7e76VQ8WkDFXFE8U52EeihAS6bgrgg+ylGx4iFJXQZYoH1JH0FetbVJuxDfXQ1LuMstcfZLqkiPyvELRVR4SWkp9cjpSN0M3FIRyKYMrMLxyGMNt7FQ3+WHeaSQ0fFT/H89uMLIef/xhdpKCC2td9B9CEeU9FrvQpnpQMAj2VFdcZeRevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCKw1nkpsgceXVHb8Mi4DlC2gPqh+4l4lId6VzMWBRg=;
 b=ggHxmCGlf7ygPOkoApxW5+aAz872T+8+bo0PWg/GMXcood7DNm+Fu+RnWNiBVvx2il9AgZv6CA9tzObM6h7+wnMz1T6OA/Crn+NoRNuahgICDKDGPkaCZzkrMviE0KfvNQwjMqvIsDepTtUToaIyn+ebknvhcdcckWxafNtCcm1QO6h/ZHIQ+Pu6KRCfJFZkQlNjfJZ6SDkleh84F3Jda7d5ivoSwLplcX/a4Mjt+F9/HpoMlO5bPREv1/K5IZ+2HQC4qw1kA+UI1904JtSXnPzv+moYIza1B9KGPlZ5KtQVE9UCd09SDkYYEmwyY2vN195OOo/TD/ZFRlTVADuC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCKw1nkpsgceXVHb8Mi4DlC2gPqh+4l4lId6VzMWBRg=;
 b=c34mp695Unbmx6bTDMYt/4pEK5DW1jUPqIQtk32w8KEIufHCBQiaGpJZ0ayVhN5F9AKagIhMr83y6H68ZfCfo39uqVr2zXY7RyHrcdGqUP+h9Q9FI5B0ocNXqpx8fJMRWmliai+uJBYRWa1BuvPM45Pqhiwq8LiGc+LUF+BPKsI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] EFI: don't mistakenly delete a file we never installed
Thread-Topic: [PATCH] EFI: don't mistakenly delete a file we never installed
Thread-Index: AQHYWJHnY72yQgrHIUiap4LuJb9TMa0CG/WA
Date: Tue, 26 Apr 2022 12:10:00 +0000
Message-ID: <3627405C-9D5A-45F8-8ABD-CE46D30C8BB5@arm.com>
References: <55e50138-1d41-1e79-f269-df875473b1d2@suse.com>
In-Reply-To: <55e50138-1d41-1e79-f269-df875473b1d2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e0f5c563-4ac6-4831-2270-08da277db4eb
x-ms-traffictypediagnostic:
	AS4PR08MB7430:EE_|AM5EUR03FT050:EE_|AM6PR08MB3653:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB365309E3F02D03C8E38EF8089DFB9@AM6PR08MB3653.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0D1YARbhBa5ArqHAiK3BywZv7Uz45li/QmUruTAXii2HE1TG6Jg15/srNxYUvfWUsq0GDCgQyBx8Zmo61CVc3FGWh0IReg4gsr9ARiOfYTQvYGAzECKD94nM6jZRW35SUgi20pSmHkFLaMnTAAele3rbpIs4jtdEzhVeU04qUSJsOVQqZMR8MTUwoBTI81i/UrLoNHI/SGQXGG6fKj6ClMj4EIt3UisEGVDpOmdp5Lr3vA3mShovVAyoMScunBRJBsG7T+t6bv62tltQJ6jgnj88KYvt9vJsANEO/zL52T2C+pO298ghhHtKlAUZPa6fX+riiwjpUdwHDYxxQ1yl3vuzHYwXfaAzAzTnXksWfEOlp7FjsKPFnpiPjxUC7MJLIakDSN5LS+8XNu5c7ItJEkQJi3UJqMf6u/DZz0o2qYFEK0RoprLVauu0uOUbHsBpTAwgPpo4QxjGLMr833C5KZZrNVzoK305q5uINjczuNnrgTNRFkLo16G+dM+O9yUvcNjklu1eLjjXZPxfHM1US5ypFXhGzkKKJee0Bz80LF6H1HwNVMP7QzENm7Ts/aErlX+T4Xgc8A3X3Byd29HL/cYpvt7kqvIRZfWYmHjy19WQoWywVRC38do/UP0rewSH3AzZFiXUm9GHb55IR50qzx1TRzEgFUWNnb3dphTRxdN7g1ayxdeNg18WNtZcFjQLNMA7JM/d2D2QzePqrFC6iLAqPjYJt22Ib26Trxw4lURY+7HdNk0FDdbtMT3/3GET
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2906002)(91956017)(4744005)(6506007)(2616005)(71200400001)(53546011)(6916009)(64756008)(66946007)(76116006)(8676002)(66446008)(33656002)(316002)(4326008)(5660300002)(8936002)(36756003)(66476007)(66556008)(6486002)(54906003)(6512007)(26005)(38070700005)(122000001)(38100700002)(508600001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31EA3147A65F6343BC2A6B906842790F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7430
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	025e20f1-75d7-4d6f-84f9-08da277daff5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	krVgezGzwoteG3HJjlACfcYmNuOCdOGkLO5fP5wFUy0p9mqI/VuYg0OhR6DTptEZzENhUc4kvNQ9RS/s5mOmLkSmHIfz/ejo95380MKFkkClE98VVi5pq/eXi8HpV99cgoQ7dqZhx4t1K6Q41PBrjTi2WmA5vwlC/ScGF4GvjN1nzsFHixiHqvIuhWdoGlJYBM6ZGdB4/tkYZycX6YjkE/IDJKQoPmPWwhT4Fqkup8ZHi9EiVy1p9W8WVV4uyeSenztLn8NAJEaMfOEhkrQH60T0+7iCrCbVUApKbsp2DpUir45QeOl+Mm1o72lGTNkQ993EdvRTxt0b+Z3/yhACXYe81gJiQcYaZOKIoEARFjKV8GHRutNHWqvrKDx6H2+vByQ32FHkleuy78YYFnOKEtH7Ks4/w3GEQsJETb0irMZpKODW+y/mRej3h93KwwA16OiaEv2Z1AbBx/iDLenjJL6ZRbFFtlJM+2/3oc0ZVQC5VajVyM/bZGZujdY1VmoHRnZwfzNmkNtEIXGYNrEMEBhJN1MpjFiY+4yvW+x9IIfHaibZB0ZTglX60PP5/IhYdAz4EkCMWA0ZDAyT3Ktj1lKmdrHp/0itLR8nuonsKAXIr6WUzVRMIHQHtoduAdFGb4DM22wdEMggQR9Tg4968TkHaYbzDByIBZ1ls7GIFzYCIAa5eJeMM8fwONMRUUxU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(6512007)(26005)(8936002)(86362001)(5660300002)(36860700001)(33656002)(47076005)(81166007)(186003)(36756003)(6506007)(53546011)(2616005)(54906003)(4744005)(82310400005)(2906002)(508600001)(6486002)(356005)(40460700003)(8676002)(70586007)(4326008)(6862004)(70206006)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 12:10:08.5425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f5c563-4ac6-4831-2270-08da277db4eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3653

Hi Jan,

> On 25 Apr 2022, at 11:47, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Just like for "install", make dealing with xen.efi on the EFI partition
> dependent upon mount point and vendor directory being known.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -515,7 +515,9 @@ _uninstall:
> 	rm -f $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map
> 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi
> 	rm -f $(D)$(EFI_DIR)/$(T).efi
> -	rm -f $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).e=
fi
> +	if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> +		rm -f $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).=
efi; \
> +	fi
>=20
> .PHONY: _debug
> _debug:
>=20
>=20


