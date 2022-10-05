Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0AB5F50F3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 10:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415949.660577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofzuN-000449-Dn; Wed, 05 Oct 2022 08:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415949.660577; Wed, 05 Oct 2022 08:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofzuN-00042N-Ax; Wed, 05 Oct 2022 08:37:39 +0000
Received: by outflank-mailman (input) for mailman id 415949;
 Wed, 05 Oct 2022 08:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzUo=2G=citrix.com=prvs=27000a6ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofzuL-0003z9-IM
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 08:37:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f52d8399-4488-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 10:37:35 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 04:37:30 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5459.namprd03.prod.outlook.com (2603:10b6:208:296::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 08:37:28 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 08:37:27 +0000
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
X-Inumbo-ID: f52d8399-4488-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664959055;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RLA6cx/EZ9WUyNlhNDNnAskdG0wZnbGIduNypb1wTaU=;
  b=HjbiHRdoA7pmS6fEerrd2xj4zBU5ua41CXiZyNtc8kzXHezOkzPi/YCC
   5e4bOnb+Sg7hoLhKjfQuWh6aVlg4peBFP2UGObTFVb6L6Vej/cI6geMy7
   iegyN4hbYVcXikOkq0wxMsMZMW5HFugttuwA0JezVYGGsoM5gFUbSXfFt
   o=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 84526562
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ug4fv6PHpVuQyy/vrR1clsFynXyQoLVcMsEvi/4bfWQNrUok02MFz
 mEZXG3QbKyDNGOgeYh+bdu19BsAv5DTmtQxTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayq5WtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eEKMox/tmPn13r
 vU1Lg4SLQHY2emb6efuIgVsrpxLwMjDGqo64ykl6A6DSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9RTM/ftfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPlWffrC/y3IcjmwuiSrg0SrqA9ccw3kaS7UpCDBQKXnuC9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYHQMZZGeA+7ACLy4LX7hyfC2xCSSROAPQkqcs3SDoCx
 lKP2dTzClRHurCPVWiU8LvSqDqoIDUUNkcLfypCRgwAi/Hdp4U0ggPKX8xUOqe/hd3oGhn92
 zmP6iM5gt07ksojx6i9u1fdjFqEtpXPCwI4+AjTdmak9R9iIp6oYZSy7lrW5uoGK5yWJmRtp
 1ABksmaqeURV5eEkXXVRP1XRen4ofGYLDfbnFhjWYE78Cig8GKieoYW5yxiIEBuMYAPfjqBj
 FLvhD69LaR7ZBOCBZKbqaroYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:wy28XKw0hJN+srjxt3OrKrPxRugkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICOgqTM6ftWzd1FdAQ7sD0WKP+UyCJ8S6zJ8n6U
 4CSdkDNDSTNykcsS+S2mDRfbcdKZu8gcaVbI/lvgpQpGpRGsVdBmlCe2Sm+hocfng9OXN1Lu
 vq2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJTIWGhI97wGKrDWwrJr3CQKR0BsyWy5Ghe5Kyx
 mPryXJooGY992rwB7V0GHeq7xQhdva09NGQOCcl8QPLT3oqwCwIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKYQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8ABY3EdBIi451egbQrxNIhqA07I
 t7m0ai87ZHBxLJmyrwo/DOShFRj0Kx5V4vi/QagXBzWZYXLJVRsYsc1kVIF4poJlON1KkXVM
 1VSO3M7vdfdl2XK1jfo2lU2dSpGk8+Gx+XK3JyyPC94nxzpjRU3kEYzMsQkjMr75QmUaRJ4O
 zCL+BBiKxOZtV+V9MzOM4xBe+MTkDdSxPFN2yfZX79ErscBn7Lo5nrpJ0o+eCRfoASxpdaou
 WMbLphjx9yR6vSM7zP4HUSmSq9A1lVHA6dh/223qIJ9IEVH9HQQG++oFNHqbrSnxxQOLyfZx
 +JAuMmPxbSFxqQJW935XyBZ3BzEwhqbCRHgKdOZ3u+5uT2F6bNisv3NN7uGZuFK0dVZoq4OA
 pIYATO
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="84526562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi1bGwFL9vx81jHoz3EQyEvtGR6+n2Ff/+F9+Du4/KctuesxtIERF893bUtGg//9IsAqilaPeeu+Id3OBVI4QDLBjmXeXN6uNsRLvu5AqdJxkRCfSLYYrKJuL4t0za4AGM2E11TVkNhfe8xSJ6zOqRmjaN9aR0CGUrlpZC9WGEYnXCwGgmWbEyEJ/VgETQlWcbxUHuUGJutL+hMAiJap2WjPj23CkmGaD3P4byas/8LPc9PKPOPYrycn2uok5HqnDOg46upUYcbcdH6YsxxZatqg3bf3iMXGNCWisDMnJtWRYG5zqbY2/KcGQSMs9lJjUU7F58EyCMu4iMvHo2PkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qjRENa9XEdFpSHmz8m7rWW4in8xI1o0DhPHr6aPK+E=;
 b=OmIRPI+wLF9JrL+w9jfa+oNZvb2SrKzGkaEuhJLI1AKAJ1RFypkyLXndM9sYZZhz33uFS7fUUw4SSAm6l8Mk2VWrXkVLIanPsXgZLwiATcg2WKCsCj4/1JVQD7G88gSrFaPJO9LbHEZEH+tolUf6A5OwvhxH3MdBcbPFmYyT0CbdZeqavzzWSG7Ds3MfAWlpjw1rpKhY9gGDy35sbnEYipLU69/KM0HYxV8ZGz3SpSKh6tGdYxd3ttZCNYg0agLMzo7yEMhIFnSSbhwB/g6nG+1z/4pqX5Zahf6s/HU+40ALKJsXOstTg4z26Qxog4ttjfRgx733ggl/MdcPXb6Kxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qjRENa9XEdFpSHmz8m7rWW4in8xI1o0DhPHr6aPK+E=;
 b=Q2y8uj+msskSklQaYjbZEPyV46JqHjG3ctnZeiUUwfi2A/cUiJQXzYFtAhKlUPgNVdplaQFhmeBMYx7lxzGq5NPz8RVqf8FLXWS2v5CswszwkvvYRH2nEFvmjSPMRlLWXRAqAEte6ZnnGBISxtAh9mFw4T0VA3QKoE5bW8a/n/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Oct 2022 10:37:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Message-ID: <Yz1CPNwo1hiWZTw2@Air-de-Roger>
References: <20221004153645.3686-1-roger.pau@citrix.com>
 <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
X-ClientProxiedBy: LO4P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5459:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb60144-3e47-4090-7ce0-08daa6acd5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JJ1bkSzmdhggQdQYL4JRSDiUhglDxMCEWa4/jbQwzAV8L3zJz+zo7nae8aqs0SrmBUygahtBE2CmSnSp+esiGTdBmXIWs/1TPqFkDPRWySm93QGOwXQaS5yA1onqtmtZ64E52Dw1QWUdglx63vA6hSIG8V7U93RfceKQz23vEwmqRmTu7NaiotLGun2WIXOEPvNI/bczkn8m+abRVklOe/jWw8oCjqikegX9Sq6RGvUJTTjbuKSPp+o1+xWdxQ7c+Q+Sg1CNd7DWqLY+EdPyH10odGOXao4ygTHk6dU2Q6FrFUagkX/jgOACBPltxSjZz9R+ccytoFwFUSh7qLd3HuoBUwXBRDhGqXq9oKrsrq/XdnZ4D+pwowBm6lOOtsDMqePsHVXZk6/XIZgwdfExzF8bA83MAxwyXh+AK7XV6UFER7HYXIqKoBbc2l0PdMvaxeUKk9J8Onz0NX/VColUY/BBQisBx8YxwQZQZFNa9lIwmu0Q5zyhzB1cM6SbQe9WGc02/izHR31dr6telMlW5j/4ZrAZbB+6L27wuZTukfqwBC3LAByF99b2M9nw4ib5cKajLgu5NJc1tEw7/vCZWUZRqfJZZf/oqCItg1DjZ/7dOPoKr1gqKFwR/66QDLZYdXzI0b63LEXi7DERBEGG6M2ogtNkYwOerHYGMI/U/jNA+gOUgMVp4GjWCBVpWVgZ9QgZvGpuPGQcYi6K9ub4uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199015)(316002)(186003)(83380400001)(38100700002)(82960400001)(2906002)(5660300002)(4326008)(41300700001)(8936002)(33716001)(9686003)(6486002)(478600001)(26005)(6512007)(6506007)(6666004)(86362001)(8676002)(66556008)(66946007)(53546011)(66476007)(54906003)(6916009)(66899015)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJtRUxaSnl6NDlSb1llY01NWEk5WjQxb3haZzBMR1N4K3haNTdibWdPVmZ5?=
 =?utf-8?B?WG5DU0ZTd3RjOGcwWXl4N05ER0x0WG9Semt5RnhHMjhTTlV4QkJpUzdhaWtk?=
 =?utf-8?B?alBodjR0Z1B0YWV0d1Z5dVlncTNEek1wdFE0NGlUTVE2c3BXRVJFbkhhc2dY?=
 =?utf-8?B?amNnd2tQbHBqVzg5STJHRTZndjBVRlFRaExmdm5KK0IrMXlhZHVzK3c5SXNq?=
 =?utf-8?B?UllIVEJ6UjdtV3Z6eW1yNjBKOFZnekVwbDkzOVdXK1BYNUtVdnREekFpbHlV?=
 =?utf-8?B?ODZyQW5mKzRWazNmTTdHRTRrbTRhdFkxYkJudHVES2ppRVk2SW5QdXhhVnQx?=
 =?utf-8?B?S1hyNFJSYklCTEhITmUySEZKYzd3RFNYUTF1MlRWSnV1UXp5KzFPeEFMK3Uv?=
 =?utf-8?B?YVdxSVZYYzN2K3JaNFlXYlA3bFkreDloWll5S0NSWWVTdnNwTllNZlZyVll2?=
 =?utf-8?B?MWU0YnRiMlk4SkVUSmZsTWVHRDVTSUdmQkJqQ3RBL0FrOVdrOUV6bXZ5elIw?=
 =?utf-8?B?UzdTNi9YMVNDazcwZWpLQVNoWWpvbjFyOVJPNnQ4Y3l2TVlES3NPRnlkSlhH?=
 =?utf-8?B?L0wveGNQV3Y0eHlrWTJ3NHZyV29sQ1BIaTBCRWpRY0ZFRXkwaVBOMk5wOEE4?=
 =?utf-8?B?dzZ4UmZRd2tDNHp2S3hUajFDMk91YitQRW9UMGIyY0tRbm13aW40VDUrMXN0?=
 =?utf-8?B?TDAxNzhlcTJ4U1cvWmdGNzcxV2V2M0t3SkxrWjJqNzc5cFIwWUdreHEvVEJp?=
 =?utf-8?B?ZlJ4OHZHNXdRR2NrR25GaFNoMFUzY1hyMlNNQTZzK20rQkNBV3RNeXNxWkJL?=
 =?utf-8?B?VysvU0VGZDFvcFF0QlJjbVF5Z25BMmtnZmtudmQxZHl2ZURGaHJHb3BXQkQ3?=
 =?utf-8?B?OFJZQzFRMGpqaWhyQTQvc3FDVFh6K3BtMHBRbURMRzBMQk5Gc0I1dkNxWnFR?=
 =?utf-8?B?VE56WGllVkJMVVVCU2dsK29uc1U2UncyQnJFeWMzTmNMaXpKdk8yT2ZuL3lW?=
 =?utf-8?B?MDB4NWNIQlYvTkJXTXh3Y2I2QUJXNER2WTFYYnNLUFNLOXljSmR5SzVVZEFQ?=
 =?utf-8?B?N2xoRHJEb0ZnQ2pjVE9BbkZka1crcW9EcHp2S2haU3lGcmlxbnZ5UGw3Q0RT?=
 =?utf-8?B?T2phQWxsL3pQUEllVTZvd3U1dTl5b0FkSmR1cElIaEs3TXV6RGtvaVlraVY5?=
 =?utf-8?B?K1FqN2V0YXlUVVdSMERmQ0ZDRCtxbFlCbFI0WTVaeTNTRXR4UE40bXVFa2J1?=
 =?utf-8?B?aUVhWUxia0JnZWhPcEJzYllTT2JIblJXQjdwMkh0VU9tMDdPdGlvU3hsb1RM?=
 =?utf-8?B?bjdIQWFBZWN3MVZXS2ZGeHR6Y29Ed1dPTzVjanptdE9BdGpPTTJjT3Z2UWZu?=
 =?utf-8?B?MXprMERtUzl1Z1Bhajk2U1lxWHJ1ZUdrNW9tWExyK0w0SlFXakdtZ29yMVE4?=
 =?utf-8?B?V21kRzBiSGVpYmsvNmF2clpYWXJVeW54MmljTGxteDA1U3F1NHo2bkZnUnh3?=
 =?utf-8?B?Ni9FTVhtZ1lOUmZUQlBaTDY1cWw0WmlVaW52YldWRFl4cFRzL2xDNWxOL1ht?=
 =?utf-8?B?Sjk3MDZTei9PdXZ3bjZBcWF6ZFJ0UFg3TlRiL1lwb0JYTkZiUmJRSDMvV0t4?=
 =?utf-8?B?UzdWZjZTYmJjUVBDWmY4QzJvcXk4Rm9zQTZXUzFkLzJETVgwczA1VHNaaVNX?=
 =?utf-8?B?bzNicVpHT0w0T0lGaEJZeHlYUUVxUnpHckI2L3VGWGU2bmNDZ0FMb2tWdmsr?=
 =?utf-8?B?bFluK2xFQnRSaEY3WWE5WFlKd2ZBQ0ZDUHZjYVI1emVweVBWc0xBZXVoSWFa?=
 =?utf-8?B?MHRhbUg3Yjd5dWhRRElGeTJzYnZ0ZHZ3cjBiRERHV2Jyd2dGZFVRbTBlQi80?=
 =?utf-8?B?R0VaWXNKcVZpQ1FURnpZSVNRczVFN042TGRwOXh6N1d1ajdBMS9kRjRwMjAv?=
 =?utf-8?B?Rm9vcGFvWG9jSDljOGhxeXhJeVVvci9tWGFPMkNJbTdDbDZPRkhkWklvQTFs?=
 =?utf-8?B?RzZTaTYrbFUweWVDS05Ta1ZXdFdsckIzeWplamlvcW4rQTZPc044UFN1ajFB?=
 =?utf-8?B?S3pqVnEyY2lHNDJxS2xLTDdyYmNtRmdXQXZsWkhSR3RoV1NxcDBiZGpRR2JJ?=
 =?utf-8?B?c0tDbDgvMGw0cjBwMXFzbUNHNEZEWDN6Q05tT09BZkhta1hDVHFVbTRhWk1U?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cfxkKUh1D93qUZNyJNgSifL4qnDzWZMUsxI5DfKII1XVvGFKCduK1NAjyGysNbgqY7pkBuFYb0DtD7tL5jkEJrbJf82pXaKGWWQ4/Rve9Uks0047Y3wctJpZjuwrUdR/5vsgiHKgGQWdtvlcS7Ie0IUwdaBHbrCCVRAPMr3tpsDx7VpC2RCL3g3zZ9Owm77ebDZ5V7N90lIqmi2MM9EPcm7Tlufqa6zRGRrPrP/e85gRP2hsNiKsfF3QFmlbI98F4VT6YoSHYTHU5ww58hGQLYl0iEROSUV3VdPrG0CkZPUCfSJUENqga+f/Mjh9daN5UZMsSE4P/6NXpOqIYFgV4W7cHVF+R3LT3xRLlBJ89INz2XMueZuofDQ5FoYCxJTYJQ2zP53emPxMJvextG1FffaEIsFHC13ASHsT/6f6QHoVHS05Jw64Uro9/2zvMQeTWsU6/prLRDdBXpJpX5qjVTdSRAkP1RL4vAVzqCSCITgCozbdWAwhad5Ve7/Q8a5+g4NENaSkK3yNffwJ4qvKVAmR7KbyE8hZAHRBhpuizu5MZBDJ4Yh60blqPdfZVAQLDFNC7HN1zlJDNyNpyXA9lycPVLkrjUxWeHx05W/5kctitm/6vQPsnTlTnGOGANmVhkitrLyTQYfUDkpuzFHKmTjOft2iTCXZwSq6AJJd9oH3fWAhwpgNqOKMBIwhqNS+Z5QSpHvXKpAO6lsszVBOhCVaLc7jYn1wH30LnG0MJVQkRNkSay0w9TRJu+hZay69eu3BWa57IQj+74mI0amH0GmxDszKFc+oxcV8/1j/ZtP8k9lgRxC7q3S+/YfuUTCnbYoAp6R+6Kit91OrNZyaa6DXjgPJPcw4KYKm/A4q3eP5fe5hp+ieLbFb5UTNdWQQbrpk6jdYjz3oj9F+DW2FntfkksjPuyuPzWlldC2YF1g=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb60144-3e47-4090-7ce0-08daa6acd5a2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 08:37:27.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hRlOQbQsK6MGjXYVrYzNEDPlUeV0mLMc+uEY9EodPxpnZ1eKX/F9fkYXiwjLO6Pqv0lzEyLX3C6oz9n/zNeQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5459

On Tue, Oct 04, 2022 at 06:11:50PM +0200, Jan Beulich wrote:
> On 04.10.2022 17:36, Roger Pau Monne wrote:
> > The EFI memory map contains two memory types (EfiMemoryMappedIO and
> > EfiMemoryMappedIOPortSpace) used to describe IO memory areas used by
> > EFI firmware.
> > 
> > The current parsing of the EFI memory map is translating
> > EfiMemoryMappedIO to E820_RESERVED on x86.  This causes issues on some
> > boxes as the firmware is relying on using those regions to position
> > the BARs of devices being used (possibly during runtime) for the
> > firmware.
> > 
> > Xen will disable memory decoding on any device that has BARs
> > positioned over any regions on the e820 memory map, hence the firmware
> > will malfunction after Xen turning off memory decoding for the
> > device(s) that have BARs mapped in EfiMemoryMappedIO regions.
> > 
> > The system under which this was observed has:
> > 
> > EFI memory map:
> > [...]
> >  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> > [...]
> > 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> > 
> > The device behind this BAR is:
> > 
> > 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> > 	Subsystem: Super Micro Computer Inc Device 091c
> > 	Flags: fast devsel
> > 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> > 
> > For the record, the symptom observed in that machine was a hard freeze
> > when attempting to set an EFI variable (XEN_EFI_set_variable).
> > 
> > Fix by allowing BARs of PCI devices to be positioned over reserved
> > memory regions, but print a warning message about such overlap.
> 
> Somewhat hesitantly I might ack this change, but I'd like to give
> others (Andrew in particular) some time to voice their views. As
> said during the earlier discussion - I think we're relaxing things
> too much by going this route.

Another option would be to explicitly check in efi_memmap for
EfiMemoryMappedIO regions and BAR overlap and only allow those.  That
would be more cumbersome code wise AFAICT.

> > --- a/xen/arch/x86/pci.c
> > +++ b/xen/arch/x86/pci.c
> > @@ -98,3 +98,30 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
> >  
> >      return rc;
> >  }
> > +
> > +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> > +{
> > +    unsigned long mfn;
> > +
> > +    /*
> > +     * Check if BAR is not overlapping with any memory region defined
> > +     * in the memory map.
> > +     */
> > +    if ( is_memory_hole(start, end) )
> > +        return true;
> > +
> > +    /*
> > +     * Also allow BARs placed on reserved regions in order to deal with EFI
> > +     * firmware using EfiMemoryMappedIO regions to place the BARs of devices
> > +     * that can be used during runtime.  But print a warning when doing so.
> > +     */
> > +    for ( mfn = mfn_x(start); mfn <= mfn_x(end); mfn++ )
> > +        if ( !page_is_ram_type(mfn, RAM_TYPE_RESERVED) )
> > +            return false;
> 
> We don't need to be arch-independent here and hence instead of this
> (potentially long) loop can't we use a single call to e820_all_mapped()?

Sure, was searching for a range checking functions but wrongly looked
into mm.c instead of e820.  I would have to make the function
non-init, but I think that's fine.

Thanks, Roger.

